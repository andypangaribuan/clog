FROM rust:1.96.0-slim AS chef
RUN cargo install cargo-chef
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
RUN apt-get update && apt-get install -y \
    musl-tools \
    pkg-config \
    libssl-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN rustup target add x86_64-unknown-linux-musl

COPY --from=planner /app/recipe.json recipe.json
# build dependencies (caching layer)
RUN cargo chef cook --release --target x86_64-unknown-linux-musl --recipe-path recipe.json

# build application
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl --bin clog



FROM gcr.io/distroless/static:nonroot
LABEL maintainer="Andy Pangaribuan <iam.pangaribuan@gmail.com>"
WORKDIR /app

ARG APP_VERSION=unknown
ENV APP_VERSION=${APP_VERSION}

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/clog /app/x
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/sleep_bin /app/sleep

USER nonroot:nonroot

ENTRYPOINT ["/app/x"]
