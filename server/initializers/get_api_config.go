package initializers

import (
	"time"

	"github.com/emresoysuren/chupp/server/controller"
)

func GetApiConfig() controller.ApiConfig {
	db := connectToDatabase()

	return controller.ApiConfig{
		DB:      db,
		AuthExp: time.Hour * 24 * 7,
	}
}
