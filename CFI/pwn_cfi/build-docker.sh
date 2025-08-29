#!/bin/bash
docker build --tag=cfi .
docker run -p 1337:1337 --rm --name=cfi cfi
