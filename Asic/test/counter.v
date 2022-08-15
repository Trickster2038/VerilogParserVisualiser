module counter(output1, clk, reset);

  parameter WIDTH = 8;

  output [WIDTH-1 : 0] output1;
  input 	       clk, reset;

  reg [WIDTH-1 : 0]   output1;
  wire 	       clk, reset;

  always @(posedge clk or posedge reset)
    if (reset)
      output1 <= 0;
    else
      output1 <= output1 + 1;

endmodule // counter
