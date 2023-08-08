package main

import (
	"github.com/emresoysuren/chupp/server/initializers"
	"github.com/gofiber/fiber/v2"
)

func init() {
	initializers.LoadEnv()
}

func main() {

	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Listen(initializers.GetAddr())
}
