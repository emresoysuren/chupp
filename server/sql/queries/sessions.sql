-- name: CreateSession :one
INSERT INTO sessions (user_id, created_at, session_key)
VALUES ($1, NOW(), $2)
ON CONFLICT (user_id)
DO UPDATE
SET created_at = NOW(), session_key = $2
WHERE sessions.user_id = $1
RETURNING *;

-- name: GetSession :one
SELECT * FROM sessions
WHERE user_id = $1;

-- name: DeleteSession :exec
DELETE FROM sessions
WHERE user_id = $1;