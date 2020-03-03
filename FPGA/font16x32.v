module font16x32 #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input [3:0] character_code,
    input [9:0] x,
    input [9:0] y,
    output wire on_char
);

    //TODO: Add pixel maps for 2, 4, 5, 6, 7, 8, 9, degrees, dash
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
            4'd0    :
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
            4'd1    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000000110000000;
                    5'd2	:	character_x = 	16'b0000001110000000;
                    5'd3	:	character_x = 	16'b0000011110000000;
                    5'd4	:	character_x = 	16'b0000000110000000;
                    5'd5	:	character_x = 	16'b0000000110000000;
                    5'd6	:	character_x = 	16'b0000000110000000;
                    5'd7	:	character_x = 	16'b0000000110000000;
                    5'd8	:	character_x = 	16'b0000000110000000;
                    5'd9	:	character_x = 	16'b0000000110000000;
                    5'd10	:	character_x = 	16'b0000000110000000;
                    5'd11	:	character_x = 	16'b0000000110000000;
                    5'd12	:	character_x = 	16'b0000000110000000;
                    5'd13	:	character_x = 	16'b0000000110000000;
                    5'd14	:	character_x = 	16'b0000000110000000;
                    5'd15	:	character_x = 	16'b0000000110000000;
                    5'd16	:	character_x = 	16'b0000000110000000;
                    5'd17	:	character_x = 	16'b0000000110000000;
                    5'd18	:	character_x = 	16'b0000000110000000;
                    5'd19	:	character_x = 	16'b0000000110000000;
                    5'd20	:	character_x = 	16'b0000000110000000;
                    5'd21	:	character_x = 	16'b0000000110000000;
                    5'd22	:	character_x = 	16'b0000000110000000;
                    5'd23	:	character_x = 	16'b0000000110000000;
                    5'd24	:	character_x = 	16'b0000000110000000;
                    5'd25	:	character_x = 	16'b0000000110000000;
                    5'd26	:	character_x = 	16'b0000000110000000;
                    5'd27	:	character_x = 	16'b0000000110000000;
                    5'd28	:	character_x = 	16'b0000000110000000;
                    5'd29	:	character_x = 	16'b0001111111111000;
                    5'd30	:	character_x = 	16'b0001111111111000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =  16'b0000000000000000;
                endcase
            4'd2    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000111111110000;
                    5'd2	:	character_x = 	16'b0001111111111000;
                    5'd3	:	character_x = 	16'b0011111111111100;
                    5'd4	:	character_x = 	16'b0111000000001110;
                    5'd5	:	character_x = 	16'b0111000000001110;
                    5'd6	:	character_x = 	16'b0111000000001110;
                    5'd7	:	character_x = 	16'b0111000000001110;
                    5'd8	:	character_x = 	16'b0111000000001110;
                    5'd9	:	character_x = 	16'b0111000000001110;
                    5'd10	:	character_x = 	16'b0000000000001110;
                    5'd11	:	character_x = 	16'b0000000000001100;
                    5'd12	:	character_x = 	16'b0000000000011100;
                    5'd13	:	character_x = 	16'b0000000000011000;
                    5'd14	:	character_x = 	16'b0000000000111000;
                    5'd15	:	character_x = 	16'b0000000000110000;
                    5'd16	:	character_x = 	16'b0000000001110000;
                    5'd17	:	character_x = 	16'b0000000001100000;
                    5'd18	:	character_x = 	16'b0000000011100000;
                    5'd19	:	character_x = 	16'b0000000011000000;
                    5'd20	:	character_x = 	16'b0000000111000000;
                    5'd21	:	character_x = 	16'b0000000110000000;
                    5'd22	:	character_x = 	16'b0000001110000000;
                    5'd23	:	character_x = 	16'b0000001100000000;
                    5'd24	:	character_x = 	16'b0000011100000000;
                    5'd25	:	character_x = 	16'b0000011000000000;
                    5'd26	:	character_x = 	16'b0000111000000000;
                    5'd27	:	character_x = 	16'b0001110000000000;
                    5'd28	:	character_x = 	16'b0111111111111110;
                    5'd29	:	character_x = 	16'b0111111111111110;
                    5'd30	:	character_x = 	16'b0111111111111110;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd3    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0111111111111110;
                    5'd2	:	character_x = 	16'b0111111111111110;
                    5'd3	:	character_x = 	16'b0000000000000110;
                    5'd4	:	character_x = 	16'b0000000000000110;
                    5'd5	:	character_x = 	16'b0000000000000110;
                    5'd6	:	character_x = 	16'b0000000000001100;
                    5'd7	:	character_x = 	16'b0000000000011100;
                    5'd8	:	character_x = 	16'b0000000000111000;
                    5'd9	:	character_x = 	16'b0000000000110000;
                    5'd10	:	character_x = 	16'b0000000000110000;
                    5'd11	:	character_x = 	16'b0000000001100000;
                    5'd12	:	character_x = 	16'b0000000001100000;
                    5'd13	:	character_x = 	16'b0000000011000000;
                    5'd14	:	character_x = 	16'b0000000111000000;
                    5'd15	:	character_x = 	16'b0000000111111100;
                    5'd16	:	character_x = 	16'b0000000111111110;
                    5'd17	:	character_x = 	16'b0000000000000110;
                    5'd18	:	character_x = 	16'b0000000000000110;
                    5'd19	:	character_x = 	16'b0000000000000110;
                    5'd20	:	character_x = 	16'b0000000000000110;
                    5'd21	:	character_x = 	16'b0000000000000110;
                    5'd22	:	character_x = 	16'b0000000000000110;
                    5'd23	:	character_x = 	16'b0000000000000110;
                    5'd24	:	character_x = 	16'b0000000000000110;
                    5'd25	:	character_x = 	16'b0000000000000110;
                    5'd26	:	character_x = 	16'b0110000000000110;
                    5'd27	:	character_x = 	16'b0110000000000110;
                    5'd28	:	character_x = 	16'b0111000000001110;
                    5'd29	:	character_x = 	16'b0011111111111100;
                    5'd30	:	character_x = 	16'b0001111111111000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:     character_x =  16'b0000000000000000;
                endcase
            4'd4    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000000000011000;
                    5'd2	:	character_x = 	16'b0000000001111000;
                    5'd3	:	character_x = 	16'b0000000001111000;
                    5'd4	:	character_x = 	16'b0000000011111000;
                    5'd5	:	character_x = 	16'b0000000010011000;
                    5'd6	:	character_x = 	16'b0000000110011000;
                    5'd7	:	character_x = 	16'b0000000100011000;
                    5'd8	:	character_x = 	16'b0000001100011000;
                    5'd9	:	character_x = 	16'b0000001000011000;
                    5'd10	:	character_x = 	16'b0000011000011000;
                    5'd11	:	character_x = 	16'b0000010000011000;
                    5'd12	:	character_x = 	16'b0000110000011000;
                    5'd13	:	character_x = 	16'b0000100000011000;
                    5'd14	:	character_x = 	16'b0001100000011000;
                    5'd15	:	character_x = 	16'b0001000000011000;
                    5'd16	:	character_x = 	16'b0011000000011000;
                    5'd17	:	character_x = 	16'b0110000000011000;
                    5'd18	:	character_x = 	16'b0110000000011000;
                    5'd19	:	character_x = 	16'b0111111111111110;
                    5'd20	:	character_x = 	16'b0111111111111110;
                    5'd21	:	character_x = 	16'b0000000000011000;
                    5'd22	:	character_x = 	16'b0000000000011000;
                    5'd23	:	character_x = 	16'b0000000000011000;
                    5'd24	:	character_x = 	16'b0000000000011000;
                    5'd25	:	character_x = 	16'b0000000000011000;
                    5'd26	:	character_x = 	16'b0000000000011000;
                    5'd27	:	character_x = 	16'b0000000000011000;
                    5'd28	:	character_x = 	16'b0000000000011000;
                    5'd29	:	character_x = 	16'b0000000000011000;
                    5'd30	:	character_x = 	16'b0000000000011000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd5    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000000000000000;
                    5'd2	:	character_x = 	16'b0001111111111100;
                    5'd3	:	character_x = 	16'b0001111111111100;
                    5'd4	:	character_x = 	16'b0001100000000000;
                    5'd5	:	character_x = 	16'b0001100000000000;
                    5'd6	:	character_x = 	16'b0001100000000000;
                    5'd7	:	character_x = 	16'b0001100000000000;
                    5'd8	:	character_x = 	16'b0001100000000000;
                    5'd9	:	character_x = 	16'b0001100000000000;
                    5'd10	:	character_x = 	16'b0001100000000000;
                    5'd11	:	character_x = 	16'b0001100000000000;
                    5'd12	:	character_x = 	16'b0001100000000000;
                    5'd13	:	character_x = 	16'b0001110000000000;
                    5'd14	:	character_x = 	16'b0011111111100000;
                    5'd15	:	character_x = 	16'b0011111111111000;
                    5'd16	:	character_x = 	16'b0011000000011100;
                    5'd17	:	character_x = 	16'b0000000000001100;
                    5'd18	:	character_x = 	16'b0000000000001100;
                    5'd19	:	character_x = 	16'b0000000000001100;
                    5'd20	:	character_x = 	16'b0000000000001100;
                    5'd21	:	character_x = 	16'b0000000000001100;
                    5'd22	:	character_x = 	16'b0000000000001100;
                    5'd23	:	character_x = 	16'b0000000000001100;
                    5'd24	:	character_x = 	16'b0000000000001100;
                    5'd25	:	character_x = 	16'b0000000000001100;
                    5'd26	:	character_x = 	16'b0011000000011100;
                    5'd27	:	character_x = 	16'b0001111111111000;
                    5'd28	:	character_x = 	16'b0000111111100000;
                    5'd29	:	character_x = 	16'b0000000000000000;
                    5'd30	:	character_x = 	16'b0000000000000000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd6    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000000000000000;
                    5'd2	:	character_x = 	16'b0000111111110000;
                    5'd3	:	character_x = 	16'b0001111111111000;
                    5'd4	:	character_x = 	16'b0001100000001100;
                    5'd5	:	character_x = 	16'b0011000000000100;
                    5'd6	:	character_x = 	16'b0011000000000000;
                    5'd7	:	character_x = 	16'b0011000000000000;
                    5'd8	:	character_x = 	16'b0011000000000000;
                    5'd9	:	character_x = 	16'b0011000000000000;
                    5'd10	:	character_x = 	16'b0011000000000000;
                    5'd11	:	character_x = 	16'b0011000000000000;
                    5'd12	:	character_x = 	16'b0011000000000000;
                    5'd13	:	character_x = 	16'b0011100000000000;
                    5'd14	:	character_x = 	16'b0011111111110000;
                    5'd15	:	character_x = 	16'b0011111111111000;
                    5'd16	:	character_x = 	16'b0011100000011100;
                    5'd17	:	character_x = 	16'b0011000000001100;
                    5'd18	:	character_x = 	16'b0011000000001100;
                    5'd19	:	character_x = 	16'b0011000000001100;
                    5'd20	:	character_x = 	16'b0011000000001100;
                    5'd21	:	character_x = 	16'b0011000000001100;
                    5'd22	:	character_x = 	16'b0011000000001100;
                    5'd23	:	character_x = 	16'b0011000000001100;
                    5'd24	:	character_x = 	16'b0011000000001100;
                    5'd25	:	character_x = 	16'b0011000000001100;
                    5'd26	:	character_x = 	16'b0011000000001100;
                    5'd27	:	character_x = 	16'b0011100000011100;
                    5'd28	:	character_x = 	16'b0001111111111000;
                    5'd29	:	character_x = 	16'b0000111111100000;
                    5'd30	:	character_x = 	16'b0000000000000000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd7    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000000000000000;
                    5'd2	:	character_x = 	16'b0111111111111110;
                    5'd3	:	character_x = 	16'b0111111111111110;
                    5'd4	:	character_x = 	16'b0000000000001100;
                    5'd5	:	character_x = 	16'b0000000000001100;
                    5'd6	:	character_x = 	16'b0000000000001000;
                    5'd7	:	character_x = 	16'b0000000000011000;
                    5'd8	:	character_x = 	16'b0000000000011000;
                    5'd9	:	character_x = 	16'b0000000000010000;
                    5'd10	:	character_x = 	16'b0000000000110000;
                    5'd11	:	character_x = 	16'b0000000000110000;
                    5'd12	:	character_x = 	16'b0000000000100000;
                    5'd13	:	character_x = 	16'b0000000001100000;
                    5'd14	:	character_x = 	16'b0000000001100000;
                    5'd15	:	character_x = 	16'b0000000001000000;
                    5'd16	:	character_x = 	16'b0000000011000000;
                    5'd17	:	character_x = 	16'b0000000011000000;
                    5'd18	:	character_x = 	16'b0000000010000000;
                    5'd19	:	character_x = 	16'b0000000110000000;
                    5'd20	:	character_x = 	16'b0000000110000000;
                    5'd21	:	character_x = 	16'b0000000100000000;
                    5'd22	:	character_x = 	16'b0000001100000000;
                    5'd23	:	character_x = 	16'b0000001100000000;
                    5'd24	:	character_x = 	16'b0000001000000000;
                    5'd25	:	character_x = 	16'b0000011000000000;
                    5'd26	:	character_x = 	16'b0000011000000000;
                    5'd27	:	character_x = 	16'b0000110000000000;
                    5'd28	:	character_x = 	16'b0001110000000000;
                    5'd29	:	character_x = 	16'b0001100000000000;
                    5'd30	:	character_x = 	16'b0000000000000000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd8    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0000111111110000;
                    5'd2	:	character_x = 	16'b0001111111111000;
                    5'd3	:	character_x = 	16'b0011000000001100;
                    5'd4	:	character_x = 	16'b0110000000000110;
                    5'd5	:	character_x = 	16'b0110000000000110;
                    5'd6	:	character_x = 	16'b0110000000000110;
                    5'd7	:	character_x = 	16'b0110000000000110;
                    5'd8	:	character_x = 	16'b0110000000000110;
                    5'd9	:	character_x = 	16'b0110000000000110;
                    5'd10	:	character_x = 	16'b0110000000000110;
                    5'd11	:	character_x = 	16'b0110000000000110;
                    5'd12	:	character_x = 	16'b0110000000000110;
                    5'd13	:	character_x = 	16'b0110000000000110;
                    5'd14	:	character_x = 	16'b0110000000000110;
                    5'd15	:	character_x = 	16'b0011000000001100;
                    5'd16	:	character_x = 	16'b0011111111111100;
                    5'd17	:	character_x = 	16'b0011000000001100;
                    5'd18	:	character_x = 	16'b0110000000000110;
                    5'd19	:	character_x = 	16'b0110000000000110;
                    5'd20	:	character_x = 	16'b0110000000000110;
                    5'd21	:	character_x = 	16'b0110000000000110;
                    5'd22	:	character_x = 	16'b0110000000000110;
                    5'd23	:	character_x = 	16'b0110000000000110;
                    5'd24	:	character_x = 	16'b0110000000000110;
                    5'd25	:	character_x = 	16'b0110000000000110;
                    5'd26	:	character_x = 	16'b0110000000000110;
                    5'd27	:	character_x = 	16'b0010000000000100;
                    5'd28	:	character_x = 	16'b0011000000001100;
                    5'd29	:	character_x = 	16'b0001111111111000;
                    5'd30	:	character_x = 	16'b0000111111110000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'd9    :
                case (pixel_y)
                    5'd0	:	character_x = 	16'b0000000000000000;
                    5'd1	:	character_x = 	16'b0001111111111000;
                    5'd2	:	character_x = 	16'b0011111111111100;
                    5'd3	:	character_x = 	16'b0111000000001110;
                    5'd4	:	character_x = 	16'b0110000000000110;
                    5'd5	:	character_x = 	16'b0110000000000110;
                    5'd6	:	character_x = 	16'b0110000000000110;
                    5'd7	:	character_x = 	16'b0110000000000110;
                    5'd8	:	character_x = 	16'b0110000000000110;
                    5'd9	:	character_x = 	16'b0110000000000110;
                    5'd10	:	character_x = 	16'b0110000000000110;
                    5'd11	:	character_x = 	16'b0110000000000110;
                    5'd12	:	character_x = 	16'b0110000000000110;
                    5'd13	:	character_x = 	16'b0110000000000110;
                    5'd14	:	character_x = 	16'b0111000000001110;
                    5'd15	:	character_x = 	16'b0011111111111110;
                    5'd16	:	character_x = 	16'b0001111111111110;
                    5'd17	:	character_x = 	16'b0000000000001110;
                    5'd18	:	character_x = 	16'b0000000000000110;
                    5'd19	:	character_x = 	16'b0000000000000110;
                    5'd20	:	character_x = 	16'b0000000000000110;
                    5'd21	:	character_x = 	16'b0000000000000110;
                    5'd22	:	character_x = 	16'b0000000000000110;
                    5'd23	:	character_x = 	16'b0000000000000110;
                    5'd24	:	character_x = 	16'b0000000000000110;
                    5'd25	:	character_x = 	16'b0000000000000110;
                    5'd26	:	character_x = 	16'b0000000000000110;
                    5'd27	:	character_x = 	16'b0110000000000110;
                    5'd28	:	character_x = 	16'b0111000000001110;
                    5'd29	:	character_x = 	16'b0011111111111100;
                    5'd30	:	character_x = 	16'b0001111111111000;
                    5'd31	:	character_x = 	16'b0000000000000000;
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'ha    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'hb    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'hc    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'hd    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'he    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
            4'hf    :
                case (pixel_y)
                    default:    character_x =   16'b0000000000000000;
                endcase
        endcase

        wire in_char_tile_x, in_char_tile_y, in_char_tile;

        assign in_char_tile_x = ((x > x1) && (x < x1 + char_width));
        assign in_char_tile_y = ((y > y1) && (y < y1 + char_height));
        assign in_char_tile = in_char_tile_x && in_char_tile_y;
        assign on_char = character_x[pixel_x] && in_char_tile;

endmodule