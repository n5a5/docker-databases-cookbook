#!/usr/bin/env fish

# shellcheck disable=SC2121
# shellcheck disable=SC2086

# https://hub.docker.com/_/postgres

set TAG alpine
set NAME postgresql-"$TAG"
set IMAGE postgres:$TAG
set PORT 5432

docker pull $IMAGE
docker volume create "$NAME"
docker run -d \
  --name $NAME \
  -p $PORT:5432 \
  -e POSTGRES_PASSWORD=postgres \
  --mount type=volume,source=$NAME,target=/var/lib/postgresql/data \
  $IMAGE
