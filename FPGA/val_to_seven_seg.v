module val_to_seven_seg(input wire clk,
                        input wire [7:0] value,
                        output reg [6:0] display_segs
                        );

always @(posedge clk)
    if      (value == 8'd0)     display_segs <= 7'b1000000;
    else if (value == 8'd1)     display_segs <= 7'b1111001;
    else if (value == 8'd2)     display_segs <= 7'b1011011;
    else                        display_segs <= 7'b0000000;

endmodule