// Shift register 
//
// A Shift register is a cascade of flip-flops where the output pin q
// of one flop is connected to the data input pin (d) of the next.
// Because all flops work on the same clock, the bit array stored in the shift 
// register will shift by one position.
//
// MSB signifies the width of the shift register. If n is 4 then it becomes
// a 4-bit shift register.
//
module shift_reg #(parameter MSB=8) (
    input clk,
    input d,                    // Input data.
    input reset,                // Active-high reset to zero.
    input dir,                  // Left or Right shift.
    input ena,                  // Enable the shift register to be switch on/off.
    output reg [MSB-1:0] out); 
    
    always @ (posedge clk) begin
        if (!reset) out <= 0;
        else begin 
            if (ena) 
                case (dir)
                    0 : out <= {out[MSB-1:0], d};
                    1 : out <= {d, out[MSB-1:1]}; 
                endcase
            else out <= out;
        end
    end
endmodule

// 
module full_adder ( 
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout );
    
    assign sum = (a ^ b) ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule

// D Flip Flop module with a/synchronous reset enabled.
module D_FF_reset(
    input clk,
    input data,
    input reset_n, // asynchronously
    input clear_n, // synchronously
    output q );

    reg q_req, q_next;

    always @ (negedge clk, negedge reset_n) begin
        if (!reset_n) 
            q_req <= 1'b0;
        else
            q_req <= q_next;
    end

    always @ (data, clear_n) begin 
        q_next = q_req;
        if (!clear_n)
            q_next = 1'b0;
        else
            q_next = data;
    end

    assign q = q_req;
endmodule
