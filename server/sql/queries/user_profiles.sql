-- name: CreateUserProfile :one
INSERT INTO user_profiles (user_id, created_at, updated_at, username, about, pp_url)
VALUES ($1, NOW(), NOW(), $2, $3, $4)
RETURNING *;

-- name: GetUserProfile :one
SELECT * FROM user_profiles
WHERE user_id = $1;