package main

import (
	"errors"

	"github.com/emresoysuren/chupp/server/initializers"
	"github.com/emresoysuren/chupp/server/utils"
	"github.com/gofiber/fiber/v2"
)

func init() {
	initializers.LoadEnv()
}

func main() {
	apiCfg := initializers.GetApiConfig()

	app := fiber.New()

	app.Post("/login", apiCfg.Login)
	app.Post("/register", apiCfg.Register)

	app.Get("/", func(c *fiber.Ctx) error {
		return errors.New("text")
	})

	app.Listen(utils.GetAddr())
}
