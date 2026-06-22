module adder #(parameter WIDTH = 8)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  CIN,
    output [WIDTH-1:0] SUM,
    output COUT
);

assign {COUT, SUM} = A + B + CIN;

endmodule