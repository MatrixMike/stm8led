#!/bin/bash
# build4target.sh
# was ./sdcc -mstm8 --std-c99 led.c --verbose --cyclomatic --print-search-dirs --fverbose-asm --debug --profile
sdcc -mstm8 --std-c99 led.c --verbose --cyclomatic --print-search-dirs --fverbose-asm --debug --profile

