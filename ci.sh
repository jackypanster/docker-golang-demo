#!/usr/bin/env bash

#sudo docker build -t http.alpine .

env GOOS=linux GOARCH=amd64 go build -v -o app main.go

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

docker rmi $(docker images -q)

docker build -t api -f Dockerfile.busybox .

docker run -itd -p 1234:8080 api

rm -f app
