module hum_control(
    input [7:0] hum,
    input [7:0] set_hum,
    output reg [1:0] status
);

    //status:
    //0 = idle
    //1 = humidifier
    //2 = dehumidifier
    //3 = error

    parameter tolerance = 2;
    parameter max_sensor_reading = 100;
    parameter min_sensor_reading = 0;

    always @(*)
        if (hum > max_sensor_reading)   // If read humidity is > max_sensor_reading then error
            status = 2'd3;
        else if (hum < set_hum - tolerance)
            status = 2'd1;
        else if (hum > set_hum + tolerance)
            status = 2'd2;
        else
            status = 2'd0;
            
endmodule