#!/bin/sh

cd `dirname $0`/../go

docker build -t $REGISTRY/$REPOSITORY:$TAG .
