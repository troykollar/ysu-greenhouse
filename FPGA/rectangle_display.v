module rectangle_display #(
        x1 = 320,  // x coordinate of top left corner
        x2 = 325,  // x coordinate of bottom right corner
        y1 = 100,  // y coordinate of top left corner
        y2 = 105,  // y coordinate of bottom right corner
        display_width = 640,    // Width of the display
        display_height = 480    // Height of the display
    )
    (
        input wire clk,
        input wire [9:0] x, // x coordinate of pixel being drawn
        input wire [9:0] y, // y coordinate of pixel being drawn
        output reg on_rectangle
    );

    always @(*)
        if ((y > y1) && (y < y2) && (x > x1) && (x < x2))
            on_rectangle = 1;
        else    on_rectangle = 0;

endmodule