#!/bin/bash


ESP_ROOT=$HOME/Downloads/esp8266
RUST_XTENSA_ROOT=${ESP_ROOT}/rust-xtensa

# Xtensa esp8266 toolcahin https://docs.espressif.com/projects/esp8266-rtos-sdk/en/latest/get-started/linux-setup.html
export PATH=${ESP_ROOT}/xtensa-lx106-elf/bin:$PATH

# Precompiled Rust https://github.com/MabezDev/rust-xtensa
export RUSTC=${RUST_XTENSA_ROOT}/build/x86_64-unknown-linux-gnu/stage2/bin/rustc

# Precompiled llvm with clang https://github.com/MabezDev/llvm-project
export LLVM_ROOT=${ESP_ROOT}/llvm-project

export IDF_PATH=${ESP_ROOT}/esp32-hello/ESP8266_RTOS_SDK
export TARGET_DIR=target/xtensa-esp8266-none-elf/release
