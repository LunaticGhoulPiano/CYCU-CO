`timescale 1ns/1ns
module full_adder(Sum, Cout, A, B, Cin);
    input A, B, Cin;
    output Sum, Cout;
    wire w1;
    xor xor1(w1, A, B);
    xor xor2(Sum, w1, Cin);

    wire w2, w3, w4;
    or or1(w2, A, B);
    and and1(w3, Cin, w2);
    and and2(w4, A, B);
    or or2(Cout, w3, w4);
endmodule