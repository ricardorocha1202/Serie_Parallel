module Serie_Paralelo (
    input clk,     // Clock input
    input reset,   // Reset = 1;
    input serial_in, // Serial Data Input
    output reg [3:0] parallel_out // Parallel Data Output
);

reg [3:0] shift_reg; // Shift register on 4 Bits

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 4'b0000; // Reset Shift register to 0
    end else begin
        shift_reg <= {shift_reg[2:0], serial_in}; // Shift and load the new serial bit
    end
end

assign parallel_out = shift_reg; // Parallel output is equal to the contents of the shift register

endmodule
