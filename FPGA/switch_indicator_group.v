module switch_indicator_group #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input wire [0:9] status,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_switch_indicator_group
);

    parameter spacing = 20;

    wire [9:0] on_switch;

    genvar i;
    generate
        for (i = 0; i <= 9; i = i+1) begin : switch_indicator_loop
            switch_indicator #(.x1(x1 + (spacing * i)), .y1(y1)) switch (
                .status(status[i]),
                .x(x),
                .y(y),
                .on_switch_indicator(on_switch[i])
            );
        end
    endgenerate

    assign on_switch_indicator_group = |on_switch;

endmodule