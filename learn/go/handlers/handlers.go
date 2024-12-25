// handlers/handlers.go
package handlers

import (
	"html/template"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

var templates *template.Template

func init() {
	// Log the current working directory
	pwd, err := os.Getwd()
	if err != nil {
		log.Printf("Error getting working directory: %v", err)
	}
	log.Printf("Current working directory: %s", pwd)

	// List files in templates directory
	files, err := filepath.Glob("templates/*.html")
	if err != nil {
		log.Printf("Error finding template files: %v", err)
	}
	log.Printf("Found template files: %v", files)

	// Parse templates with error checking
	templates, err = template.ParseGlob(filepath.Join("templates", "*.html"))
	if err != nil {
		log.Printf("Error parsing templates: %v", err)
	}
}

func renderTemplate(w http.ResponseWriter, tmpl string, data interface{}) {
	log.Printf("Attempting to render template: %s", tmpl)
	if templates == nil {
		log.Printf("Templates are nil!")
		http.Error(w, "Templates not loaded", http.StatusInternalServerError)
		return
	}

	err := templates.ExecuteTemplate(w, tmpl, data)
	if err != nil {
		log.Printf("Error executing template %s: %v", tmpl, err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("HomeHandler called, redirecting to /tasks")
	http.Redirect(w, r, "/tasks", http.StatusSeeOther)
}
