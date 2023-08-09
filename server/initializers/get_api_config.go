package initializers

import "github.com/emresoysuren/chupp/server/controller"

func GetApiConfig() controller.ApiConfig {
	db := connectToDatabase()

	return controller.ApiConfig{
		DB: db,
	}
}
