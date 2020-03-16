module timekeeper(
    input clk,
    input wire [2:0] time_adjust,
    output reg [5:0] seconds = 0,
    output reg [5:0] minutes = 0,
    output reg [4:0] hours = 0
);

    // time_adjust
    // 0 = no adjustment
    // 1 = min_up
    // 2 = min_down
    // 3 = hour_up
    // 4 = hour down

    parameter clk_speed = 50_000_000;
    parameter button_length = clk_speed/4;

    wire min_up = time_adjust == 4'd1;
    wire min_down = time_adjust == 4'd2;
    wire hour_up = time_adjust == 4'd3;
    wire hour_down = time_adjust == 4'd4;

    reg [25:0] counter = 0;
    always @(posedge clk)
        if (counter == clk_speed)
            counter <= 0;
        else counter <= counter + 1;

    always @(posedge clk)
        if (min_up || min_down || hour_up || hour_down)
            seconds <= 0;
        else if (counter == clk_speed)
            if (seconds == 6'd59)
                seconds <= 0;
            else
                seconds <= seconds + 1;
        else seconds <= seconds;

    always @(posedge clk)
        if (min_up)
            if (minutes == 6'd59)
                minutes <= 0;
            else
                minutes <= minutes + 1;
        else if (min_down)
            if (minutes == 6'd0)
                minutes <= 0;
            else
                minutes <= minutes - 1;
        else if (counter == clk_speed)
            if (seconds == 6'd59)
                if (minutes == 6'd59)
                    minutes <= 0;
                else
                    minutes <= minutes + 1;
        else
            minutes <= minutes;

    always @(posedge clk)
        if (hour_up)
            if (hours == 5'd23)
                hours <= 0;
            else
                hours <= hours + 1;
        else if (hour_down)
            if (hours == 5'd0)
                hours <= 0;
            else
                hours <= hours - 1;
        else if (counter == clk_speed)
            if (seconds == 6'd59)
                if (minutes == 6'd59)
                    if (hours == 5'd23)
                        hours <= 0;
                    else
                        hours <= hours + 1;
        else
            hours <= hours;

endmodule