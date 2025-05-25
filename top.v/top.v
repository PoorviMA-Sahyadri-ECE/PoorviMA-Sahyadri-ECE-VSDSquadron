module top(
    input clk, // 12 MHz clock
    input uart_rx_pin, // unused
    output [6:0] seg,
    output dp
);

reg [25:0] delay_cnt = 0;
reg [3:0] digit = 1;
reg [6:0] seg_reg;

parameter DELAY_LIMIT = 36000000; // 3 seconds at 12 MHz

assign seg = seg_reg;
assign dp = 1'b1; // You can change this if needed

// 7-segment decoder function
function [6:0] digit_to_seg;
    input [3:0] d;
    begin
        case (d)
            4'd1: digit_to_seg = 7'b0110000;
            4'd2: digit_to_seg = 7'b1101101;
            4'd3: digit_to_seg = 7'b1111001;
            4'd4: digit_to_seg = 7'b0110011;
            4'd5: digit_to_seg = 7'b1011011;
            4'd6: digit_to_seg = 7'b1011111;
            4'd7: digit_to_seg = 7'b1110000;
            4'd8: digit_to_seg = 7'b1111111;
            4'd9: digit_to_seg = 7'b1111011;
            default: digit_to_seg = 7'b0000000;
        endcase
    end
endfunction

always @(posedge clk) begin
    if (delay_cnt >= DELAY_LIMIT) begin
        delay_cnt <= 0;
        digit <= (digit == 9) ? 1 : digit + 1;
    end else begin
        delay_cnt <= delay_cnt + 1;
    end

    seg_reg <= digit_to_seg(digit);
end

endmodule


