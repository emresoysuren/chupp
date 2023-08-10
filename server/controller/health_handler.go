package controller

import (
	"net/http"

	"github.com/gofiber/fiber/v2"
)

func (apiCfg *ApiConfig) HealthHandler(c *fiber.Ctx) error {

	return c.SendStatus(http.StatusOK)
}
