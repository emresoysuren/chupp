package controller

import (
	"context"
	"log"
	"time"

	"github.com/emresoysuren/chupp/server/internal/database"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
)

func (apiCfg *ApiConfig) createAuthToken(c context.Context, userID uuid.UUID) (string, error) {
	sessionKey, err := apiCfg.createNewSession(c, userID)
	if err != nil {
		return "", err
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user-id": userID,
		"exp":     time.Now().Add(apiCfg.AuthExp).Unix(),
	})

	return token.SignedString([]byte(sessionKey))
}

func (apiCfg *ApiConfig) createNewSession(c context.Context, userID uuid.UUID) (sessionKey string, err error) {
	sessionKey = "KEY-" + uuid.New().String()

	_, err = apiCfg.DB.CreateSession(context.Background(), database.CreateSessionParams{
		UserID:     userID,
		SessionKey: sessionKey,
	})
	if err != nil {
		return "", err
	}

	log.Println("Created a new seassion:", userID, ":", sessionKey)

	return sessionKey, nil
}
