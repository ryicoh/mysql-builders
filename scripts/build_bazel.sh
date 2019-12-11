#!/bin/sh

cd `dirname $0`/../bazel

docker build -t $REGISTRY/$REPOSITORY:$TAG .
