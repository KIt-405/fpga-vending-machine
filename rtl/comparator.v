module comparator(
    input wire [7:0] current_total,
    output wire total_reached
);

assign total_reached =
        (current_total >= 8'd45);

endmodule
