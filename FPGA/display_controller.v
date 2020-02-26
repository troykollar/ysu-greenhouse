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

    wire div_0, div_1, div_2;
    wire dividers;
    assign dividers = (div_0 || div_1 || div_2);
    reg [2:0] RGB;
    wire R, G, B;
    assign R = (RGB[2] == 1);
    assign G = (RGB[1] == 1);
    assign B = (RGB[0] == 1);

    always @(*) begin
        VGA_R = {8{R}};
        VGA_G = {8{G}};
        VGA_B = {8{B}};
    end

    rectangle_display #(.x1(0), .x2(640), .y1(115), .y2(125)) div0(
        .clk(CLOCK_50),
        .x(x),
        .y(y),
        .on_rectangle(div_0)
    );

    rectangle_display #(.x1(0), .x2(640), .y1(235), .y2(245)) div1(
        .clk(CLOCK_50),
        .x(x),
        .y(y),
        .on_rectangle(div_1)
    );

    rectangle_display #(.x1(0), .x2(640), .y1(355), .y2(365)) div2(
        .clk(CLOCK_50),
        .x(x),
        .y(y),
        .on_rectangle(div_2)
    );

    // Draw dividing lines
    always @(posedge CLOCK_50)
        if (dividers) RGB <= 3'b000;
        else          RGB <= 3'b111;

endmodule // display_controller