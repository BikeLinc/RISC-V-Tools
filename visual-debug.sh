#!/bin/bash
# Visual debug RISC-V with DDD + QEMU
set -e

OUT="$1"

if [ -z "$OUT" ]; then
    echo "Usage: $0 <program.elf>"
    exit 1
fi

# Kill existing QEMU on port 1234
pkill -f "qemu-riscv64.*1234" 2>/dev/null && echo "[+] Killed existing QEMU" || echo "[-] No QEMU to kill"
sleep 1

echo "[+] Starting QEMU..."
qemu-riscv64 -g 1234 "$OUT" &
QEMU_PID=$!

echo "[+] Waiting for QEMU..."
sleep 2

echo "[+] Starting DDD..."
ddd --debugger gdb-multiarch --eval-command="file $OUT" --eval-command="target remote localhost:1234"
# Cleanup
kill $QEMU_PID 2>/dev/null && echo "[+] Cleaned up QEMU" || echo "[-] QEMU cleanup failed"
