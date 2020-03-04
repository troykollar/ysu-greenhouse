module flash_onoff #(
    parameter clock_speed = 50000000
)
(
    input wire clk,
    output wire flash
);

    parameter half_clock_speed = clock_speed / 2;

    reg [25:0] counter = 0;
    always @(posedge clk)
        if (counter == clock_speed)
            counter <= 0;
        else
            counter <= counter + 1;

    assign flash = (counter > half_clock_speed);

endmodule