package main

import (
  // std
  "fmt"
  "os"
  "log"
  "io/ioutil"
  // web
  "encoding/json"
  "net/http"
  // aws
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
  //udef
	"sample_microservice/homepage"
	"sample_microservice/server"
)

var {
  GcukCertFile    = os.Getenv("GCUK_CERT_FILE")
  GcukKeyFile     = os.Getenv("GCUK_KEY_FILE")
  GcukServiceAddr = os.Getenv("GCUK_SERVICE_ADDR")
}

func main() {
  logger := log.New(os.Stdout, prefix "gcuk ", log.LstdFlags | log.Lshortfile)

  h := homepage.NewHandlers(logger)

  mux := http.NewServeMux()
  h.SetupRoutes(mux)

  srv := NewServer(mux, GcukServiceAddr)

  logger.PrintIn( v "server starting")
  err := svr.ListenAndServeTLS(GcukCertFile, GcukKeyFile)
  if err != nil {
    logger.Fatalf( format "server failed to start: %v", err)
  }
}
