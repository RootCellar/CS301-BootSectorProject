# CS301-BootSectorProject

Started: 9/27/2021

Info:
- x86_64 assembly
- "build.sh" builds the bootable disk. This includes the boot sector and hopefully another program
- "run.sh" boots the disk in a virtual environment using qemu

## Goal

This is intended to be a program that will run when a machine (real or virtual) boots.
The goal is that it will boot, read another program off of the disk (that does something interesting),
then execute it in a normal assembly environment.


