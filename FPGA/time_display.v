module time_display #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input wire [4:0] hours,
    input wire [5:0] minutes,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_time_display
);
    parameter digit_3_x1 = x1;
    parameter digit_2_x1 = digit_3_x1 + 16;
    parameter digit_1_x1 = digit_2_x1 + 24;
    parameter digit_0_x1 = digit_1_x1 + 16;

    wire on_digit_3, on_digit_2, on_digit_1, on_digit_0;

    wire [7:0] hours_bcd, minutes_bcd;
    bin2bcd(hours, hours_bcd);
    bin2bcd(minutes, minutes_bcd);
    
    font16x32 #(.x1(digit_3_x1), .y1(y1)) digit_3(
        .character_code(hours_bcd[7:4]),
        .x(x),
        .y(y),
        .on_char(on_digit_3)
    );

    font16x32 #(.x1(digit_2_x1), .y1(y1)) digit_2(
        .character_code(hours_bcd[3:0]),
        .x(x),
        .y(y),
        .on_char(on_digit_2)
    );

    wire on_colon_top, on_colon_bottom;
    rectangle_display #(.x1(digit_2_x1 + 19), .x2(digit_2_x1 + 21), .y1(y1 + 12), .y2(y1 + 14)) colon_top(
        .x(x),
        .y(y),
        .on_rectangle(on_colon_top)
    );

    rectangle_display #(.x1(digit_2_x1 + 19), .x2(digit_2_x1 + 21), .y1(y1 + 20), .y2(y1 + 22)) colon_bottom(
        .x(x),
        .y(y),
        .on_rectangle(on_colon_bottom)
    );

    font16x32 #(.x1(digit_1_x1), .y1(y1)) digit_1(
        .character_code(minutes_bcd[7:4]),
        .x(x),
        .y(y),
        .on_char(on_digit_1)
    );

    font16x32 #(.x1(digit_0_x1), .y1(y1)) digit_0(
        .character_code(minutes_bcd[3:0]),
        .x(x),
        .y(y),
        .on_char(on_digit_0)
    );

    assign on_time_display = (on_colon_top || on_colon_bottom || on_digit_3 || on_digit_2 || on_digit_1 || on_digit_0);
endmodule // temp_display