module switch_indicator #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input wire status,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_switch_indicator
);

    parameter width = 5;
    parameter height = 20;

    wire on_topline;
    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(y1), .y2(y1)) topline(
        .x(x),
        .y(y),
        .on_rectangle(on_topline)
    );

    wire on_botline;
    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(y1 + height), .y2(y1 + height)) botline(
        .x(x),
        .y(y),
        .on_rectangle(on_botline)
    );

    wire on_leftline;
    rectangle_display #(.x1(x1), .x2(x1), .y1(y1), .y2(y1 + height)) leftline(
        .x(x),
        .y(y),
        .on_rectangle(on_leftline)
    );

    wire on_rightline;
    rectangle_display #(.x1(x1 + width), .x2(x1 + width), .y1(y1), .y2(y1 + height)) rightline(
        .x(x),
        .y(y),
        .on_rectangle(on_rightline)
    );

    wire on_status1;
    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(y1), .y2(y1 + (height/2))) status1(
        .x(x),
        .y(y),
        .on_rectangle(on_status1)
    );

    wire on_status0;
    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(y1 + (height/2)), .y2(y1 + height)) status0(
        .x(x),
        .y(y),
        .on_rectangle(on_status0)
    );

    wire on_active_status1;
    assign on_active_status1 = (status && on_status1);

    wire on_active_status0;
    assign on_active_status0 = (!status && on_status0);

    assign on_switch_indicator = on_active_status0 || on_active_status1 || on_topline || on_botline || on_rightline || on_leftline;

endmodule