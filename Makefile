

SHELL=/bin/bash -e -o pipefail
PWD = $(shell pwd)
BINARY_NAME=my_name


.PHONY: run
run: ##go run
	go run main.go

.PHONY: build
build:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY_NAME}-darwin ./...
	GOARCH=amd64 GOOS=linux go build -o ${BINARY_NAME}-linux ./...

build_and_run: build run

clean:
	go clean
	rm ${BINARY_NAME}-darwin
	rm ${BINARY_NAME}-linux
test:
	go test ./... -v -cover

dep:
	go mod download
vet:
	go vet ./...

help:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
