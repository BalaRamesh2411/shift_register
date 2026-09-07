`include "pipo.v"

module tb;

reg        clk;
reg        rst;
reg        en;
reg  [3:0] p_in;
wire [3:0] p_out;

// DUT
pipo dut (
    .clk   (clk),
    .rst   (rst),
    .en    (en),
    .p_in  (p_in),
    .p_out (p_out)
);


initial begin
    clk = 0;

    repeat(20) begin
        #5 clk = ~clk;
    end
end

initial begin

    $monitor("Time=%0t | clk=%b | rst=%b | en=%b | p_in=%b | p_out=%b",
             $time, clk, rst, en, p_in, p_out);

        rst  = 1;
    en   = 0;
    p_in = 4'b0000;

    #10;

      rst = 0;

      repeat (10) begin
	      #10
	  p_in = $random;
	  en=$random;
  end

    

end

endmodule
