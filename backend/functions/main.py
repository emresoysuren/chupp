# The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
from firebase_functions import https_fn, options

# The Firebase Admin SDK to access Cloud Firestore.
import firebase_admin
from firebase_admin import credentials, firestore
from firebase_admin import auth as fbauth

import google.cloud.firestore

cred = credentials.Certificate("firebase-adminsdk.json")
app = firebase_admin.initialize_app(cred)


db = firestore.client()

options.set_global_options(max_instances=10)


@https_fn.on_call()
def register_user(req: https_fn.CallableRequest) -> None:
    uid = get_uid(req.auth, block_anonymous=True)

    data: dict = req.data

    # Validate the parameters | Start

    if ("username" and "about") not in data:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.FAILED_PRECONDITION,
            message="The username and the about parameter must be provided.",
        )

    username = data["username"]
    about = data["about"]

    # Do something with the username and about
    if not isinstance(username, str) or not isinstance(about, str):
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.FAILED_PRECONDITION,
            message="The username and the about parameters must be string.",
        )

    if len(username) < 4:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.FAILED_PRECONDITION,
            message="Usernames must longer than 3 characters.",
        )

    # Validate the parameters | End

    # Profile Check | Start

    user_ref = db.collection("users").document(uid)
    user_doc = user_ref.get().to_dict()

    if user_doc:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.ALREADY_EXISTS,
            message="The username is already registered.",
        )

    # Profile Check | End

    # Check the Claimed Usernames | Start

    claimed_usernames_ref = db.collection("app-data").document("usernames")

    claimed_usernames_doc = claimed_usernames_ref.get().to_dict()

    claimed_usernames = None

    if claimed_usernames_doc:
        if "usernames" in claimed_usernames_doc:
            claimed_usernames: list = claimed_usernames_doc["usernames"]
            for claimed_username in claimed_usernames:
                if username == claimed_username:
                    raise https_fn.HttpsError(
                        code=https_fn.FunctionsErrorCode.ALREADY_EXISTS,
                        message="The username is already taken.",
                    )

    # Check the Claimed Usernames | End

    # Register the User | Start

    new_claimed_usernames: list = [username]

    if claimed_usernames:
        new_claimed_usernames.extend(claimed_usernames)

    claimed_usernames_ref.set(
        {"usernames": new_claimed_usernames},
        merge=True,
    )

    # Set user's details first. Because if something wrong happens, the user will be able to register again.

    user_details_ref = user_ref.collection("details")

    user_details_ref.document("followers").set({
        "followers": [],
    })

    user_details_ref.document("following").set({
        "following": [],
    })

    profile_data: dict = {
        "username": username,
        "about": about,
        "followers": 0,
    }

    user_ref.set(profile_data)

    # Register the User | End


def get_uid(auth: https_fn.AuthData, block_anonymous=False) -> str:
    """ 
        Throws an error if the user hasn't signed yet.
        And return the users uid.
    """

    if not auth:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.FAILED_PRECONDITION,
            message="The function must be called while authenticated.",
        )

    if block_anonymous and is_anonymous(fbauth.get_user(auth.uid)):
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.FAILED_PRECONDITION,
            message="The function can't be called by anonymous accounts.",
        )

    return auth.uid


def is_anonymous(user_record: fbauth.UserRecord):
    return not (user_record.email or user_record.phone_number or user_record.photo_url or user_record.display_name or user_record.provider_id)
