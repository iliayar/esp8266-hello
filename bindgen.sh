#!/usr/bin/env bash

set -e

source setenv.sh

COMPS=${IDF_PATH}/components
# SYSROOT=${ESP_TOOLCHAIN}/xtensa-lx106-elf/sys-include

BINDGEN=bindgen
LIBCLANG_PATH=${LLVM_ROOT}/llvm/build/lib
CLANG_FLAGS="\
    -I${PWD}/build/include \
    -D__bindgen \
    -target xtensa \
    -x c"
    # -I${ESP_ROOT}/xtensa-lx106-elf/xtensa-lx106-elf/include \
    # -I${ESP_ROOT}/xtensa-lx106-elf/xtensa-lx106-elf/sys-include \

INCLUDE_FOLDERS=(
    include
    platform_include
    freertos
    private
)

for FOLDER in ${INCLUDE_FOLDERS[@]}; do
    for INC in `find ${COMPS} -type d -name "${FOLDER}"`; do
        # echo $INC
        CLANG_FLAGS+=" -I$INC"
    done
done

function generate_bindings ()
{
    declare -r crate=$1

    cd "$crate"

    LIBCLANG_PATH="$LIBCLANG_PATH" \
        "$BINDGEN" \
        --use-core \
        --no-layout-tests \
        $BINDGEN_FLAGS \
        --output src/bindings.rs \
        src/bindings.h \
        -- $CLANG_FLAGS

    rustup run nightly rustfmt src/bindings.rs
}

generate_bindings $@
