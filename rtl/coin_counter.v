module coin_counter(
    input wire clk,
    input wire rst,
    input wire coin_inserted,
    output reg [7:0] coin_count
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        coin_count <= 8'd0;

    else if(coin_inserted)
        coin_count <= coin_count + 1'b1;
end

endmodule
