-- name: CreateUser :exec
INSERT INTO users (id, created_at, updated_at, email)
VALUES ($1, NOW(), NOW(), $2);

-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = $1;