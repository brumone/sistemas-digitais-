module piscadireito (
      input CLOCK_50,
      output [2:0]LEDG
);

    reg [28:0] count = 0;
    reg state = 0;

    assign LEDG[0] = 0;
    assign LEDG[1] = 1;
    assign LEDG[2] = state;

    always @ (posedge CLOCK_50)
        begin

            if(count == 50000000)
                begin
                      count = 0;
                          state  <= ~state;
              end

          else
              begin
                  count <= count + 1;
          end

          end

endmodule
