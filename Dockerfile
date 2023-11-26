FROM golang:1.7 AS build
WORKDIR /app
COPY . /app
RUN go build -o api desafio.go

FROM scratch
WORKDIR /app
COPY --from=build ./app/api ./
CMD [ "./api" ]