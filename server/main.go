package main

import (
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

	app.Post("/register", apiCfg.Register)
	app.Post("/login", apiCfg.Login)

	app.Get("/health", apiCfg.HealthHandler)

	app.Listen(utils.GetAddr())
}
