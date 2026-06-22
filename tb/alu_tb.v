`timescale 1ns/1ps

module alu_tb;

reg clk;
reg rst;

reg en;
reg lp_mode;

reg [7:0] A;
reg [7:0] B;

reg [3:0] opcode;

wire [7:0] result;

wire zero;
wire carry;
wire overflow;
wire negative;

alu DUT(
.clk(clk),
.rst(rst),
.en(en),
.lp_mode(lp_mode),
.A(A),
.B(B),
.opcode(opcode),
.result(result),
.zero(zero),
.carry(carry),
.overflow(overflow),
.negative(negative)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("waves.vcd");
    $dumpvars(0,alu_tb);

    clk = 0;
    rst = 1;

    en = 0;
    lp_mode = 0;

    A = 0;
    B = 0;
    opcode = 0;

    #20;
    rst = 0;
    en = 1;

    // ADD
    A = 20;
    B = 10;
    opcode = 4'b0000;
    #20;

    // SUB
    A = 30;
    B = 10;
    opcode = 4'b0001;
    #20;

    // AND
    A = 8'hF0;
    B = 8'h0F;
    opcode = 4'b0010;
    #20;

    // OR
    opcode = 4'b0011;
    #20;

    // XOR
    opcode = 4'b0100;
    #20;

    // NOT
    opcode = 4'b0101;
    #20;

    // Shift Left
    opcode = 4'b0110;
    #20;

    // Shift Right
    opcode = 4'b0111;
    #20;

    // Increment
    opcode = 4'b1000;
    #20;

    // Decrement
    opcode = 4'b1001;
    #20;

    // Compare
    A = 50;
    B = 20;
    opcode = 4'b1010;
    #20;

    // Low Power Mode
    lp_mode = 1;
    en = 0;
    #40;

    $finish;

end

initial
begin

$monitor(
"Time=%0t A=%d B=%d OPC=%b Result=%d Z=%b C=%b N=%b",
$time,
A,
B,
opcode,
result,
zero,
carry,
negative
);

end

endmodule