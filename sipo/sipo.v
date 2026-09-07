module sipo (
    input        en,
    input        rst,
    input        s_in,
    input        clk,
    output wire [3:0] q_out
);

reg [3:0] q;

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (en)
        q <= {s_in, q[3:1]};
end

assign q_out = q;

endmodule
