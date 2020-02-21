module display_controller(
    input CLOCK_50,
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
        if ((y > 10'd115) && (y < 10'd125)) begin
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else if ((y > 10'd235) && (y < 10'd245)) begin
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else if ((y > 10'd355) && (y < 10'd365)) begin
			VGA_B <= {8{1'b0}};
			VGA_R <= {8{1'b0}};
			VGA_G <= {8{1'b0}};
			end
        else begin
			VGA_B <= {8{1'b1}};
			VGA_R <= {8{1'b1}};
			VGA_G <= {8{1'b1}};
			end

endmodule // display_controller