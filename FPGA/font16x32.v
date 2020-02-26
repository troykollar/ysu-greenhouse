module font16x32 #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input [7:0] character_code,
    input [9:0] x,
    input [9:0] y,
    output wire on_char
);

    integer char_width = 16;
    integer char_height = 32;

    reg [4:0] pixel_y;
    reg [3:0] pixel_x;

    //2's complement for local pixel location to save hardware
    always @(*)
        pixel_x = x + (~x1 + 1);

    always @(*)
        pixel_y = y + (~y1 + 1);

    //On/Off bits of each pixel in character depnding on x location
    reg [0:15] character_x;

    always @(*)
        case (character_code)
            8'd0    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0001111111111000;
                    5'd2	:	character_x = 	16'b0011111111111100;
                    5'd3	:	character_x = 	16'b0111000000001110;
                    5'd4	:	character_x = 	16'b0110000000010110;
                    5'd5	:	character_x = 	16'b0110000000010110;
                    5'd6	:	character_x = 	16'b0110000000010110;
                    5'd7	:	character_x = 	16'b0110000000100110;
                    5'd8	:	character_x = 	16'b0110000000100110;
                    5'd9	:	character_x = 	16'b0110000000100110;
                    5'd10	:	character_x = 	16'b0110000001000110;
                    5'd11	:	character_x = 	16'b0110000001000110;
                    5'd12	:	character_x = 	16'b0110000001000110;
                    5'd13	:	character_x = 	16'b0110000010000110;
                    5'd14	:	character_x = 	16'b0110000010000110;
                    5'd15	:	character_x = 	16'b0110000010000110;
                    5'd16	:	character_x = 	16'b0110000100000110;
                    5'd17	:	character_x = 	16'b0110000100000110;
                    5'd18	:	character_x = 	16'b0110000100000110;
                    5'd19	:	character_x = 	16'b0110001000000110;
                    5'd20	:	character_x = 	16'b0110001000000110;
                    5'd21	:	character_x = 	16'b0110001000000110;
                    5'd22	:	character_x = 	16'b0110010000000110;
                    5'd23	:	character_x = 	16'b0110010000000110;
                    5'd24	:	character_x = 	16'b0110010000000110;
                    5'd25	:	character_x = 	16'b0110100000000110;
                    5'd26	:	character_x = 	16'b0110100000000110;
                    5'd27	:	character_x = 	16'b0110100000000110;
                    5'd28	:	character_x = 	16'b0111000000001110;
                    5'd29	:	character_x = 	16'b0011111111111100;
                    5'd30	:	character_x = 	16'b0001111111111000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:     character_x =  16'b0000000000000000;
                endcase
            8'd1    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000
                    5'd1	:	character_x = 	16'b0000000110000000
                    5'd2	:	character_x = 	16'b0000001110000000
                    5'd3	:	character_x = 	16'b0000011110000000
                    5'd4	:	character_x = 	16'b0000000110000000
                    5'd5	:	character_x = 	16'b0000000110000000
                    5'd6	:	character_x = 	16'b0000000110000000
                    5'd7	:	character_x = 	16'b0000000110000000
                    5'd8	:	character_x = 	16'b0000000110000000
                    5'd9	:	character_x = 	16'b0000000110000000
                    5'd10	:	character_x = 	16'b0000000110000000
                    5'd11	:	character_x = 	16'b0000000110000000
                    5'd12	:	character_x = 	16'b0000000110000000
                    5'd13	:	character_x = 	16'b0000000110000000
                    5'd14	:	character_x = 	16'b0000000110000000
                    5'd15	:	character_x = 	16'b0000000110000000
                    5'd16	:	character_x = 	16'b0000000110000000
                    5'd17	:	character_x = 	16'b0000000110000000
                    5'd18	:	character_x = 	16'b0000000110000000
                    5'd19	:	character_x = 	16'b0000000110000000
                    5'd20	:	character_x = 	16'b0000000110000000
                    5'd21	:	character_x = 	16'b0000000110000000
                    5'd22	:	character_x = 	16'b0000000110000000
                    5'd23	:	character_x = 	16'b0000000110000000
                    5'd24	:	character_x = 	16'b0000000110000000
                    5'd25	:	character_x = 	16'b0000000110000000
                    5'd26	:	character_x = 	16'b0000000110000000
                    5'd27	:	character_x = 	16'b0000000110000000
                    5'd28	:	character_x = 	16'b0000000110000000
                    5'd29	:	character_x = 	16'b0001111111111000
                    5'd30	:	character_x = 	16'b0001111111111000
                    5'd31	:	character_x = 	16'b0000000000000000
                    default:     character_x =  16'b0000000000000000;
                endcase
            8'd2    :
                case (pixel_y)

            8'd3    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000
                    5'd1	:	character_x = 	16'b0111111111111110
                    5'd2	:	character_x = 	16'b0111111111111110
                    5'd3	:	character_x = 	16'b0000000000000110
                    5'd4	:	character_x = 	16'b0000000000000110
                    5'd5	:	character_x = 	16'b0000000000000110
                    5'd6	:	character_x = 	16'b0000000000001100
                    5'd7	:	character_x = 	16'b0000000000011100
                    5'd8	:	character_x = 	16'b0000000000111000
                    5'd9	:	character_x = 	16'b0000000000110000
                    5'd10	:	character_x = 	16'b0000000000110000
                    5'd11	:	character_x = 	16'b0000000001100000
                    5'd12	:	character_x = 	16'b0000000001100000
                    5'd13	:	character_x = 	16'b0000000011000000
                    5'd14	:	character_x = 	16'b0000000111000000
                    5'd15	:	character_x = 	16'b0000000111111100
                    5'd16	:	character_x = 	16'b0000000111111110
                    5'd17	:	character_x = 	16'b0000000000000110
                    5'd18	:	character_x = 	16'b0000000000000110
                    5'd19	:	character_x = 	16'b0000000000000110
                    5'd20	:	character_x = 	16'b0000000000000110
                    5'd21	:	character_x = 	16'b0000000000000110
                    5'd22	:	character_x = 	16'b0000000000000110
                    5'd23	:	character_x = 	16'b0000000000000110
                    5'd24	:	character_x = 	16'b0000000000000110
                    5'd25	:	character_x = 	16'b0000000000000110
                    5'd26	:	character_x = 	16'b0110000000000110
                    5'd27	:	character_x = 	16'b0110000000000110
                    5'd28	:	character_x = 	16'b0111000000001110
                    5'd29	:	character_x = 	16'b0011111111111100
                    5'd30	:	character_x = 	16'b0001111111111000
                    5'd31	:	character_x = 	16'b0000000000000000
                    default:     character_x =  16'b0000000000000000;
                endcase
        endcase

        wire in_char_tile_x, in_char_tile_y, in_char_tile;

        assign in_char_tile_x = ((x > x1) && (x < x1 + char_width));
        assign in_char_tile_y = ((y > y1) && (y < y1 + char_height));
        assign in_char_tile = in_char_tile_x && in_char_tile_y;
        assign on_char = character_x[pixel_x] && in_char_tile;

endmodule