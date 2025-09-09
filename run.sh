#!/bin/bash
# Run RISC-V ELF in QEMU user mode
set -e

OUT="$1"

if [ -z "$OUT" ]; then
    echo "Usage: $0 <program.elf>"
    exit 1
fi

echo "[+] Running $OUT..."
qemu-riscv64 "$OUT"