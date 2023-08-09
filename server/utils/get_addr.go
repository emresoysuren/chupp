package utils

import (
	"fmt"
	"log"
	"os"
)

// Creates a server address with the
// PORT and IP variables in the .env
// file.
//
// IP is optional. But port must be
// exists.
func GetAddr() string {
	port, ok := os.LookupEnv("PORT")
	if !ok {
		log.Fatal("Couldn't find the PORT variable in the .env")
	}
	ip, ok := os.LookupEnv("IP")
	if ok {
		return fmt.Sprintf("%s:%s", ip, port)
	}
	return fmt.Sprintf(":%s", port)
}
