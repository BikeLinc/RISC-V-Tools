# RISC-V Dev Tools for Linux

## Features
- Uses `riscv64-linux-gnu` toolchain for compilation
- QEMU user mode emulation for execution and debugging
- Linux syscalls supported
- GDB with TUI register view
- DDD visual debugging with source view and register windows

## Requirements
> Use `sudo apt <package>` to install.
- `riscv64-linux-gnu-gcc`
- `qemu-riscv64` 
- `gdb-multiarch`
- `ddd` (for visual debugging)

## Usage

```bash
# Build test.elf from test.s
./compile.sh test.s

# Run in QEMU
./run.sh test.elf

# Debug with GDB
./debug.sh test.elf

# Debug with GDB and DDD
./visual-debug.sh test.elf
```
