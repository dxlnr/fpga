# FPGA Playground

This should serve as a playground programming a FPGA board.

Board:
- DIGIL 410-319-1 Arty A7-100T: Artix-7 FPGA-Development

Inspired by [fromthetransistor](https://github.com/geohot/fromthetransistor), 
the first project was to implement the Universal Asynchronous Reciever Transmitter (UART)
protocol. 

## Verilog

UART Protocol implementation with [Verilog](https://de.wikipedia.org/wiki/Verilog).
Development was done with Icarus Verilog and GTKWave, which is also used to run 
the tests.

Run the testbench using [iverilog](https://github.com/steveicarus/iverilog):
```bash
./simulate_verilog.sh
```

Todo: 
- Extend testbench for UART module.
- Test the implementation on the board.
