module coin_mux(
    input wire coin_5c,
    input wire coin_10c,
    input wire coin_25c,
    output reg [7:0] coin_value
);

always @(*) begin
    if (coin_25c)
        coin_value = 8'd25;
    else if (coin_10c)
        coin_value = 8'd10;
    else if (coin_5c)
        coin_value = 8'd5;
    else
        coin_value = 8'd0;
end

endmodule
