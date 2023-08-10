package controller

import (
	"context"
	"errors"
	"os"
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
		"session": sessionKey,
	})

	secretKey, ok := os.LookupEnv("SECRET_KEY")
	if !ok {
		return "", errors.New("couldn't find the SECRET_key variable in the .env")
	}

	return token.SignedString([]byte(secretKey))
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

	return sessionKey, nil
}

func (apiCfg *ApiConfig) endSession(c context.Context, userID uuid.UUID) error {
	return apiCfg.DB.DeleteSession(c, userID)
}

func (apiCfg *ApiConfig) getSession(c context.Context, userID uuid.UUID) (database.Session, error) {
	session, err := apiCfg.DB.GetSession(c, userID)
	if err != nil {
		return database.Session{}, err
	}

	return session, nil
}
