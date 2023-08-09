-- +goose Up

CREATE TABLE sessions(
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL,
    session_key TEXT NOT NULL
);

-- +goose Down

DROP TABLE sessions;