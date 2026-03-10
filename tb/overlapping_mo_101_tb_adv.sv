`timescale 1ns/1ps
module overlap_mo_101_tb_adv();
//declare the logic, parameters identifiers
logic clk = 1'b0 , arstn , in ;
logic out ;

// Register to hold the data to be compared (mimic of sliding window)
logic [2:0] history = 4'b000; 
logic expected_out ;

//Instantiate the module under test 
overlap_mo_101 DUT(.*);

//Generate the clock
localparam T = 10 ;
always #(T/2) clk = ~ clk ;

//Create the stimulus using initial block
initial begin
    //Reseting
    arstn = 1'b0 ;
    in = 1'b0 ;
    repeat(2) @(posedge clk);
    arstn = 1'b1 ;

    //Generate Random Stimulus 
    repeat(50) begin
        @(negedge clk);
        in = $urandom_range(0,1);
        history = {history[2:0],in};
    end

    $display("Simulation Finished with 0 errors!");
    $finish ;

end

always @(posedge clk) begin
    #1 ;
    if(arstn) begin
        expected_out = (history == 3'b101);

        if(out !== expected_out) begin
            $error("[TB INFO] ERROR : Mismatch! Time = %0t | History = %0b | Expexted = %0b | Actual = %0b",
                $time , history , expected_out , out );
        end
    end
end


endmodule