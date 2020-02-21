module vga_controller_640x480(
		input VGA_CLK,
		output reg [9:0] x,
		output reg [9:0] y,
		output reg displayArea,
		output VGA_HS,
		output VGA_VS,
		output VGA_BLANK_N
	);

	reg p_hSync, p_vSync; 
	
	integer horizontal_fporch = 640; //start of horizontal front porch
	integer HS_start = 655;//start of horizontal sync
	integer horizontal_bporch = 747; //start of horizontal back porch
	integer maxH = 793; //total length of line.

	integer vertical_fporch = 480; //start of vertical front porch 
	integer VS_start = 490; //start of vertical sync
	integer vertical_bporch = 492; //start of vertical back porch
	integer maxV = 525; //total rows. 

	always@(posedge VGA_CLK)
		if(x === maxH)
			x <= 0;
		else
			x <= x + 1;

	// 93sync, 46 bp, 640 display, 15 fp
	// 2 sync, 33 bp, 480 display, 10 fp
	always@(posedge VGA_CLK)
		if(x === maxH)
			if(y === maxV)	y <= 0;
			else			y <= y + 1;
	
	always@(posedge VGA_CLK)
		displayArea <= ((x < horizontal_fporch) && (y < vertical_fporch)); 

	always@(posedge VGA_CLK)
	begin
		p_hSync <= ((x >= HS_start) && (x < horizontal_bporch)); 
		p_vSync <= ((y >= VS_start) && (y < vertical_bporch)); 
	end
 
	assign VGA_VS = ~p_vSync; 
	assign VGA_HS = ~p_hSync;
	assign VGA_BLANK_N = displayArea;
endmodule		