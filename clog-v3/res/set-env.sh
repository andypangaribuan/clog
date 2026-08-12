PROJECT_DIR="${PROJECT_DIR:-$(pwd)}"
rustupHomeDir="${PROJECT_DIR}/.rustup"
mkdir -p "${rustupHomeDir}"

export TASKFILE_EXECUTOR=""
alias task="./.taskfile"

export RUSTUP_HOME="${rustupHomeDir}"
export CARGO_HOME="${PROJECT_DIR}/.cargo"

# --- Path Configuration ---
lib_path="${PROJECT_DIR}/.devbox/nix/profile/default/lib"
if [[ ":$LIBRARY_PATH:" != *":$lib_path:"* ]]; then
    export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}$lib_path"
fi

cargo_bin="${CARGO_HOME}/bin"
if [[ ":$PATH:" != *":$cargo_bin:"* ]]; then
    export PATH="$cargo_bin:$PATH"
fi

# --- Rust Development Settings ---
export RUST_BACKTRACE=1
export RUST_LOG=info
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

# pkg-config support for Nix libs
pkg_config_path="${lib_path}/pkgconfig"
if [[ -d "$pkg_config_path" && ":$PKG_CONFIG_PATH:" != *":$pkg_config_path:"* ]]; then
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$pkg_config_path"
fi
