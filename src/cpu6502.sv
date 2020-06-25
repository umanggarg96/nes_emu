`default_nettype none
module cpu6502
  (
    input   wire        clk,
    input   wire        res_n,
    input   wire [15:0] addr,
    input   wire        r_nw,
    inout   wire [ 7:0] data
  );

  logic [7:0] data_out;

  always @(posedge clk)
    if(!res_n)  data_out <= 8'h00;
    else        data_out <= addr[7:0] & addr[15:8];
  
  assign data = (r_nw) ? 8'hzz : data_out;

endmodule
