-- name: CreateAuth :one
INSERT INTO auth (user_id, created_at, updated_at, password)
VALUES ($1, NOW(), NOW(), $2)
RETURNING *;

-- name: GetAuth :one
SELECT * FROM auth
WHERE user_id = $1;