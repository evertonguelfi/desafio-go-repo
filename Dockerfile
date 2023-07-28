FROM golang:1.21-rc-alpine AS builder

WORKDIR /usr/src/app

COPY hello-fullcycle.go .

COPY go.mod .

RUN go mod download && go mod verify

RUN go build hello-fullcycle.go

FROM scratch
WORKDIR /appgo
COPY --from=builder /usr/src/app/hello-fullcycle .

ENTRYPOINT [ "/appgo/hello-fullcycle" ]

