module split_val(input wire clk,
                 input wire [7:0] value, 
                 output reg [3:0] split0,
                 output reg [3:0] split1
                 );

always @(posedge clk)
    if (value < 8'd10)          split1 <= 4'd0;
    else if (value < 8'd20)     split1 <= 4'd1;
    else if (value < 8'd30)     split1 <= 4'd2;
    else if (value < 8'd40)     split1 <= 4'd3;
    else if (value < 8'd50)     split1 <= 4'd4;
    else if (value < 8'd60)     split1 <= 4'd5;
    else if (value < 8'd70)     split1 <= 4'd6;
    else if (value < 8'd80)     split1 <= 4'd7;
    else if (value < 8'd90)     split1 <= 4'd8;
    else if (value < 8'd100)    split1 <= 4'd9;
    else                        split1 <= 4'd0;

reg [7:0] sub_val;

always @(posedge clk)
    if (value < 8'd10)          sub_val <= 8'd0;
    else if (value < 8'd20)     sub_val <= 8'd10;
    else if (value < 8'd30)     sub_val <= 8'd20;
    else if (value < 8'd40)     sub_val <= 8'd30;
    else if (value < 8'd50)     sub_val <= 8'd40;
    else if (value < 8'd60)     sub_val <= 8'd50;
    else if (value < 8'd70)     sub_val <= 8'd60;
    else if (value < 8'd80)     sub_val <= 8'd70;
    else if (value < 8'd90)     sub_val <= 8'd80;
    else if (value < 8'd100)    sub_val <= 8'd90;
    else                        sub_val <= 8'd0;

reg [7:0] sub_val_complement;
always @(posedge clk)
    sub_val_complement <= (~sub_val) + 8'b00000001;

reg [7:0] subtracted_value;
always @(posedge clk)
    subtracted_value <= value + sub_val_complement;

always @(posedge clk)
    split0 <= subtracted_value[3:0];

endmodule