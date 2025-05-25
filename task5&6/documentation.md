FPGA-Based UART-Controlled Actuator System
---
Overview:

Develop a system where the FPGA receives control commands via UART to operates LEDs. This project focuses on decoding serial commands and translating them into physical actions.

Working:
---

Three different leds are driven by uart commands.
Commands are sent from DOCKLIGHT software
When the data is transmitted to fpga through UART, different leds get turned ON in a order. when each command is given each led will ON.
Codes: These are the top.v and uart_trx.v codes used:

`include "uart_trx.v"

module top (

input clk,
input uartrx,
output [2:0] rgb
);

wire [7:0] rxbyte;

wire received;

reg [2:0] rgb_reg = 3'b001; // Start with RED
assign rgb = rgb_reg;

uart_rx_8n1 uart_inst (
    .clk(clk),
    .rx(uartrx),
    .rxbyte(rxbyte),
    .received(received)
);

always @(posedge clk) begin
    if (received) begin
        // Cycle through RED → GREEN → BLUE → RED...
        case (rgb_reg)
            3'b001: rgb_reg <= 3'b010; // RED → GREEN
            3'b010: rgb_reg <= 3'b100; // GREEN → BLUE
            3'b100: rgb_reg <= 3'b001; // BLUE → RED
            default: rgb_reg <= 3'b001; // fallback to RED
        endcase
        end
        end
        endmodule
module uart_rx_8n1 (

input clk,
input rx,
output reg [7:0] rxbyte = 0,
output reg received = 0
);

reg [3:0] bitindex = 0;
reg [7:0] data = 0;
reg [12:0] clkcount = 0;
reg busy = 0;
reg rx_sync = 1;

parameter BAUD_TICKS = 5208;  // 50 MHz / 9600

always @(posedge clk) begin
    rx_sync <= rx;

    if (!busy) begin
        received <= 0;
        if (rx_sync == 0) begin  // start bit
            busy <= 1;
            clkcount <= BAUD_TICKS / 2;
            bitindex <= 0;
        end
    end else begin
        if (clkcount == 0) begin
            clkcount <= BAUD_TICKS;
            if (bitindex < 8) begin
                data[bitindex] <= rx_sync;
                bitindex <= bitindex + 1;
            end else if (bitindex == 8) begin
                rxbyte <= data;
                received <= 1;
                busy <= 0;
            end
        end else begin
            clkcount <= clkcount - 1;
        end
    end
end
endmodule
 FPGA-Based UART-Controlled Display System
---
Overview:

Design a system where the FPGA receives data via UART and displays it on an output device, such as a 7-segment display or an LCD. This project emphasizes real-time data reception and visualization.

Working:
---

A segment display is connected to the FPGA board.
Commands are sent from DOCKLIGHT software to the FPGA.
When the data is transmitted to fpga through UART, the numbers increment in the seven segment display for each command.
CODE: These are the top.v and uart_trx.v codes used:

`include "uart_trx.v"

module top (

input clk,
input uartrx,
output [6:0] seg
);

wire [7:0] rxbyte;
wire received;

reg [6:0] seg_reg;
assign seg = seg_reg;

uart_rx_8n1 uart_inst (
    .clk(clk),
    .rx(uartrx),
    .rxbyte(rxbyte),
    .received(received)
);

always @(posedge clk) begin
    if (received) begin
        case (rxbyte)
            "0": seg_reg <= 7'b1111110;
            "1": seg_reg <= 7'b0110000;
            "2": seg_reg <= 7'b1101101;
            "3": seg_reg <= 7'b1111001;
            "4": seg_reg <= 7'b0110011;
            "5": seg_reg <= 7'b1011011;
            "6": seg_reg <= 7'b1011111;
            "7": seg_reg <= 7'b1110000;
            "8": seg_reg <= 7'b1111111;
            "9": seg_reg <= 7'b1111011;
            default: seg_reg <= 7'b0000001; // Show '-' for invalid input
        endcase
    end
end
endmodule

module uart_rx_8n1 (

input clk,
input rx,
output reg [7:0] rxbyte = 0,
output reg received = 0
);

reg [3:0] bitindex = 0;
reg [7:0] data = 0;
reg [12:0] clkcount = 0;
reg busy = 0;
reg rx_sync = 1;

parameter BAUD_TICKS = 5208;  // 50 MHz / 9600

always @(posedge clk) begin
    rx_sync <= rx;

    if (!busy) begin
        received <= 0;
        if (rx_sync == 0) begin  // start bit
            busy <= 1;
            clkcount <= BAUD_TICKS / 2;
            bitindex <= 0;
        end
    end else begin
        if (clkcount == 0) begin
            clkcount <= BAUD_TICKS;
            if (bitindex < 8) begin
                data[bitindex] <= rx_sync;
                bitindex <= bitindex + 1;
            end else if (bitindex == 8) begin
                rxbyte <= data;
                received <= 1;
                busy <= 0;
            end
        end else begin
            clkcount <= clkcount - 1;
        end
    end
end
endmodule
