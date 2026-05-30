module datapath (
    input wire clk,
    input wire rst,
    input wire coin_5c,
    input wire coin_10c,
    input wire coin_25c,
    input wire clear_acc,
    output reg [7:0] current_total,
    output wire total_reached
);

wire [7:0] coin_value;

coin_mux U_MUX(
    .coin_5c(coin_5c),
    .coin_10c(coin_10c),
    .coin_25c(coin_25c),
    .coin_value(coin_value)
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        current_total <= 8'd0;

    else if(clear_acc)
        current_total <= 8'd0;

    else if(coin_5c || coin_10c || coin_25c)
        current_total <= current_total + coin_value;
end

comparator U_COMP(
    .current_total(current_total),
    .total_reached(total_reached)
);

endmodule
