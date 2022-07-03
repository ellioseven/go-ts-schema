#!/usr/bin/env sh

docker-compose run --rm node yarn install

docker-compose run --rm oapi generate \
    -i /local/schema.yml \
    -g go \
    -o /local/out/go \
    -t /local/schema/templates/go \
    --global-property models \
    --additional-properties packageName=schema

docker-compose run --rm go go fmt ./out/go

docker-compose run --rm oapi generate \
    -i /local/schema.yml \
    -g typescript-node \
    -o /local/out/ts/out \
    -t /local/schema/templates/ts

docker-compose run --rm node npx -y prettier ./out/ts -w
docker-compose run --rm node yarn build