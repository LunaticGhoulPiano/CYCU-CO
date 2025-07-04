`timescale 1ns/1ns

module mux_2to1(Z, A, B, S);
    // port
    input A, B, S;
    output Z;

    // S: 0 => output: A
    // S: 1 => output: B
    assign Z = S ? B : A;
endmodule