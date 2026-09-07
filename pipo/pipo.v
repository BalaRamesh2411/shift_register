module pipo (
    input        clk,
    input        rst,
    input        en,
    input  [3:0] p_in,
    output reg [3:0] p_out
);

always @(posedge clk) begin

    if (rst)
        p_out <= 4'b0000;

    else if (en)
        p_out <= p_in;

end

endmodule
