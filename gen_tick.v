//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Colby Ransom
// Email: crans006@ucr.edu
// 
// Assignment name: Lab01-Clocks and Test Benches
// Lab section: 01
// TA: Allan Knight
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

module gen_tick # ( parameter SRC_FREQ = 5000, parameter TICK_FREQ = 1) (
    input src_clk,
    input enable,
    output tick
);


// Declare registers and wires here
integer limit = SRC_FREQ / TICK_FREQ / 2 - 1;
integer acc = 0;
reg tick_out = 0;
always @(posedge src_clk) begin
    if (enable) begin
        acc <= acc + 1;
        if (acc >= limit) begin
            tick_out <= ~tick_out;
            acc <= 0;
        end
    end else begin
        tick_out <= 0;
    end
end


// Change this assign statement to the actual tick value
assign tick = tick_out;

endmodule
