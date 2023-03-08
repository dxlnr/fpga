#!/bin/bash -e 

iverilog -Wall -o tb_uart_rx_tx_only testbench/uart_rx_tx_only_tb.v && vvp tb_uart_rx_tx_only

# Clean up
rm -rf tb_uart_rx_tx_only
