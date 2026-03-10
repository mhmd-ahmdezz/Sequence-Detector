module overlap_mo_101(
    input  logic clk , arstn , in ,
    output logic out
);

//Registers and Sequential Logic
typedef enum logic[1:0] {S0 , S1 , S2 , S3} state_t ;
state_t current_state , next_state ;

always_ff @(posedge clk , negedge arstn) begin
    if(!arstn)
        current_state <= S0 ; 
    else 
        current_state <= next_state ;
end

//Combinational Logic
always_comb begin
    case(current_state) 
        S0 : next_state = (in)? S1 : S0 ;
        S1 : next_state = (in)? S1 : S2 ;
        S2 : next_state = (in)? S3 : S0 ;
        S3 : next_state = (in)? S1 : S2 ;
        default : next_state = S0 ;
    endcase
end

//Output : 
assign out = (current_state == S3) ;

endmodule