module val_to_seven_seg(input wire clk,
                        input wire [7:0] value,
                        output reg [6:0] display_segs
                        );

always @(posedge clk)
    if      (value == 8'd0)     display_segs <= 7'b1000000;
    else if (value == 8'd1)     display_segs <= 7'b1111001;
    else if (value == 8'd2)     display_segs <= 7'b0100100;
    else if (value == 8'd3)     display_segs <= 7'b0110000;
    else if (value == 8'd4)     display_segs <= 7'b0011001;
    else if (value == 8'd5)     display_segs <= 7'b0010010;
    else if (value == 8'd6)     display_segs <= 7'b0000010;
    else if (value == 8'd7)     display_segs <= 7'b1111000;
    else if (value == 8'd8)     display_segs <= 7'b0000000;
    else if (value == 8'd9)     display_segs <= 7'b0010000;
    else                        display_segs <= 7'b0000000;

endmodule