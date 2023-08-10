package controller

import (
	"time"

	"github.com/emresoysuren/chupp/server/internal/database"
)

type ApiConfig struct {
	DB      *database.Queries
	AuthExp time.Duration
}
