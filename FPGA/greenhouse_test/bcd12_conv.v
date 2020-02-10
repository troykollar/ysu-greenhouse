module bcd12_conv(input wire clk,
                 input reg [11:0] value, 
                 output reg [3:0] ones,
                 output reg [3:0] tens,
                 output reg [3:0] huns,
                 output reg [3:0] thou
                 );

    reg [11:0] shift_val;
    shift_val = value;

    always @(posedge clk)
        if (ones >= 4'd5)   ones <= ones + 4'd3;
        else                ones <= {ones[3:1], shift_val[11]};

    always @(posedge clk)
        if (ones >= 4'd5)   shift_val <= shift_val;
        else                shift_val <= {shift_val[10:0], 1'b1};

endmodule