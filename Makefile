REGISTRY := gcr.io
REPOSITORY := <Your Repository>/go-mysql
TAG := latest

.PHONY: build-go
build-go:
	@REGISTRY=$(REGISTRY) REPOSITORY=$(REPOSITORY) TAG=$(TAG) scripts/build_go.sh
