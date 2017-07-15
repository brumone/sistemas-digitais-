module pisca (

    input CLOCK_50,
    output [1:0]LEDG
);

    reg [32:0]count = 0;
    reg state = 0;

    assign LEDG[0] = state;
    assign LEDG[1] = ~state;

    // LED pisca sem ser visível devido ao clock

    always @ (posedge CLOCK_50) begin

    if (count == 50000000) begin
                state = ~state;
                count = 0;

    end else begin

                count <= count + 1;

            end

            end

endmodule
