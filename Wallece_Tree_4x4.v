module wallece_tree_4x4 (
    input [3:0] A,B,
    output [7:0] Prod);

//first stage
wire [3:0] p0, p1, p2, p3;


//////////////////////////////////////////////////////////////////////
wire s11,s12,s13,s14,s15,//stage 1 sum
     s21,s22,s23,s24,s25;//stage 2 sum 

wire c11,c12,c13,c14,c15,//stage 1 carry
     c21,c22,c23,c24;    //stage 2 carry

assign p0 = A & {4{B[0]}};
assign p1 = A & {4{B[1]}};
assign p2 = A & {4{B[2]}};
assign p3 = A & {4{B[3]}};

half_adder ha1 (
    .a(p0[1]), .b(p1[0]),
    .sum(s11), .carry(c11)
);

full_adder fa1 (
    .a(p0[2]), .b(p1[1]), .cin(p2[0]),
    .sum(s12), .carry(c12)
);

full_adder fa2 (
    .a(p0[3]), .b(p1[2]), .cin(p2[1]),
    .sum(s13), .carry(c13)
);

full_adder fa3 (
    .a(p1[3]), .b(p2[2]), .cin(p3[1]),
    .sum(s14), .carry(c14)
);

half_adder ha2 (
    .a(p2[3]), .b(p3[2]),
    .sum(s15), .carry(c15)
);

// Second reduction stage
half_adder ha3 (
    .a(s12), .b(c11),
    .sum(s21),.carry(c21)
);

full_adder fa4 (
    .a(s13), .b(p3[0]), .cin(c12),
    .sum(s22), .carry(c22)
);

half_adder ha4 (
    .a(s14), .b(c13),
    .sum(s23),.carry(c23)
);

half_adder ha5 (
    .a(s15), .b(c14),
    .sum(s24),.carry(c24)
);

half_adder ha6 (
    .a(p3[3]), .b(c15),
    .sum(s25),  .carry(c25)
);

wire [7:0] sum_final,carry_final;

assign Prod[0] = p0[0];
assign Prod[1] = s11;
assign Prod[2] = s21;
assign Prod[3] = s22 ^ c21;
assign Prod[4] = s23 ^ c22;
assign Prod[5] = s24 ^ c23;
assign Prod[6] = s25 ^ c24;
assign Prod[7] = c25;

endmodule