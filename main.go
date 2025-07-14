package main

import (
	"context"
	"database/sql"
	_ "embed"
	"log"

	"github.com/gin-gonic/gin"
	_ "modernc.org/sqlite"

	"moneysplitter/db/generated"
	"moneysplitter/handlers"
)

//go:embed db/schema.sql
var ddl string

func run() error {
	ctx := context.Background()

	db, err := sql.Open("sqlite", ":memory:")
	if err != nil {
		return err
	}

	// create tables
	if _, err := db.ExecContext(ctx, ddl); err != nil {
		return err
	}

	queries := moneysplitter.New(db)

	router := gin.Default()
	handlers.RegisterRoutes(router, queries)

	log.Println("Server running on http://localhost:8080")
	return router.Run("0.0.0.0:8080")
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}
