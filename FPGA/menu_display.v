module menu_display #(
    parameter x1 = 0,
    parameter y1 = 0
)(
    input clk,
    input [11:0] set_temp,
    input [7:0] set_hum,
    input [4:0] time_hours,
    input [5:0] time_minutes,
    input wire [3:0] state,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_menu_display,
    output wire on_menu_bar
);

    parameter spacing = 64;

    wire on_temp_text;
    Pixel_On_Text2 #(.displayText("TEMP")) temp_text(
        .clk(clk),
        .positionX(x1 + 5),
        .positionY(y1 - 12),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_temp_text)
    );

    wire [11:0] temp_bcd;
    wire on_temp;
    bin2bcd(set_temp, temp_bcd);
    temp_display #(.x1(x1), .y1(y1)) temp(
        .temp_value_100(temp_bcd[11:8]),
        .temp_value_10(temp_bcd[7:4]),
        .temp_value_1(temp_bcd[3:0]),
        .x(x),
        .y(y),
        .on_temp_display(on_temp)
    );

    wire on_hum_text;
    Pixel_On_Text2 #(.displayText("HUM")) hum_text(
        .clk(clk),
        .positionX(x1 + 5 + spacing),
        .positionY(y1 - 12),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_hum_text)
    );

    wire [7:0] hum_bcd;
    wire on_hum;
    bin2bcd(set_hum, hum_bcd);
    hum_display #(.x1(x1 + spacing), .y1(y1)) hum(
        .hum_value_10(hum_bcd[7:4]),
        .hum_value_1(hum_bcd[3:0]),
        .x(x),
        .y(y),
        .on_hum_display(on_hum)
    );

    wire on_time;
    time_display #(.x1(x1 + (spacing*2)), .y1(y1)) timedisplay(
        .hours(time_hours),
        .minutes(time_minutes),
        .x(x),
        .y(y),
        .on_time_display(on_time)
    );

    parameter bar0_x1 = x1;
    parameter bar0_x2 = x1 + 48;
    wire on_bar0;
    rectangle_display #(.x1(bar0_x1), .x2(bar0_x2), .y1(y1), .y2(y1 + 32)) bar0(
        .x(x),
        .y(y),
        .on_rectangle(on_bar0)
    );

    parameter bar1_x1 = bar0_x1 + spacing;
    parameter bar1_x2 = bar0_x2 + spacing;
    wire on_bar1;
    rectangle_display #(.x1(bar1_x1), .x2(bar1_x2), .y1(y1), .y2(y1 + 32)) bar1(
        .x(x),
        .y(y),
        .on_rectangle(on_bar1)
    );

    wire bar0_active = (state == 4'd0) && on_bar0;
    wire bar1_active = (state == 4'd1) && on_bar1;

    assign on_menu_bar = bar0_active || bar1_active;
    assign on_menu_display = on_time || on_hum_text || on_temp_text ||  on_hum || on_temp;

endmodule