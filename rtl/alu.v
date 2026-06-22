module alu #(parameter WIDTH = 8)
(
    input clk,
    input rst,

    input en,
    input lp_mode,

    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,

    input [3:0] opcode,

    output reg [WIDTH-1:0] result,

    output reg zero,
    output reg carry,
    output reg overflow,
    output reg negative
);

reg [WIDTH:0] temp;

wire [WIDTH-1:0] A_iso;
wire [WIDTH-1:0] B_iso;

// Operand Isolation
assign A_iso = (en) ? A : {WIDTH{1'b0}};
assign B_iso = (en) ? B : {WIDTH{1'b0}};

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        result <= 0;
        zero <= 0;
        carry <= 0;
        overflow <= 0;
        negative <= 0;
    end

    else if(en)
    begin

        carry <= 0;
        overflow <= 0;

        case(opcode)

        // ADD
        4'b0000:
        begin
            temp = A_iso + B_iso;
            result <= temp[WIDTH-1:0];
            carry <= temp[WIDTH];
        end

        // SUB
        4'b0001:
        begin
            temp = A_iso - B_iso;
            result <= temp[WIDTH-1:0];
            carry <= temp[WIDTH];
        end

        // AND
        4'b0010:
            result <= A_iso & B_iso;

        // OR
        4'b0011:
            result <= A_iso | B_iso;

        // XOR
        4'b0100:
            result <= A_iso ^ B_iso;

        // NOT A
        4'b0101:
            result <= ~A_iso;

        // Shift Left
        4'b0110:
            result <= A_iso << 1;

        // Shift Right
        4'b0111:
            result <= A_iso >> 1;

        // Increment
        4'b1000:
            result <= A_iso + 1;

        // Decrement
        4'b1001:
            result <= A_iso - 1;

        // Compare
        4'b1010:
        begin
            if(A_iso > B_iso)
                result <= 8'd1;
            else if(A_iso == B_iso)
                result <= 8'd0;
            else
                result <= 8'd255;
        end

        default:
            result <= 0;

        endcase

        zero <= (result == 0);
        negative <= result[WIDTH-1];

    end

end

endmodule