module siso (
    input       en,
    input       rst,
    input       s_in,
    input       clk,
    output wire s_out
);

reg [3:0] q;

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (en)
        q <= {s_in, q[3:1]};
end

assign s_out = q[0];

endmodule


/*
2] Shift using individual assignments
always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (en) begin
        q[3] <= serial_in;
        q[2] <= q[3];
        q[1] <= q[2];
        q[0] <= q[1];
    end
end

This describes the same shift operation more explicitly.

3] Using shift operator >>
always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (en)
        q <= (q >> 1);
end

4] Parameterized SISO

Instead of fixing it to 4 bits:

module siso #(parameter WIDTH = 4) (
    input                  clk,
    input                  rst,
    input                  en,
    input                  serial_in,
    output                 serial_out
);

reg [WIDTH-1:0] q;

always @(posedge clk) begin
    if (rst)
        q <= 'b0;
    else if (en)
        q <= {serial_in, q[WIDTH-1:1]};
end

assign serial_out = q[0];

endmodule

This can create a 4-bit, 8-bit, 16-bit, etc. SISO by changing WIDTH.

5]4. Using a for loop
integer i;

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (en) begin
        for (i = 0; i < 3; i = i + 1)
            q[i] <= q[i+1];

        q[3] <= serial_in;
    end
end

Useful when the register is large or parameterized.
	*/

