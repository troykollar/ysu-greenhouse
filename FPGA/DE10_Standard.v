
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_Standard(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output 			[7:0]		VGA_B,
	output		          		VGA_CLK,
	output  		[7:0]		VGA_G,
	output		          		VGA_HS,
	output  		[7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// ADC //////////
	output		          		ADC_CONVST,
	output		          		ADC_DIN,
	input 		          		ADC_DOUT,
	output		          		ADC_SCLK,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

	//ADC Values
	wire [11:0] adc_values [7:0];
	wire [10:0] temp_c;
	wire [11:0] temp_f;
	reg [11:0] SET_TEMP_F = 12'd72;
	reg [7:0] SET_HUM = 8'd50;
	wire [1:0] temp_adjust;
	wire [1:0] hum_adjust;
	wire [2:0] time_adjust;
	wire [3:0] menu_state;
	assign LEDR[3:0] = menu_state;

//=======================================================
//  Structural coding
//=======================================================

	menu menu_sm(
		.clk(CLOCK_50),
		.up(KEY[2]),
		.down(KEY[3]),
		.left(KEY[1]),
		.right(KEY[0]),
		.state(menu_state),
		.temp_adjust(temp_adjust),
		.hum_adjust(hum_adjust),
		.time_adjust(time_adjust)
	);

	always @(posedge CLOCK_50)
		if (temp_adjust == 2'd1)
			SET_TEMP_F <= SET_TEMP_F + 1;
		else if (temp_adjust == 2'd2)
			SET_TEMP_F <= SET_TEMP_F - 1;
		else
			SET_TEMP_F <= SET_TEMP_F;

	always @(posedge CLOCK_50)
		if (hum_adjust == 2'd1)
			SET_HUM <= SET_HUM + 1;
		else if (hum_adjust == 2'd2)
			SET_HUM <= SET_HUM - 1;
		else
			SET_HUM <= SET_HUM;

display_controller display(
	.CLOCK_50(CLOCK_50),
	.TEMP_F({2'b00, SW}),
	.SET_TEMP_F(SET_TEMP_F),
	.TEMP_STATUS(SW[1:0]),
	.HUM(SW[7:0]),
	.SET_HUM(SET_HUM),
	.HUM_STATUS(SW[1:0]),
	.SW(SW),
	.TIME_HOURS(hours),
	.TIME_MINUTES(minutes),
	.MENU_STATE(menu_state),
	.VGA_BLANK_N(VGA_BLANK_N),
	.VGA_CLK(VGA_CLK),
	.VGA_R(VGA_R),
	.VGA_G(VGA_G),
    .VGA_B(VGA_B),
	.VGA_VS(VGA_VS),
    .VGA_HS(VGA_HS)
);

adc_controller ADC (
	.CLOCK (CLOCK_50),
	.RESET (!KEY[0]),
	.ADC_SCLK (ADC_SCLK),
	.ADC_CS_N (ADC_CONVST),
	.ADC_DOUT (ADC_DOUT),
	.ADC_DIN (ADC_DIN),
	.CH0 (adc_values[0]),
	.CH1 (adc_values[1]),
	.CH2 (adc_values[2]),
	.CH3 (adc_values[3]),
	.CH4 (adc_values[4]),
	.CH5 (adc_values[5]),
	.CH6 (adc_values[6]),
	.CH7 (adc_values[7])
);

voltage_to_temp v_to_temp (
	.clk (CLOCK_50),
	.voltage (adc_values [0]),
	.temp_c_signed(temp_c),
	.temp_f_signed(temp_f)
);

wire [5:0] seconds;
wire [5:0] minutes;
wire [4:0] hours;
timekeeper time_keeper(
	.clk(CLOCK_50),
	.time_adjust(time_adjust),
	.seconds(seconds),
	.minutes(minutes),
	.hours(hours)
);

wire [7:0] seconds_bcd, minutes_bcd, hours_bcd;
bin2bcd timebcd(seconds, seconds_bcd);
val_to_seven_seg hex0 (
	.clk (CLOCK_50),
	.value (seconds_bcd[3:0]),
	.display_segs (HEX0)
);

val_to_seven_seg hex1 (
	.clk (CLOCK_50),
	.value (seconds_bcd[7:4]),
	.display_segs (HEX1)
);

bin2bcd(minutes, minutes_bcd);
val_to_seven_seg hex2 (
	.clk (CLOCK_50),
	.value (minutes_bcd[3:0]),
	.display_segs (HEX2)
);

val_to_seven_seg hex3 (
	.clk (CLOCK_50),
	.value (minutes_bcd[7:4]),
	.display_segs (HEX3)
);

bin2bcd(hours, hours_bcd);
val_to_seven_seg hex4 (
	.clk (CLOCK_50),
	.value (hours_bcd[3:0]),
	.display_segs (HEX4)
);

val_to_seven_seg hex5 (
	.clk (CLOCK_50),
	.value (hours_bcd[7:4]),
	.display_segs (HEX5)
);

endmodule
