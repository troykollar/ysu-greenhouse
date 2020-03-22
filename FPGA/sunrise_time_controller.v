module sunrise_time_controller(
    input clk,
    input [2:0] sunrise_time_adjust,
    output reg [4:0] sunrise_hours,
    output reg [5:0] sunrise_minutes
);

    always @(posedge clk)
        if (sunrise_time_adjust == 3'd3)
            if (sunrise_hours == 5'd23)
                sunrise_hours <= 0;
            else
                sunrise_hours <= sunrise_hours + 1;
        else if (sunrise_time_adjust == 4'd4)
            if (sunrise_hours == 5'd0)
                sunrise_hours <= 5'd23;
            else
                sunrise_hours <= sunrise_hours - 1;
        else
            sunrise_hours <= sunrise_hours;

    always @(posedge clk)
        if (sunrise_time_adjust == 3'd1)
            if (sunrise_minutes == 6'd59)
                sunrise_minutes <= 0;
            else
                sunrise_minutes <= sunrise_minutes + 1;
        else if (sunrise_time_adjust == 3'd2)
            if (sunrise_minutes == 0)
                sunrise_minutes <= 6'd59;
            else
                sunrise_minutes <= sunrise_minutes - 1;
        else
            sunrise_minutes <= sunrise_minutes;

endmodule // sunrise_time_controller