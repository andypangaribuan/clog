#!/bin/bash

# Get the script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"


# Ensure output directory exists
mkdir -p ../src/grc

# Temporary directory for generating protos
GEN_DIR=".proto_gen_tmp"
mkdir -p "$GEN_DIR/src"

# Create a temporary Cargo.toml for proto generation
cat <<EOF > "$GEN_DIR/Cargo.toml"
[package]
name = "proto-gen"
version = "0.1.0"
edition = "2024"

[dependencies]
tonic-build = "0.12.3"
EOF

# Create a temporary src/main.rs for proto generation
cat <<EOF > "$GEN_DIR/src/main.rs"
fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::configure()
        .out_dir("../src/grc")
        .compile_protos(
            &["proto/grc-clog.proto"],
            &["proto"],
        )?;
    Ok(())
}
EOF

# Run the generator
cargo run --manifest-path "$GEN_DIR/Cargo.toml"

# Clean up
rm -rf "$GEN_DIR"

cd ..
rustfmt --edition 2024 src/grc/*.rs

echo -e "\n\nProto files generated into src/grc/"
