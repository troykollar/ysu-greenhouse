module temp_status_block #(
    parameter x1 = 0,
    parameter y1 = 0
)
(
    input wire clk,
    input wire [1:0] status,
    input wire [9:0] x,
    input wire [9:0] y,
    output wire on_temp_status_black,
    output wire on_temp_status_green,
    output wire on_temp_status_red
);

//=======================================================
//  Dividing line logic
//=======================================================

    parameter width = 115;

    wire on_topline;

    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(y1), .y2(y1)) topline(
        .x(x),
        .y(y),
        .on_rectangle(on_topline)
    );

    parameter divider1 = y1 + 38;
    wire on_divider1;

    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(divider1), .y2(divider1)) divider1_rectangle(
        .x(x),
        .y(y),
        .on_rectangle(on_divider1)
    );

    parameter divider2 = divider1 + 38;
    wire on_divider2;

    rectangle_display #(.x1(x1), .x2(x1 + width), .y1(divider2), .y2(divider2)) divider2_rectangle(
        .x(x),
        .y(y),
        .on_rectangle(on_divider2)
    );

    parameter height = 115;
    wire on_left_edge;

    rectangle_display #(.x1(x1), .x2(x1), .y1(y1), .y2(y1 + height)) left_edge(
        .x(x),
        .y(y),
        .on_rectangle(on_left_edge)
    );

    wire on_right_edge;
    rectangle_display #(.x1(x1 + width), .x2(x1 + width), .y1(y1), .y2(y1 + height)) right_edge(
        .x(x),
        .y(y),
        .on_rectangle(on_right_edge)
    );

    wire on_vertical_divider;
    rectangle_display #(.x1(x1 + 38), .x2(x1 + 38), .y1(y1), .y2(y1 + height)) vertical_divider(
        .x(x),
        .y(y),
        .on_rectangle(on_vertical_divider)
    );

//=======================================================
//  Text logic
//=======================================================

    parameter text_x = x1 + 40;
    parameter heating_text_y = y1 + 12;
    parameter cooling_text_y = heating_text_y + 38;
    parameter idle_text_y = cooling_text_y + 38;
    wire on_heating_text;

    Pixel_On_Text2 #(.displayText("Heating")) heating_text(
        .clk(clk),
        .positionX(text_x),
        .positionY(heating_text_y),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_heating_text)
    );

    wire on_cooling_text;

    Pixel_On_Text2 #(.displayText("Cooling")) cooling_text(
        .clk(clk),
        .positionX(text_x),
        .positionY(cooling_text_y),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_cooling_text)
    );

    wire on_idle_text;

    Pixel_On_Text2 #(.displayText("Idle")) idle_text(
        .clk(clk),
        .positionX(text_x),
        .positionY(idle_text_y),
        .horzCoord(x),
        .vertCoord(y),
        .pixel(on_idle_text)
    );
    
    wire on_text, on_line;
    assign on_text = on_heating_text || on_cooling_text || on_idle_text;
    assign on_line = on_topline || on_divider1 || on_divider2 || on_left_edge || on_right_edge || on_vertical_divider;
    
    assign on_temp_status_black = on_text || on_line;

//=======================================================
//  Active square logic
//=======================================================

    parameter active_block_x1 = x1 + 1;
    parameter active_block_x2 = x1 + 37;
    parameter active_heating_block_y1 = y1 + 1;
    parameter active_heating_block_y2 = y1 + 37;

    wire on_heating_active_block;
    rectangle_display #(.x1(active_block_x1), .x2(active_block_x2), .y1(active_heating_block_y1), .y2(active_heating_block_y2)) active_heating_block(
        .x(x),
        .y(y),
        .on_rectangle(on_heating_active_block)
    );

    parameter active_cooling_block_y1 =  active_heating_block_y1 + 38;
    parameter active_cooling_block_y2 =  active_heating_block_y2 + 38;
    wire on_cooling_active_block;
    rectangle_display #(.x1(active_block_x1), .x2(active_block_x2), .y1(active_cooling_block_y1), .y2(active_cooling_block_y2)) active_cooling_block(
        .x(x),
        .y(y),
        .on_rectangle(on_cooling_active_block)
    );

    parameter active_idle_block_y1 =  active_cooling_block_y1 + 38;
    parameter active_idle_block_y2 =  active_cooling_block_y2 + 38;
    wire on_idle_active_block;
    rectangle_display #(.x1(active_block_x1), .x2(active_block_x2), .y1(active_idle_block_y1), .y2(active_idle_block_y2)) active_idle_block(
        .x(x),
        .y(y),
        .on_rectangle(on_idle_active_block)
    );

    reg active_block;
    always @(*)
        if ((status == 2'b01) && (on_heating_active_block))
            active_block <= 1;
        else if ((status == 2'b10) && (on_cooling_active_block))
            active_block <= 1;
        else if ((status == 2'b00) && (on_idle_active_block))
            active_block <= 1;
        else active_block <= 0;

    assign on_temp_status_green = active_block;

//=======================================================
//  Error display logic
//=======================================================
    reg flash_on;
    reg [27:0] counter;
    always @(posedge clk)
        if (counter == 28'd10_000_000)
            counter <= 0;
        else counter <= counter + 1;

    always @(counter)
        if (counter == 28'd10_000_000)
            flash_on <= ~flash_on;
        else flash_on <= flash_on;

    wire on_error_block;
    parameter active_error_block_y1 =  active_heating_block_y1;
    parameter active_error_block_y2 =  active_idle_block_y2;
    rectangle_display #(.x1(active_block_x1), .x2(active_block_x2), .y1(active_error_block_y1), .y2(active_error_block_y2)) active_error_block(
        .x(x),
        .y(y),
        .on_rectangle(on_error_block)
    );

    reg error_block;
    always @(*)
        if ((status == 2'b11) && (on_error_block) && (flash_on))
            error_block <= 1;
        else error_block <= 0;

    assign on_temp_status_red = error_block;

endmodule