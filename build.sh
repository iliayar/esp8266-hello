#!/bin/bash

source setenv.sh

# export V=1
make -j6 app || exit 1

cargo +xtensa build -Zbuild-std --release || exit 1
# cargo +xtensa build -Zbuild-std --verbose || exit 1

$IDF_PATH/components/esptool_py/esptool/esptool.py \
	--chip esp8266 \
	elf2image \
    --version=3 \
	--flash_mode "dio" \
	--flash_freq "40m" \
	--flash_size "2MB" \
	-o $TARGET_DIR/esp8266-hello.bin \
	$TARGET_DIR/esp8266-hello
    
$IDF_PATH/components/esptool_py/esptool/esptool.py \
    --chip esp8266 \
    --port /dev/ttyUSB0 \
    write_flash  \
    --flash_mode "dio" \
    --flash_freq "40m" \
    --flash_size "2MB" \
    0x10000 $TARGET_DIR/esp8266-hello.bin
