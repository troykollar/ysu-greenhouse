module val_to_seven_seg(input wire clk,
                        input wire [3:0] value,
                        output reg [6:0] display_segs
                        );

always @(posedge clk)
    if      (value == 4'h0)     display_segs <= 7'b1000000;
    else if (value == 4'h1)     display_segs <= 7'b1111001;
    else if (value == 4'h2)     display_segs <= 7'b0100100;
    else if (value == 4'h3)     display_segs <= 7'b0110000;
    else if (value == 4'h4)     display_segs <= 7'b0011001;
    else if (value == 4'h5)     display_segs <= 7'b0010010;
    else if (value == 4'h6)     display_segs <= 7'b0000010;
    else if (value == 4'h7)     display_segs <= 7'b1111000;
    else if (value == 4'h8)     display_segs <= 7'b0000000;
    else if (value == 4'h9)     display_segs <= 7'b0010000;
    else if (value == 4'hA)     display_segs <= 7'b0001000;
    else if (value == 4'hB)     display_segs <= 7'b0000011;
    else if (value == 4'hC)     display_segs <= 7'b1000110;
    else if (value == 4'hd)     display_segs <= 7'b0100001;
    else if (value == 4'he)     display_segs <= 7'b0000110;
    else if (value == 4'hf)     display_segs <= 7'b0001110;
    else                        display_segs <= 7'b1111111;

endmodule