module greenhouse(input clk, 
                  input gpio_0,
                  output wire [6:0] disp0_segs,
                  output wire [6:0] disp1_segs
                  );

reg [24:0] counter = 0;
reg [7:0] value = 0;

always @(posedge clk)
    if (counter == 25'd25_000_000)  counter <= 0;
    else    counter <= counter + 1;

always @(posedge clk)
    if (value == 8'd100) value <= 0;
    else if (counter == 25'd25_000_000) value <= value + 1;
    else    value <= value;

/*
always @(posedge clk)
    if (gpio_0)     value <= 8'd1;
    else            value <= 8'd0;
*/

wire [3:0] val0;
wire [3:0] val1;

split_val split(clk, value, val0, val1);
val_to_seven_seg disp0(clk, val0, disp0_segs);
val_to_seven_seg disp1(clk, val1, disp1_segs);

endmodule