// Triângulo em Verilog

module sign(

    input [11:0] p1x,
    input [11:0] p1y,

    input [11:0] p2x,
    input [11:0] p2y,

    input [11:0] p3x,
    input [11:0] p3y,
    output s
);

  wire [11:0] s1;
  wire [11:0] s2;
  wire [11:0] s3;
  wire [11:0] s4;

  assign s1 = p1x - p3x;
  assign s2 = p2y - p3y;
  assign s3 = p2x - p3x;
  assign s4 = p1y - p3y;
  assign s = (s1 * s2) - (s3 * s4);

  endmodule

module isPointinTri (

    input[11:0] p1x,
    input[11:0] p1y,

    input[11:0] p2x,
    input[11:0] p2y,

    input[11:0] p3x,
    input[11:0] p3y,

    input[11:0] px,
    input[11:0] py,
    output s
);

  wire b1;
  wire b2;
  wire b3;

  reg o_reg;

  assign s = o_reg;

  sign a(px, py, p1x, p1y, p2x, p2y, b1);
  sign b(px, py, p2x, p2y, p3x, p3y, b2);
  sign c(px, py, p3x, p3y, p1x, p1y, b3);

  always @(*) begin
    if(b1 == b2 && b2 == b3)begin
              o_reg <= 1;
    end
    else begin
            o_reg <= 0;
    end
end

    endmodule

    module test;

    reg [11:0] p1x;
    reg [11:0] p1y;

    reg [11:0] p2x;
    reg [11:0] p2y;

    reg [11:0] p3x;
    reg [11:0] p3y;

    reg [11:0] px;
    reg [11:0] py;
    wire s;

    isPointinTri A(p1x, p1y, p2x, p2y, p3x, p3y, px, py, s);

    initial begin
      $dumpvars(0, A);
      #5
      p1x <= 5;
      p1y <= 7;
      p2x <= 11;
      p2y <= -2;
      p3x <= 13;
      p3y <= 4;
      px <= 1;
      py <= 0;

      #5
      p1x <= 0;
      p1y <= 5;
      p2x <= 10;
      p2y <= 7;
      p3x <= 9;
      p3y <= 11;
      px <= -3;
      py <= 0;

      #5

      p1x <= 5;
      p1y <= 7;
      p2x <= 11;
      p2y <= -2;
      p3x <= 13;
      p3y <= 4;
      px <= 1;
      py <= 0;

      #5
      p1x <= 5;
      p1y <= 7;
      p2x <= 11;
      p2y <= -2;
      p3x <= 13;
      p3y <= 4;
      px <= 1;
      py <= 0;
      #20

      $finish;

end

endmodule
