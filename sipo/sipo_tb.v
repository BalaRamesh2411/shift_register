`include "sipo.v"

module tb;

reg en;
reg rst;
reg s_in;
reg clk;
wire [3:0] q_out;

sipo dut (
    .en    (en),
    .rst   (rst),
    .s_in  (s_in),
    .clk   (clk),
    .q_out (q_out)
);

initial begin
    clk = 0;

    repeat (10) begin
        #5 clk = ~clk;
    end
end

initial begin

    // Initial values
    rst  = 1;
    en   = 0;
    s_in = 0;

    $monitor("Time=%0t | clk=%b | rst=%b | en=%b | s_in=%b | q=%b",
             $time, clk, rst, en, s_in, q_out);

    // Release reset
    #10;
    rst = 0;
    en  = 1;

    // Send 1
    s_in = 1;
    #10;

    // Send 0
    s_in = 0;
    #10;

    // Send 1
    s_in = 1;
    #10;

    // Send 1
    s_in = 1;
    #10;

end

endmodule
