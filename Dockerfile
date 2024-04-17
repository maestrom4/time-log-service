
FROM golang:1.19 AS builder

WORKDIR /app


COPY go.* ./
RUN go mod download


COPY ./cmd/time-log-srv/ ./cmd/time-log-srv/


RUN CGO_ENABLED=0 GOOS=linux go build -o /time-log-srv ./cmd/time-log-srv/main.go


FROM alpine:latest


RUN apk --no-cache add ca-certificates

WORKDIR /


COPY --from=builder /time-log-srv /time-log-srv


EXPOSE 8080


CMD ["/time-log-srv"]
