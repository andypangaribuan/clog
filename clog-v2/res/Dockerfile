ARG GO_VERSION=1.25.4-alpine3.22

FROM golang:${GO_VERSION} AS builder

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
LABEL maintainer="Andy Pangaribuan <iam.pangaribuan@gmail.com>"

ARG TZ=Asia/Jakarta
ENV TZ=${TZ}

ARG APP_VERSION=unknown
ENV APP_VERSION=${APP_VERSION}

COPY --from=builder /.goapp /goapp
CMD ["/goapp"]
