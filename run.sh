#!/bin/sh

docker build -t go . && docker run -p 9191:8080 go