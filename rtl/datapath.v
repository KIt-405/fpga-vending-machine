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

    assign coin_value = coin_25c ? 8'd25 :
                        coin_10c ? 8'd10 :
                        coin_5c  ? 8'd5  : 8'd0;

    // Accumulator Register (Sequential Logic)
    always @(posedge clk , posedge rst)
	 begin
        if (rst) 
            current_total <= 8'd0;
        
        else if (clear_acc) 
            current_total <= 8'd0;
        
        else if (coin_5c || coin_10c || coin_25c) 
            current_total <= current_total + coin_value;
        
    end

    assign total_reached = (current_total >= 8'd45);

endmodule
