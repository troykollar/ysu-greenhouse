module display_controller(
    input                       CLOCK_50,
    input           [3:0]       MODULE1_STATUS,
    input           [9:0]      TEMP_F,
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

    // VGA controller controls V-sync and H-sync signals
    vga_controller_640x480(
        .VGA_CLK(VGA_CLK),
        .x(x),
        .y(y),
        .displayArea(displayArea),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N)
    );

    // div values go high when pixel location is at div location
    wire div_0, div_1, div_2;
    
    //dividers goes high when any divider is high to simplify drawing logic
    wire dividers;
    assign dividers = (div_0 || div_1 || div_2);

    // RGB register to simplify color definitions
    reg [2:0] RGB;
    wire R, G, B;
    assign R = (RGB[2] == 1);
    assign G = (RGB[1] == 1);
    assign B = (RGB[0] == 1);

    // Set RGB outputs equal to full color based on reg RGB values
    always @(*) begin
        VGA_R = {8{R}};
        VGA_G = {8{G}};
        VGA_B = {8{B}};
    end

//=======================================================
//  Display dividers
//=======================================================

    // Divider at y = 120
    rectangle_display #(.x1(0), .x2(640), .y1(115), .y2(125)) div0(
        .x(x),
        .y(y),
        .on_rectangle(div_0)
    );

    // Divider at y = 240
    rectangle_display #(.x1(0), .x2(640), .y1(235), .y2(245)) div1(
        .x(x),
        .y(y),
        .on_rectangle(div_1)
    );

    // Divider at y = 360
    rectangle_display #(.x1(0), .x2(640), .y1(355), .y2(365)) div2(
        .x(x),
        .y(y),
        .on_rectangle(div_2)
    );

//=======================================================
//  Temperature display info
//=======================================================

    parameter TEMP_DISPLAY_HEIGHT = 50;
    // Display of actual temperature
        parameter ACTUAL_TEMP_X = 50;
        // ACTUAL text above temperature reading
        wire on_actual_temp_text;
        Pixel_On_Text2 #(.displayText("ACTUAL")) actual_temp_text(
            .clk(VGA_CLK),
            .positionX(ACTUAL_TEMP_X - 2),
            .positionY(TEMP_DISPLAY_HEIGHT - 16),
            .horzCoord(x),
            .vertCoord(y),
            .pixel(on_actual_temp_text)
        );
        // Numeric Digits of ACTUAL TEMP reading
        wire on_actual_temp_display;
        temp_display #(.x1(ACTUAL_TEMP_X), .y1(TEMP_DISPLAY_HEIGHT)) actual_temp(
            .temp_value_100({2'b00, TEMP_F[9:8]}),
            .temp_value_10(TEMP_F[7:4]),
            .temp_value_1(TEMP_F[3:0]),
            .x(x),
            .y(y),
            .on_temp_display(on_actual_temp_display)
        );

    // Display of set temperature
        parameter SET_TEMP_X = 150;
        // SET text above set temperature display
        wire on_set_temp_text;
        Pixel_On_Text2 #(.displayText("SET")) set_temp_text(
            .clk(VGA_CLK),
            .positionX(SET_TEMP_X + 10),
            .positionY(TEMP_DISPLAY_HEIGHT - 16),
            .horzCoord(x),
            .vertCoord(y),
            .pixel(on_set_temp_text)
        );
        // Numeric Digits of SET TEMP display
        wire on_set_temp_display;
        temp_display #(.x1(SET_TEMP_X), .y1(TEMP_DISPLAY_HEIGHT)) set_temp(
            .temp_value_100({2'b00, TEMP_F[9:8]}),
            .temp_value_10(TEMP_F[7:4]),
            .temp_value_1(TEMP_F[3:0]),
            .x(x),
            .y(y),
            .on_temp_display(on_set_temp_display)
        );

    // Test display using smaller text rom
    wire on_test_text;
    Pixel_On_Text2 #(.displayText("test text")) test_text(
        .clk(VGA_CLK),
        .positionX(250),
        .positionY(250),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_test_text)
    );

//=======================================================
//  Temperature status indicators
//=======================================================

    wire on_temp_status_black;
    wire on_temp_status_green;
    wire on_temp_status_red;
    temp_status_block #(.x1(275), .y1(1)) temp_status(
        .clk(VGA_CLK),
        .status(TEMP_F[1:0]),
        .x(x),
        .y(y),
        .on_temp_status_black(on_temp_status_black),
        .on_temp_status_green(on_temp_status_green),
        .on_temp_status_red(on_temp_status_red)
    );

//=======================================================
//  Humidity status indicators
//=======================================================

    wire on_hum_status_black;
    wire on_hum_status_green;
    wire on_hum_status_red;
    hum_status_block #(.x1(275), .y1(125)) hum_status(
        .clk(VGA_CLK),
        .status(TEMP_F[1:0]),
        .x(x),
        .y(y),
        .on_hum_status_black(on_hum_status_black),
        .on_hum_status_green(on_hum_status_green),
        .on_hum_status_red(on_hum_status_red)
    );

//=======================================================
//  Set RGB regsiter according to whether or not pixel needs drawn
//=======================================================

    wire on_black;
    wire on_red;
    wire on_green;
    assign on_black = on_hum_status_black || dividers || on_actual_temp_display || on_actual_temp_text ||on_set_temp_display || on_set_temp_text || on_test_text || on_temp_status_black;
    assign on_red = on_hum_status_red || on_temp_status_red;
    assign on_green = on_hum_status_green || on_temp_status_green;

    always @(posedge CLOCK_50)
        if (on_black) RGB <= 3'b000;
        else if (on_green) RGB <= 3'b010;
        else if (on_red)   RGB <= 3'b100;
        else          RGB <= 3'b111;    // White where things are not drawn

endmodule // display_controller