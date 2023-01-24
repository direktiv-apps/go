FROM golang:1.18.2-alpine as build

COPY build/app/go.mod src/go.mod
COPY build/app/cmd src/cmd/
COPY build/app/models src/models/
COPY build/app/restapi src/restapi/

RUN cd src/ && go mod tidy

RUN cd src && \
    export CGO_LDFLAGS="-static -w -s" && \
    go build -tags osusergo,netgo -o /application cmd/golang-server/main.go; 

FROM golang:1.19-buster

RUN go install golang.org/dl/go1.18@latest && go1.18 download
RUN go install golang.org/dl/go1.17@latest && go1.17 download

RUN apt-get update && apt-get install zip -y

# DON'T CHANGE BELOW 
COPY --from=build /application /bin/application

EXPOSE 8080

CMD ["/bin/application", "--port=8080", "--host=0.0.0.0", "--write-timeout=0"]