module timekeeper(
    input wire clk,
    input wire button_min_up, button_min_down,
    output reg [4:0] hours,
    output reg [5:0] minutes,
    output reg [5:0] seconds
);

minutes = 6'd0;
seconds = 6'd0;

reg [26:0] clk_counter = 27'd0;
reg [26:0] button_counter = 27'd0;

always @(posedge clk)
    if (button_min_up || button_min_down)
        button_counter <= button_counter + 1;
    else if (button_counter == 27'd12_500_000)
        button_counter <= 0;
    else
        button_counter <= 0;
        

//Count to 50 million clk cycles eg, 1 second
//then reset clk_counter to 0
always @(posedge clk)
    if (clk_counter == 27'd50_000_000)
        clk_counter <= 0;
    else    clk_counter <= clk_counter + 1;

//Count to 50 million clk cycles eg, 1 second
//then increment seconds
//If at 60 seconds, reset seconds
always @(posedge clk)
    if (seconds == 6'd60)
        seconds <= 6'd0;
    else if (clk_counter == 27'd50_000_000)
        seconds <= seconds + 1;
    else
        seconds <= seconds;

//Increment minutes every minute
//Reset minutes at 60 min
always @(posedge clk)
    if (minutes == 6'd60)
        minutes <= 6'd0;
    else if (seconds == 6'd60)
        minutes <= minutes + 1;
    else if (button_min_up)
        if (button_counter == 27'd12_500_000)
            minutes <= minutes + 1;
        else 
            minutes <= minutes;
    else if (button_min_down)
        if (button_counter == 27'd12_500_000)
            minutes <= minutes - 1;
        else
            minutes <= minutes;
    else
        minutes <= minutes;

always @(posedge clk)
    if (hours == 5'd24)
        hours <= 5'd0;
    else if (minutes == 6'd60)
        hours <= hours + 1;
    else
        hours <= hours;


endmodule // timekeeper