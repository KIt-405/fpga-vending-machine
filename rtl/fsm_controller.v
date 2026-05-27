module fsm_controller (
    input wire clk,
    input wire rst,
    input wire total_reached,   
    output reg clear_acc,       
    output reg dispense         
);

    localparam COUNTING = 1'b0;
    localparam DISPENSE = 1'b1;

    reg state, next_state;

    always @(posedge clk , posedge rst)
	 begin
        if (rst) 
            state <= COUNTING;
        else     
            state <= next_state;
    end

    always @(*) begin
        clear_acc  = 1'b0;
        dispense   = 1'b0;
        next_state = state;

        case (state)
            COUNTING:
				begin
                if (total_reached)
                    next_state = DISPENSE;
            end
            
            DISPENSE: 
				begin
                dispense   = 1'b1; 
                clear_acc  = 1'b1; 
                next_state = COUNTING; 
            end
            
            default: next_state = COUNTING;
        endcase
    end

endmodule
