#!/bin/bash

#apt install nasm

#pacman -S nasm


nasm -felf32 bin.asm && ld -m elf_i386 bin.o -o bin.exe && ./bin.exe

