// FIFO Data Buffer Module 
//
// Configurable in address size and data size.
// Serves as an intermediary for the uart protocol to allow a device with 
// different speed to communicate with the uart receiver and transmitter.
//
module fifo_buffer 
    #(parameter D_BITS=8,           // Data bits
                BYTE_SIZE=8         // Address bits define the size of the buffer.
    )(
    input clk,                      // input wire clk
    input reset_n,                  // 
    input [D_BITS - 1:0] din,       // input wire [7 : 0] din
    input wr_en,                    // input wire wr_en
    input rd_en,                    // input wire rd_en
    output [D_BITS - 1:0] dout,     // output wire [7 : 0] dout
    output full,                    // output wire full
    output empty,                   // output wire tx_fifo_empty 
    );    
    
    reg [2:0] head_ptr, tail_ptr;
    reg [2:0] counter;

    reg [D_BITS - 1:0] mem [0:BYTE_SIZE - 1];
    integer i;

    always @ (posedge clk, negedge reset_n) begin 
        if (!reset_n) begin 
            head_ptr <= 0;
            tail_ptr <= 0;
            counter <= 0;
            for (i = 0; i < BYTE_SIZE; i = i + 1) begin 
                mem[i] <= 0;
            end
        end else begin 
            if (wr_en) begin 
                mem[head_ptr] <= din;
                counter <= counter + 1;
                head_ptr <= head_ptr + 1;
            end
            if (rd_en) begin 
                counter <= counter - 1;
                tail_ptr <= tail_ptr + 1;
            end
        end
    end

    // output logic section
    assign dout = (rd_en & ~wr_en) ? mem[tail_ptr] : 0;
    assign full = ((head_ptr == tail_ptr) && (counter == BYTE_SIZE)) ? 1 : 0;
    assign empty = (((head_ptr == tail_ptr) && (counter == 0)) ? 1 : 0;
    
endmodule;
