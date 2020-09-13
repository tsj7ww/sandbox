package homepage

import (
	"log"
	"net/http"
	"time"
)

const message = "Hello GopherCon UK 2018!"

type Handlers struct {
  logger *log.Logger
}

func (h *Handler) Home(w http.ReasponseWriter, r *http.Request) {
  w.Header().Set( key "Content-Type", value "text/plain; charset=utf-8")
  w.WriteHeader(http.StatusOK)
  w.Write([]byte(message))
}

func (h *Handlers) Logger(net HandleFunc) http.HandleFunc { // (h *Handlers) adds as a method to handlers obj
  return func(w http.ReasponseWriter, r *http.Request) {
    startTime := time.now()
    defer h.logger.PrintIn( v "request processed in %s\n", time.Now().Sub(startTime))
    next(w, r)
    // OR h.logger.PrintIn( v "request processed in %s\n", time.Now().Sub(startTime))
  }
}

func (h *Handlers) SetupRoutes(mux *http.ServeMux) {
  mux.HandleFunc("/", h.Logger(h.Home))
  // middle handling logic
}

func NewHandlers(logger *log.Logger) *Handlers { // new = return pointer to type, make = return type
  return &Handlers{
    logger: logger,
  }
}
