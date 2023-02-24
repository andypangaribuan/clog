APP_VERSION=$(shell cat app-version)

all: help

help:
	@echo '✦ pub-get'
	@echo '✦ analyze'
	@echo '→ generate-proto'
	@echo '→ generate-proto-golang'
	@echo '→ docker-build'
	@echo '→ clean'

pub-get:
	@fvm flutter pub get

analyze:
	@fvm flutter analyze

generate-proto:
	@protoc --dart_out=grpc:lib/proto -Iproto proto/google/protobuf/wrappers.proto
	@protoc --dart_out=grpc:lib/proto -Iproto proto/clog.proto

generate-proto-golang:
	@rm -rf ./proto/generated
	@protoc --go_out=. --go-grpc_out=. ./proto/*.proto

docker-build:
	@docker build --no-cache \
		-f Dockerfile \
		--build-arg APP_VERSION=${APP_VERSION} \
		-t gcd:clog-${APP_VERSION} .

clean:
	@docker stop clog || true
	@docker rm clog || true
	@docker rmi gcd:clog-${APP_VERSION} || true
