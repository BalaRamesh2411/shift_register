module bidirectional_shift (
    input clk,
    input rst,
    input en,
    input dir,
    input serial_in_left,
    input serial_in_right,
    output reg [3:0] q
);

always @(posedge clk) begin

    if (rst)
        q <= 4'b0000;

    else if (en) begin

        if (dir == 1'b0)
            // Right shift
            q <= {serial_in_right, q[3:1]};

        else
            // Left shift
            q <= {q[2:0], serial_in_left};

    end

end

endmodule
