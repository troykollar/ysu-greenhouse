module font16x32(
    input [7:0] character_code,
    input [9:0] char_start_x,
    input [9:0] char_start_y,
    input [9:0] x,
    input [9:0] y,
    output reg on_char
);

    reg [4:0] pixel_y;
    reg [3:0] pixel_x;

    //2's complement for local pixel location to save hardware
    always @(*)
        pixel_x = x + (~char_start_x + 1);

    always @(*)
        pixel_y = y + (~char_start_y + 1);

    reg [15:0] character_x; //Needs actual bits

    always @(*)
        case (pixel_y)
            5'd0    :    character_x = 16'd0000000000000000;
            5'd1    :    character_x = 16'd0000000000000000;
            5'd2    :    character_x = 16'd0000000000000000;
            5'd3    :    character_x = 16'd0000000000000000;
            5'd4    :    character_x = 16'd0001111111111000;
            5'd5    :    character_x = 16'd0011111111111100;
            5'd6    :    character_x = 16'd0110000000000110;
            5'd7    :    character_x = 16'd0110000000000110;
            5'd8    :    character_x = 16'd0110000000000110;
            5'd9    :    character_x = 16'd0110000000000110;
            5'd10   :    character_x = 16'd0110000000000110;
            5'd11   :    character_x = 16'd0110000000000110;
            5'd12   :    character_x = 16'd0110000000000110;
            5'd13   :    character_x = 16'd0110000000000110;
            5'd14   :    character_x = 16'd0110000000000110;
            5'd15   :    character_x = 16'd0110000000000110;
            5'd16   :    character_x = 16'd0110000000000110;
            5'd17   :    character_x = 16'd0110000000000110;
            5'd18   :    character_x = 16'd0110000000000110;
            5'd19   :    character_x = 16'd0110000000000110;
            5'd20   :    character_x = 16'd0110000000000110;
            5'd21   :    character_x = 16'd0110000000000110;
            5'd22   :    character_x = 16'd0110000000000110;
            5'd23   :    character_x = 16'd0110000000000110;
            5'd24   :    character_x = 16'd0110000000000110;
            5'd25   :    character_x = 16'd0110000000000110;
            5'd26   :    character_x = 16'd0011111111111100;
            5'd27   :    character_x = 16'd0001111111111000;
            5'd28   :    character_x = 16'd0000000000000000;
            5'd29   :    character_x = 16'd0000000000000000;
            5'd30   :    character_x = 16'd0000000000000000;
            5'd31   :    character_x = 16'd0000000000000000;
            default:     character_x = 16'd0000000000000000;
        endcase
        
        assign on_char = character_x[pixel_x];


endmodule