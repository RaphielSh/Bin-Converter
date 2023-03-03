#!/bin/bash

#apt install nasm

#pacman -S nasm


nasm -felf64 bin.asm && ld bin.o -o bin.exe && ./bin.exe

