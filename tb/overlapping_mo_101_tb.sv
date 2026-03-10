module overlap_mo_101_tb();
//declare local, logic identifiers 
logic clk = 1'b0 , arstn , in;
logic out;
//Instantiate the module under test 
overlap_mo_101 DUT(.*);
//Generate the clock
localparam T = 10; 
always #(T/2) clk = ~ clk ;
//Create the stimulis using initial block
// task checl;
//     input logic out_expected;
//     begin
//         if(out == out_expected) begin
            
//         end
//     end
// endtask

initial begin
    arstn = 1'b1 ;
    in = 1'b0 ;
    #2 arstn = 1'b0 ;
    #2 arstn = 1'b1 ;
    in = 1'b1 ;
    @(negedge clk);
    in = 1'b0 ;
    @(negedge clk);
    in = 1'b1 ;
    @(negedge clk);
    in = 1'b0 ;
    @(negedge clk);
    in = 1'b1 ;
    @(negedge clk);
    in = 1'b0 ;
    repeat(3) begin
        @(negedge clk);
        in = 1'b1 ;
    end
    @(negedge clk);
    in = 1'b0 ;
    @(negedge clk);
    in = 1'b1 ;
    #2 $stop ;

end
endmodule    