#!/usr/bin/env fish

# https://hub.docker.com/_/neo4j

# shellcheck disable=SC2121

set TAG community
set NAME neo4j-"$TAG"
set IMAGE neo4j:"$TAG"

docker pull "$IMAGE"
docker volume create "$NAME"
docker run -d \
    --name "$NAME" \
    --publish=7474:7474 \
    --publish=7687:7687 \
    --mount type=volume,source="$NAME",target=/data \
    neo4j:"$TAG"
