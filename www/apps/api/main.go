package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

const (
	SERVICE_NAME = "api"
)

func handleIndex(w http.ResponseWriter, r *http.Request) {
	hostname, _ := os.Hostname()
	fmt.Fprintf(w, "<h1>%s</h1>", hostname)
}

func main() {
	http.HandleFunc("/", handleIndex)
	log.Fatal(http.ListenAndServe(":80", nil))
}
