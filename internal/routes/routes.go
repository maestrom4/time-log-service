package routes

import (
	"net/http"
	"time-log-srv/internal/app"

	"github.com/graph-gophers/graphql-go/relay"
)

func Configure(mux *http.ServeMux) {
	mux.Handle("/graphql", &relay.Handler{Schema: app.Schema})
}
