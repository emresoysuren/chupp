package initializers

import (
	"database/sql"
	"log"
	"os"

	"github.com/emresoysuren/chupp/server/internal/database"
	_ "github.com/lib/pq"
)

func connectToDatabase() *database.Queries {
	dbUrl, ok := os.LookupEnv("DB_URL")
	if !ok {
		log.Fatal("Couldn't find the DB_URL variable in the .env")
	}

	conn, err := sql.Open("postgres", dbUrl)
	if err != nil {
		log.Fatalln("Couldn't connect to database:", err)
	}

	return database.New(conn)
}
