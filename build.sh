#!/bin/bash

# assemble the code
nasm -f bin -o boot.bin boot.asm

# make some dummy data to load
dd if=/dev/zero of=dummy.bin bs=1k count=32

# append to the disk
cat dummy.bin >> boot.bin
