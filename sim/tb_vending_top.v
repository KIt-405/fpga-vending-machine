`timescale 1ns / 1ps

module tb_vending_top();

    reg clk;
    reg rst;
    reg coin_5c;
    reg coin_10c;
    reg coin_25c;
    
    wire dispense;
    wire [7:0] change_out;

    vending_top UUT (
        .clk(clk),
        .rst(rst),
        .coin_5c(coin_5c),
        .coin_10c(coin_10c),
        .coin_25c(coin_25c),
        .dispense(dispense),
        .change_out(change_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        coin_5c = 0;
        coin_10c = 0;
        coin_25c = 0;

        #40;
        rst = 0;
        #20;

        
        coin_25c = 1; #20; 
        coin_25c = 0; #40; 

        
        coin_25c = 1; #20; 
        coin_25c = 0; #100;

 
        
        coin_25c = 1; #20; coin_25c = 0; #40;
        coin_10c = 1; #20; coin_10c = 0; #40;
        coin_10c = 1; #20; coin_10c = 0; #100;
        $stop;
    end

endmodule
