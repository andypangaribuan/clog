APP_VERSION=$(shell cat app-version)

# enable make
all: help

help:
	@cat Makefile \
		| grep -B1 -E '^[a-zA-Z0-9_.-]+:.*' \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/\2###→ \1/p' \
		| column -t -s '###' \
		| sed 's/.*→ space.*//g'


#: update project dependencies
pub-get:
	@fvm flutter pub get

#: analyzing the project
analyze:
	@fvm flutter analyze

#: space
.:

#: generate proto files for dart
generate-proto:
	@protoc --dart_out=grpc:lib/proto -Iproto proto/google/protobuf/wrappers.proto
	@protoc --dart_out=grpc:lib/proto -Iproto proto/clog.proto

#: generate proto files for golang
generate-proto-golang:
	@rm -rf ./proto/generated
	@protoc --go_out=. --go-grpc_out=. ./proto/*.proto

#: space
.:

#: build docker image
docker-build:
	@docker build --no-cache \
		-f Dockerfile \
		--build-arg APP_VERSION=${APP_VERSION} \
		-t gcd:clog-${APP_VERSION} .

#: docker cleansing
clean:
	@docker stop clog || true
	@docker rm clog || true
	@docker rmi gcd:clog-${APP_VERSION} || true
