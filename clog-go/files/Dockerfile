ARG GO_VERSION=1.20

FROM golang:${GO_VERSION}-alpine as builder

WORKDIR /goapp
COPY . .

RUN go mod tidy
RUN go mod vendor
RUN CGO_ENABLED=0 \
    GO111MODULE=on \
    GOOS=linux \
    GOARCH=amd64 \
    go build -mod vendor -ldflags="-w -s" -o /.goapp



FROM gcr.io/distroless/static
LABEL maintainer="Andy Pangaribuan <andypangaribuan@treasury.id>"

ENV TZ=Asia/Jakarta

ARG APP_VERSION=unknown
ENV APP_VERSION=${APP_VERSION}

COPY --from=builder /.goapp /clog
CMD ["/clog"]
