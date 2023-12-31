// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.19.1
// source: user_profiles.sql

package database

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

const createUserProfile = `-- name: CreateUserProfile :one
INSERT INTO user_profiles (user_id, created_at, updated_at, username, about, pp_url)
VALUES ($1, NOW(), NOW(), $2, $3, $4)
RETURNING user_id, created_at, updated_at, username, about, pp_url
`

type CreateUserProfileParams struct {
	UserID   uuid.UUID
	Username string
	About    sql.NullString
	PpUrl    sql.NullString
}

func (q *Queries) CreateUserProfile(ctx context.Context, arg CreateUserProfileParams) (UserProfile, error) {
	row := q.db.QueryRowContext(ctx, createUserProfile,
		arg.UserID,
		arg.Username,
		arg.About,
		arg.PpUrl,
	)
	var i UserProfile
	err := row.Scan(
		&i.UserID,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Username,
		&i.About,
		&i.PpUrl,
	)
	return i, err
}

const getUserProfile = `-- name: GetUserProfile :one
SELECT user_id, created_at, updated_at, username, about, pp_url FROM user_profiles
WHERE user_id = $1
`

func (q *Queries) GetUserProfile(ctx context.Context, userID uuid.UUID) (UserProfile, error) {
	row := q.db.QueryRowContext(ctx, getUserProfile, userID)
	var i UserProfile
	err := row.Scan(
		&i.UserID,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.Username,
		&i.About,
		&i.PpUrl,
	)
	return i, err
}
