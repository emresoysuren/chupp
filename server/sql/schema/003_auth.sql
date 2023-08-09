-- +goose Up

CREATE TABLE auth(
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    password TEXT NOT NULL
);

-- +goose Down

DROP TABLE auth;