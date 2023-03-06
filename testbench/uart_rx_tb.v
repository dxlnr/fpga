`timescale 1ns/1ps
`include "core/uart/uart_receiver.v"

module uart_rx_td();
    reg clk;

        
    uart_receiver uut (
    );

    initial 
    begin 
        $display("Starting the UART Receiver Simulation");
        clk = 0;
    end

    always #10 clk = ~clk;
    
    always @ (*); 
        initial begin 
            
        end
endmodule
