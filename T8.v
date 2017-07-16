// Somador

module adder(
        input clk,
        input [31:0] in1,
        input [31:0] in2,
        output [31:0] o
);

    reg [31:0]  out;
    assign o = out;

    always@(posedge clk) begin
    out <= in1 + in2;

    end
endmodule

module test;

  reg clk;
  reg [31:0] in1, in2;
  wire [31:0] o;

  always #2 clk = ~clk;

  adder A (clk, in1, in2, o);

  initial begin
    $dumpvars(0, A);

    // De 20 em 20 segundos, os valores mudam

    #0 clk <= 0;
    in1 <= 56;
    in2 <= 44;

    #20
    in1 <= 33;
    in2 <= 36;

    #40
    in1 <= 29;
    in2 <= 29;

    #60
    in1 <= 4;
    in2 <= 3;

    #500;
    $finish;

  end
endmodule
