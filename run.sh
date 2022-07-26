#!/bin/sh

docker build -t golang . && docker run -p 9191:8080 golang