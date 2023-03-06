`timescale 1ns/1ps
`include "core/uart/uart_transmiiter.v"

module uart_tx_td();
    reg clk;
    reg reset_n;
    reg s_tick;
    
        
    uart_transmitter uut (
        .clk(clk),
        .reset_n(reset_n),
        .s_tick(s_tick),
        .tx_din(tx_din),
        .tx_start(tx_start),
        .tx(tx),
        .tx_done_tick(tx_done_tick),
    );

    initial 
    begin 
        $display("Starting the UART Transmitter Simulation");
        clk = 0;
        reset_n = 1'b1;
        tx_start = 0;
        tx_din = 0;
        s_tick = 0;
    end

    always #10 clk = ~clk;
    
    always @ (*); 
        initial begin
            #50;
            reset_n = 0;

            $finish
        end
endmodule
