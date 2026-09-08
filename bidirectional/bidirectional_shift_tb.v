`include "bidirectional_shift.v"

module tb;

reg clk;
reg rst;
reg en;
reg dir;
reg serial_in_left;
reg serial_in_right;

wire [3:0] q;

bidirectional_shift dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .dir(dir),
    .serial_in_left(serial_in_left),
    .serial_in_right(serial_in_right),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;

    repeat (20)
        #5 clk = ~clk;
end

initial begin

    $monitor("Time=%0t | clk=%b | rst=%b | en=%b | dir=%b | left=%b | right=%b | q=%b",
              $time, clk, rst, en, dir,
              serial_in_left, serial_in_right, q);

    // Reset
    rst = 1;
    en  = 0;
    dir = 0;
    serial_in_left  = 0;
    serial_in_right = 0;

    #10;

    // ----------------
    // LEFT SHIFT
    // ----------------
    rst = 0;
    en  = 1;
    dir = 1;

    serial_in_left = 1;
    #10;

    serial_in_left = 0;
    #10;

    serial_in_left = 1;
    #10;

    serial_in_left = 1;
    #10;

    // ----------------
    // RIGHT SHIFT
    // ----------------
    dir = 0;

    serial_in_right = 1;
    #10;

    serial_in_right = 0;
    #10;

end

endmodule
