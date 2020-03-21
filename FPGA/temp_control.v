module temp_control(
    input [8:0] temp_f_signed,
    input [7:0] temp_f_setpoint,
    output reg [1:0] status
);

    parameter tolerance = 5;
    parameter max_sensor_reading = 173;
    parameter min_sensor_reading = 40;

    //Status
    //0 = idle
    //1 = heating
    //2 = cooling
    //3 = error

    always @(*)
        if (temp_f_signed[8] == 1) //temp is negative
            if (temp_f_signed[7:0] > min_sensor_reading)  //temp is less than -40 which is out of temp sensors range
                status = 2'd3;
            else
                status = 2'd1;
        else    // temp is positive
            if (temp_f_signed > max_sensor_reading) //check for error first
                status = 2'd3;
            else if (temp_f_signed[7:0] > temp_f_setpoint + tolerance)   // temp is over setpoint + tolerance = set status=cooling
                status = 2'd2;
            else if (temp_f_signed[7:0] < temp_f_setpoint - tolerance) //temp is lower than setpoint - tolerance = set status=heating
                status = 2'd1;
            else    // temp is in acceptable range. status=idle
                status = 2'd0;

endmodule