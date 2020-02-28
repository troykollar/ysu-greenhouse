module timekeeper #(
    parameter clk_speed = 5
)(
    input wire clk,
    output reg [5:0] seconds = 0,
    output reg [5:0] minutes = 0,
    output reg [4:0] hours = 0
);

reg [27:0] clk_counter = 0;
always @(posedge clk)
    if (clk_counter == clk_speed)
        clk_counter <= 0;
    else clk_counter <= clk_counter + 1;

always @(posedge clk)
    if (clk_counter == clk_speed)
        if (seconds == 6'd59)
            seconds <= 0;
        else
            seconds <= seconds + 1;

always @(seconds)
    if (seconds == 0)
        if (minutes == 6'd59)
            minutes <= 0;
        else
            minutes <= minutes + 1;

always @(minutes)
    if (minutes == 0)
        if (hours == 6'd23)
            hours <= 0;
        else
            hours <= hours + 1;


endmodule // timekeeper