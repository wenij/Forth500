#!/bin/sh
# NOTE: ORG=0xb9000 or ORG=0xb0000
ORG=0xb9000

grep -q '\t\torg\t\$b9000' Forth500.s || echo '*** ERROR ***: FIRST MUST CHANGE: Forth500.s org $b9000'

./XASM Forth500.s -O -L -S -TB
tail -c +7 Forth500.OBJ > Forth500.bin
bin2wav --pc=E500 --type=bin --addr=$ORG -dINV --sync=3 Forth500.bin
