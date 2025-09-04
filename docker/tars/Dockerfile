FROM golang:1.24.4-alpine AS builder

RUN apk add --no-cache git

RUN git clone https://github.com/twin-pick/tars /src

WORKDIR /src

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o ./tars cmd/main.go

FROM alpine:3.22.0

COPY --from=builder /src/tars .

CMD ["./tars"]
