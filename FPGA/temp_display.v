module temp_display #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input wire [3:0] temp_value_100,
    input wire [3:0] temp_value_10,
    input wire [3:0] temp_value_1,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_temp_display
);
    parameter digit_2_x1 = x1;
    parameter digit_1_x1 = digit_2_x1 + 16;
    parameter digit_0_x1 = digit_1_x1 + 16;

    wire on_hundreds, on_tens, on_ones;
    assign on_temp_display = (on_hundreds || on_tens || on_ones);

    font16x32 #(.x1(digit_2_x1), .y1(y1)) hundreds_place(
        .character_code(temp_value_100),
        .x(x),
        .y(y),
        .on_char(on_hundreds)
    );

    font16x32 #(.x1(digit_1_x1), .y1(y1)) tens_place(
        .character_code(temp_value_10),
        .x(x),
        .y(y),
        .on_char(on_tens)
    );

    font16x32 #(.x1(digit_0_x1), .y1(y1)) ones_place(
        .character_code(temp_value_1),
        .x(x),
        .y(y),
        .on_char(on_ones)
    );

endmodule // temp_display