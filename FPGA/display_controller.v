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

    reg R, G, B;

    always @(*) begin
        VGA_R = {8{R}};
        VGA_G = {8{G}};
        VGA_B = {8{B}};
    end

    // Draw dividing lines
    always @(posedge CLOCK_50)
        if (draw_zero || draw_one) begin
            VGA_B <= {8{1'b0}};
            VGA_R <= {8{1'b0}};
            VGA_G <= {8{1'b0}}; 
        end
        else begin  // White where things are not drawn
			R <= 1;
            G <= 1;
            B <= 1;
		end

endmodule // display_controller