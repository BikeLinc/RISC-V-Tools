#!/bin/bash
# Compile RISC-V for Linux user mode
set -e

SRC="$1"
OUT="${SRC%.s}.elf"

if [ -z "$SRC" ]; then
    echo "Usage: $0 <source.s>"
    exit 1
fi

riscv64-linux-gnu-gcc -g -static -o "$OUT" "$SRC" && echo "[+] Compiled $SRC to $OUT" || echo "[-] Compilation failed"
