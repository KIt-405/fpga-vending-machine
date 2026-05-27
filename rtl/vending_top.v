module vending_top (
    input wire clk,
    input wire rst,
    input wire coin_5c,
    input wire coin_10c,
    input wire coin_25c,
    output wire dispense,
    output wire [7:0] change_out
);

    wire clear_acc_wire;
    wire total_reached_wire;
    wire [7:0] current_total_wire;

    datapath U_DATAPATH (
        .clk(clk),
        .rst(rst),
        .coin_5c(coin_5c),
        .coin_10c(coin_10c),
        .coin_25c(coin_25c),
        .clear_acc(clear_acc_wire),
        .current_total(current_total_wire),
        .total_reached(total_reached_wire)
    );

    fsm_controller U_FSM (
        .clk(clk),
        .rst(rst),
        .total_reached(total_reached_wire),
        .clear_acc(clear_acc_wire),
        .dispense(dispense)
    );

    assign change_out = (dispense && (current_total_wire >= 8'd45)) 
                        ? (current_total_wire - 8'd45) 
                        : 8'd0;

endmodule
