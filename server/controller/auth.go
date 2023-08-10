package controller

import (
	"net/http"

	"github.com/emresoysuren/chupp/server/internal/database"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

func (apiCfg *ApiConfig) Register(c *fiber.Ctx) error {

	body := struct {
		Username string `json:"username"`
		Email    string `json:"email"`
		Password string `json:"password"`
	}{}

	err := c.BodyParser(&body)
	if err != nil {
		return err
	}

	id := uuid.New()

	_, err = apiCfg.DB.CreateUser(c.Context(), database.CreateUserParams{
		ID:       id,
		Username: body.Username,
		Email:    body.Email,
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
