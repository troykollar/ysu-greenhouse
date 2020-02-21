module display_controller(
    input                       CLOCK_50,
    input           [3:0]       MODULE1_STATUS,
    output		          		VGA_BLANK_N,
	output		          		VGA_CLK,
	output reg		[7:0]		VGA_R,
	output reg		[7:0]		VGA_G,
    output reg		[7:0]		VGA_B,
	output		          		VGA_VS,
    output		          		VGA_HS
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

    reg CLOCK_25 = 0;
    wire [9:0] x, y;
    wire displayArea;

//=======================================================
//  Structural coding
//=======================================================

    assign VGA_CLK = CLOCK_25;

	// Generate 25MHz clk from base 50MHz clk
	always @(posedge CLOCK_50)
		CLOCK_25 <= ~CLOCK_25;

    vga_controller_640x480(
        .VGA_CLK(VGA_CLK),
        .x(x),
        .y(y),
        .displayArea(displayArea),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N)
    );

    // Draw dividing lines
    always @(posedge CLOCK_50)
        if ((y > 10'd115) && (y < 10'd125)) begin   //draw black line between 115 and 125
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else if ((y > 10'd235) && (y < 10'd245)) begin  //draw black line between 235 and 245
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else if ((y > 10'd355) && (y < 10'd365)) begin  //draw black line between 355 and 365
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else if ((y > 10'd365) && (y < 10'd480)) begin  //Drawing in bottom section here
            if ((x > 10'd0) && (x < 10'd115)) begin   // First section of indicators
                VGA_B <= {8{1'b0}};
                VGA_R <= {8{~MODULE1_STATUS[3]}};
                VGA_G <= {8{MODULE1_STATUS[3]}};
            end
            else if ((x > 10'd115) && (x < 10'd230)) begin   // First section of indicators
                VGA_B <= {8{1'b0}};
                VGA_R <= {8{~MODULE1_STATUS[2]}};
                VGA_G <= {8{MODULE1_STATUS[2]}};
            end
            else if ((x > 10'd230) && (x < 10'd345)) begin   // First section of indicators
                VGA_B <= {8{1'b0}};
                VGA_R <= {8{~MODULE1_STATUS[1]}};
                VGA_G <= {8{MODULE1_STATUS[1]}};
            end
            else if ((x > 10'd345) && (x < 10'd460)) begin   // First section of indicators
                VGA_B <= {8{1'b0}};
                VGA_R <= {8{~MODULE1_STATUS[0]}};
                VGA_G <= {8{MODULE1_STATUS[0]}};
            end
            else begin
                VGA_B <= {8{1'b1}};
                VGA_R <= {8{1'b1}};
                VGA_G <= {8{1'b1}};
            end
        end
        else begin
			VGA_B <= {8{1'b1}};
			VGA_R <= {8{1'b1}};
			VGA_G <= {8{1'b1}};
			end

endmodule // display_controller