package utils

import (
	"context"
	"time"

	"github.com/emresoysuren/chupp/server/internal/database"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
)

func CreateAuthToken(db *database.Queries, userID uuid.UUID) (string, error) {
	sessionKey := createNewSession(db, userID)

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user-id": userID,
		"exp":     time.Now().Add(time.Hour * 24 * 7).Unix(),
	})

	return token.SignedString([]byte(sessionKey))
}

func createNewSession(db *database.Queries, userID uuid.UUID) (sessionKey string) {
	sessionKey = "KEY-" + uuid.New().String()

	db.CreateSession(context.Background(), database.CreateSessionParams{
		UserID:     userID,
		SessionKey: sessionKey,
	})

	return sessionKey
}
