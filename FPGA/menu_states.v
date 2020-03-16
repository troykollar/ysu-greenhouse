module menu(
    input clk,
    input up,
    input down,
    input left,
    input right,
    output reg [3:0] state = 0,
    output reg [1:0] temp_adjust,
    output reg [1:0] hum_adjust,
    output reg [2:0] time_adjust
);

    parameter max_state = 2;

    wire up_debounced;
    debounce debounce_u(clk, up, up_debounced);
    wire down_debounced;
    debounce debounce_d(clk, down, down_debounced);
    wire right_debounced;
    debounce debounce_r(clk, right, right_debounced);
    wire left_debounced;
    debounce debounce_l(clk, left, left_debounced);

    always @(posedge clk)
        case (state)
            4'd0   :
                if (left_debounced)         state <= max_state;
                else if (right_debounced)   state <= state + 1;
                else                        state <= state;
            4'd1    :
                if (left_debounced)         state <= state - 1;
                else if (right_debounced)   state <= state + 1;
                else                        state <= state;
            4'd2    :
                if (left_debounced)         state <= state - 1;
                else if (right_debounced)   state <= 4'd3;
                else                        state <= state;
            4'd3    :
                if (left_debounced)         state <= state - 1;
                else if (right_debounced)   state <= 4'd0;
                else                        state <= state;
            default: state <= state; 
        endcase

        // STATES:
        // 0 == Set temperature (F)
        // 1 == Set Humidity

        // adjust: 0 == no adjustment, 1 == up, 2 == down
        always @(posedge clk)
            case (state)
                4'd0    :
                    if (up_debounced)
                        temp_adjust <= 2'd1;
                    else if (down_debounced)
                        temp_adjust <= 2'd2;
                    else temp_adjust <= 0;
                default: temp_adjust <= 0;
            endcase

        always @(posedge clk)
            case (state)
                4'd1: 
                    if (up_debounced)
                        hum_adjust <= 2'd1;
                    else if (down_debounced)
                        hum_adjust <= 2'd2;
                    else hum_adjust <= 2'd0;
                default: hum_adjust <= 2'd0;
            endcase

        always @(posedge clk)
            case (state)
                4'd2: 
                    if (up_debounced)
                        time_adjust <= 3'd3;
                    else if (down_debounced)
                        time_adjust <= 3'd4;
                    else time_adjust <= 0;
                4'd3:
                    if (up_debounced)
                        time_adjust <= 3'd1;
                    else if (down_debounced)
                        time_adjust <= 3'd2;
                    else time_adjust <= 0;
                default: time_adjust <= 0;
            endcase

endmodule