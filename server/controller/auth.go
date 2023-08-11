package controller

import (
	"errors"
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/emresoysuren/chupp/server/internal/database"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

func (apiCfg *ApiConfig) Register(c *fiber.Ctx) error {

	body := struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}{}

	err := c.BodyParser(&body)
	if err != nil {
		return err
	}

	id := uuid.New()

	_, err = apiCfg.DB.CreateUser(c.Context(), database.CreateUserParams{
		ID:    id,
		Email: body.Email,
	})
	if err != nil {
		return err
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)
	if err != nil {
		return err
	}

	_, err = apiCfg.DB.CreateAuth(c.Context(), database.CreateAuthParams{
		UserID:   id,
		Password: string(hash),
	})
	if err != nil {
		return err
	}

	return apiCfg.Login(c)
}

func (apiCfg *ApiConfig) Login(c *fiber.Ctx) error {

	body := struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}{}

	err := c.BodyParser(&body)
	if err != nil {
		return err
	}

	user, err := apiCfg.DB.GetUserByEmail(c.Context(), body.Email)
	if err != nil {
		return err
	}

	userAuth, err := apiCfg.DB.GetAuth(c.Context(), user.ID)
	if err != nil {
		return err
	}

	err = bcrypt.CompareHashAndPassword([]byte(userAuth.Password), []byte(body.Password))
	if err != nil {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	tokenString, err := apiCfg.createAuthToken(c.Context(), user.ID)
	if err != nil {
		return err
	}

	c.Cookie(&fiber.Cookie{
		Name:        "Authorization",
		Value:       tokenString,
		MaxAge:      int(apiCfg.AuthExp.Seconds()),
		Secure:      true,
		HTTPOnly:    true,
		SessionOnly: false,
	})

	return c.SendStatus(http.StatusAccepted)
}

func (apiCfg *ApiConfig) Logout(c *fiber.Ctx) error {
	tokenString := c.Cookies("Authorization")
	if tokenString == "" {
		return c.SendStatus(http.StatusUnauthorized)
	}

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {

		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		secretKey, ok := os.LookupEnv("SECRET_KEY")
		if !ok {
			return "", errors.New("couldn't find the SECRET_key variable in the .env")
		}

		return []byte(secretKey), nil
	})
	if err != nil {
		return c.SendStatus(http.StatusExpectationFailed)
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	sessionString, ok := claims["session"].(string)
	if !ok {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	userIDString, ok := claims["user-id"].(string)
	if !ok {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	userID, err := uuid.Parse(userIDString)
	if err != nil {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	exp, ok := claims["exp"].(float64)
	if !ok {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	currentSession, err := apiCfg.getSession(c.Context(), userID)
	if err != nil {
		return err
	}

	if time.Now().Unix() > int64(exp) {
		return c.SendStatus(http.StatusNotAcceptable)
	}
	if sessionString != currentSession.SessionKey {
		return c.SendStatus(http.StatusNotAcceptable)
	}

	c.ClearCookie("Authorization")

	return apiCfg.endSession(c.Context(), userID)
}
