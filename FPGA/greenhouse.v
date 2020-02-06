module greenhouse(input clk, 
                  input gpio_0,
                  output wire [6:0] disp_segs);
reg [7:0] value;

always @(posedge clk)
    if (gpio_0)     value <= 8'd1;
    else            value <= 8'd0;

val_to_seven_seg disp(clk, value, disp_segs);

endmodule