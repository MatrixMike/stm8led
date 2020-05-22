#!/bin/bash
# useOnTecra.sh
# consider adding --Werror
sdcc -mstm8 --std-c99 led.c    --verbose --cyclomatic --print-search-dirs --fverbose-asm --debug --profile 
echo "==== next one ===="
sdcc -mstm8 --std-c99 serial.c --verbose --cyclomatic --print-search-dirs --fverbose-asm --debug --profile
echo "==== next one ===="
sdcc -mstm8 --std-c99 serial2.c --verbose --cyclomatic --print-search-dirs --fverbose-asm --debug --profile
