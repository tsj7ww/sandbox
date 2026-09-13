// main.go
package main

import (
	"log"
	"net/http"
	"task-manager/handlers"
)

func main() {
	// Initialize router
	mux := http.NewServeMux()

	// Serve static files
	fs := http.FileServer(http.Dir("static"))
	mux.Handle("/static/", http.StripPrefix("/static/", fs))

	// Register routes with logging
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Received request for path: %s", r.URL.Path)
		handlers.HomeHandler(w, r)
	})

	mux.HandleFunc("/tasks", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Received request for tasks page")
		handlers.TasksHandler(w, r)
	})

	mux.HandleFunc("/tasks/add", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Received add task request")
		handlers.AddTaskHandler(w, r)
	})

	log.Println("Server starting on :8080...")
	if err := http.ListenAndServe(":8080", mux); err != nil {
		log.Fatal(err)
	}
}
