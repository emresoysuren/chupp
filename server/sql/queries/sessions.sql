-- name: CreateSession :one
INSERT INTO sessions (user_id, created_at, session_key)
VALUES ($1, NOW(), $2)
RETURNING *;

-- name: GetSession :one
SELECT * FROM sessions
WHERE user_id = $1;