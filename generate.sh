#!/usr/bin/env sh
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

mkdir -p generated/product_service
protoc -I . --proto_path=./spec \
            --go_out=generated/product_service \
            --go_opt=paths=source_relative \
            --go-grpc_out=generated/product_service \
            --go-grpc_opt=paths=source_relative \
            product_service.proto
