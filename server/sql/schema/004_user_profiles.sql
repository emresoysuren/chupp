-- +goose Up

CREATE TABLE user_profiles(
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    username TEXT UNIQUE NOT NULL,
    about TEXT,
    pp_url TEXT
);

-- +goose Down

DROP TABLE user_profiles;