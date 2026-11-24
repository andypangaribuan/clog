# Partner API

Treasury Partner API.

## Prerequisites

- [Devbox](https://www.jetify.com/devbox)

## Toolchain

- **Rust:** 1.100.0
- **Cargo:** Managed via `rustup`
- **Edition:** 2024

Rust is managed using `rustup` inside Devbox to ensure exact version parity with official Rust releases.

---

## Getting Started

1. Enter the Devbox environment:

    ```bash
    ./.taskfile shell
    ```

2. Build the project:

   ```bash
   cargo build
   ```

## Notes

- Do not install Rust globally; always use devbox shell.
- Rust versions are pinned via rustup, not nixpkgs, to avoid version lag.
- RUSTUP_HOME location is on `~/.devbox/global/rust-1.100/.rustup`
- CARGO_HOME location is on `~/.devbox/global/rust-1.100/.cargo`
- LIBRARY_PATH location is on `~/.devbox/global/rust-1.100/.devbox/nix/profile/default/lib`
