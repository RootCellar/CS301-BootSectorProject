#!/bin/bash

# assemble the code
nasm -f bin -o boot.bin boot.asm
nasm -f bin -o prg.bin prg.asm

#Everything else below was for testing
#-------------------------------------

# make some dummy data to load
#dd if=/dev/zero of=dummy.bin bs=1k count=32

#cat prg.bin >> boot.bin
# append to the disk
#cat dummy.bin >> boot.bin
