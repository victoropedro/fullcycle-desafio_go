FROM golang:1.18-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch
COPY --from=builder /app .
CMD ["/app"]