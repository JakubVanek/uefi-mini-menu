#!/usr/bin/env bash

set -xe

cd "$(dirname "$0")"

cp ../target/x86_64-unknown-uefi/debug/umm.efi esp/efi/boot/bootx64.efi

qemu-system-x86_64 -enable-kvm \
    -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
    -drive if=pflash,format=raw,readonly=on,file=OVMF_VARS.fd \
    -drive format=raw,file=fat:rw:esp
