module piso (
    input        clk,
    input        rst,
    input        load,
    input        en,
    input  [3:0] p_in,
    output wire  s_out
);

reg [3:0] q;

always @(posedge clk) begin

    if (rst)
        q <= 4'b0000;

    else if (load)
        q <= p_in;

    else if (en)
        q <= {1'b0, q[3:1]};

end

assign s_out = q[0];

endmodule
