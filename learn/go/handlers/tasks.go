package handlers

import (
	"log"
	"net/http"
	"task-manager/models"
)

var tasks = []models.Task{}

func TasksHandler(w http.ResponseWriter, r *http.Request) {
	log.Printf("Rendering tasks template with %d tasks", len(tasks))
	err := templates.ExecuteTemplate(w, "layout.html", tasks)
	if err != nil {
		log.Printf("Error executing template: %v", err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}

func AddTaskHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodPost {
		title := r.FormValue("title")
		if title != "" {
			task := models.Task{
				ID:    len(tasks) + 1,
				Title: title,
				Done:  false,
			}
			tasks = append(tasks, task)
			log.Printf("Added new task: %s", title)
		}
		http.Redirect(w, r, "/tasks", http.StatusSeeOther)
		return
	}
	http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
}
