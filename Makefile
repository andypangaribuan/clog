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
	@taodev:clog-1.0.0 || true
	@docker build --no-cache -f Dockerfile -t taodev:clog-1.0.0 .

clean:
	@docker stop taodev-clog || true
	@docker rm taodev-clog || true
	@docker rmi taodev:clog-1.0.0 || true
