#!/bin/bash -e 

iverilog -Wall -o tb_uart testbench/uart_tb.v && vvp tb_uart
