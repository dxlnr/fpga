#!/usr/bin/env bash 
set -ex

yosys -p "synth_xilinx -flatten -nowidelut -abc9 -arch cx7 -top top; write_json attosoc.json" attosoc.v attosoc_top.v
