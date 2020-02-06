module greenhouse(input clk, 
                  input gpio_0,
                  output wire [6:0] disp_segs);

reg [24:0] counter = 0;
reg [3:0] value = 0;

always @(posedge clk)
    if (counter == 25'd25_000_000)  counter <= 0;
    else    counter <= counter + 1;

always @(posedge clk)
    if (value == 4'd10) value <= 0;
    else if (counter == 25'd25_000_000) value <= value + 1;
    else    value <= value;

/*
always @(posedge clk)
    if (gpio_0)     value <= 8'd1;
    else            value <= 8'd0;
*/

val_to_seven_seg disp(clk, value, disp_segs);

endmodule