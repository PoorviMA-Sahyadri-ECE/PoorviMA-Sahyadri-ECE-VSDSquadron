module uart_rx (
    input clk,
    input rst,
    input rx,
    output reg [7:0] data,
    output reg done
);
    parameter CLK_FREQ = 12000000;  // 12 MHz
    parameter BAUD_RATE = 9600;
    parameter CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    reg [15:0] clk_count = 0;
    reg [2:0] bit_index = 0;
    reg [7:0] rx_shift = 0;
    reg receiving = 0;
    reg [3:0] state = 0;

    always @(posedge clk) begin
        if (rst) begin
            data <= 0;
            done <= 0;
            clk_count <= 0;
            bit_index <= 0;
            rx_shift <= 0;
            receiving <= 0;
            state <= 0;
        end else begin
            done <= 0;
            case (state)
                0: if (!rx) begin  // start bit detected
                    receiving <= 1;
                    clk_count <= CLKS_PER_BIT / 2;  // sample mid bit
                    state <= 1;
                end
                1: if (clk_count == CLKS_PER_BIT - 1) begin
                    clk_count <= 0;
                    rx_shift[bit_index] <= rx;
                    if (bit_index == 7) state <= 2;
                    else bit_index <= bit_index + 1;
                end else clk_count <= clk_count + 1;
                2: if (clk_count == CLKS_PER_BIT - 1) begin  // stop bit
                    data <= rx_shift;
                    done <= 1;
                    receiving <= 0;
                    bit_index <= 0;
                    clk_count <= 0;
                    state <= 0;
                end else clk_count <= clk_count + 1;
            endcase
        end
    end
endmodule
