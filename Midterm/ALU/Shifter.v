`timescale 1ns/1ns

module Shifter( dataOut, dataA, shamt, Signal, reset );
    // port
    input reset ;
    input [31:0] dataA ;
    input [31:0] shamt;
    input [5:0] Signal ;
    output [31:0] dataOut ;

    // parameter SRL = 6'b000010;

    // inner wire
    wire [31:0] wire1;
    wire [31:0] wire2;
    wire [31:0] wire3;
    wire [31:0] wire4;

    // instantantiate: 32*5 = 160
    mux_2to1 m000( .Z(wire1[0]), .A(dataA[0]), .B(dataA[1]), .S(shamt[0]) );
    mux_2to1 m001( .Z(wire1[1]), .A(dataA[1]), .B(dataA[2]), .S(shamt[0]) );
    mux_2to1 m002( .Z(wire1[2]), .A(dataA[2]), .B(dataA[3]), .S(shamt[0]) );
    mux_2to1 m003( .Z(wire1[3]), .A(dataA[3]), .B(dataA[4]), .S(shamt[0]) );
    mux_2to1 m004( .Z(wire1[4]), .A(dataA[4]), .B(dataA[5]), .S(shamt[0]) );
    mux_2to1 m005( .Z(wire1[5]), .A(dataA[5]), .B(dataA[6]), .S(shamt[0]) );
    mux_2to1 m006( .Z(wire1[6]), .A(dataA[6]), .B(dataA[7]), .S(shamt[0]) );
    mux_2to1 m007( .Z(wire1[7]), .A(dataA[7]), .B(dataA[8]), .S(shamt[0]) );
    mux_2to1 m008( .Z(wire1[8]), .A(dataA[8]), .B(dataA[9]), .S(shamt[0]) );
    mux_2to1 m009( .Z(wire1[9]), .A(dataA[9]), .B(dataA[10]), .S(shamt[0]) );
    mux_2to1 m010( .Z(wire1[10]), .A(dataA[10]), .B(dataA[11]), .S(shamt[0]) );
    mux_2to1 m011( .Z(wire1[11]), .A(dataA[11]), .B(dataA[12]), .S(shamt[0]) );
    mux_2to1 m012( .Z(wire1[12]), .A(dataA[12]), .B(dataA[13]), .S(shamt[0]) );
    mux_2to1 m013( .Z(wire1[13]), .A(dataA[13]), .B(dataA[14]), .S(shamt[0]) );
    mux_2to1 m014( .Z(wire1[14]), .A(dataA[14]), .B(dataA[15]), .S(shamt[0]) );
    mux_2to1 m015( .Z(wire1[15]), .A(dataA[15]), .B(dataA[16]), .S(shamt[0]) );
    mux_2to1 m016( .Z(wire1[16]), .A(dataA[16]), .B(dataA[17]), .S(shamt[0]) );
    mux_2to1 m017( .Z(wire1[17]), .A(dataA[17]), .B(dataA[18]), .S(shamt[0]) );
    mux_2to1 m018( .Z(wire1[18]), .A(dataA[18]), .B(dataA[19]), .S(shamt[0]) );
    mux_2to1 m019( .Z(wire1[19]), .A(dataA[19]), .B(dataA[20]), .S(shamt[0]) );
    mux_2to1 m020( .Z(wire1[20]), .A(dataA[20]), .B(dataA[21]), .S(shamt[0]) );
    mux_2to1 m021( .Z(wire1[21]), .A(dataA[21]), .B(dataA[22]), .S(shamt[0]) );
    mux_2to1 m022( .Z(wire1[22]), .A(dataA[22]), .B(dataA[23]), .S(shamt[0]) );
    mux_2to1 m023( .Z(wire1[23]), .A(dataA[23]), .B(dataA[24]), .S(shamt[0]) );
    mux_2to1 m024( .Z(wire1[24]), .A(dataA[24]), .B(dataA[25]), .S(shamt[0]) );
    mux_2to1 m025( .Z(wire1[25]), .A(dataA[25]), .B(dataA[26]), .S(shamt[0]) );
    mux_2to1 m026( .Z(wire1[26]), .A(dataA[26]), .B(dataA[27]), .S(shamt[0]) );
    mux_2to1 m027( .Z(wire1[27]), .A(dataA[27]), .B(dataA[28]), .S(shamt[0]) );
    mux_2to1 m028( .Z(wire1[28]), .A(dataA[28]), .B(dataA[29]), .S(shamt[0]) );
    mux_2to1 m029( .Z(wire1[29]), .A(dataA[29]), .B(dataA[30]), .S(shamt[0]) );
    mux_2to1 m030( .Z(wire1[30]), .A(dataA[30]), .B(dataA[31]), .S(shamt[0]) );
    mux_2to1 m031( .Z(wire1[31]), .A(dataA[31]), .B(1'b0), .S(shamt[0]) ); // 2 ** 0 = 1, logical left shift => 1'b0 * 1 start at bottom

    mux_2to1 m100( .Z(wire2[0]), .A(wire1[0]), .B(wire1[2]), .S(shamt[1]) );
    mux_2to1 m101( .Z(wire2[1]), .A(wire1[1]), .B(wire1[3]), .S(shamt[1]) );
    mux_2to1 m102( .Z(wire2[2]), .A(wire1[2]), .B(wire1[4]), .S(shamt[1]) );
    mux_2to1 m103( .Z(wire2[3]), .A(wire1[3]), .B(wire1[5]), .S(shamt[1]) );
    mux_2to1 m104( .Z(wire2[4]), .A(wire1[4]), .B(wire1[6]), .S(shamt[1]) );
    mux_2to1 m105( .Z(wire2[5]), .A(wire1[5]), .B(wire1[7]), .S(shamt[1]) );
    mux_2to1 m106( .Z(wire2[6]), .A(wire1[6]), .B(wire1[8]), .S(shamt[1]) );
    mux_2to1 m107( .Z(wire2[7]), .A(wire1[7]), .B(wire1[9]), .S(shamt[1]) );
    mux_2to1 m108( .Z(wire2[8]), .A(wire1[8]), .B(wire1[10]), .S(shamt[1]) );
    mux_2to1 m109( .Z(wire2[9]), .A(wire1[9]), .B(wire1[11]), .S(shamt[1]) );
    mux_2to1 m110( .Z(wire2[10]), .A(wire1[10]), .B(wire1[12]), .S(shamt[1]) );
    mux_2to1 m111( .Z(wire2[11]), .A(wire1[11]), .B(wire1[13]), .S(shamt[1]) );
    mux_2to1 m112( .Z(wire2[12]), .A(wire1[12]), .B(wire1[14]), .S(shamt[1]) );
    mux_2to1 m113( .Z(wire2[13]), .A(wire1[13]), .B(wire1[15]), .S(shamt[1]) );
    mux_2to1 m114( .Z(wire2[14]), .A(wire1[14]), .B(wire1[16]), .S(shamt[1]) );
    mux_2to1 m115( .Z(wire2[15]), .A(wire1[15]), .B(wire1[17]), .S(shamt[1]) );
    mux_2to1 m116( .Z(wire2[16]), .A(wire1[16]), .B(wire1[18]), .S(shamt[1]) );
    mux_2to1 m117( .Z(wire2[17]), .A(wire1[17]), .B(wire1[19]), .S(shamt[1]) );
    mux_2to1 m118( .Z(wire2[18]), .A(wire1[18]), .B(wire1[20]), .S(shamt[1]) );
    mux_2to1 m119( .Z(wire2[19]), .A(wire1[19]), .B(wire1[21]), .S(shamt[1]) );
    mux_2to1 m120( .Z(wire2[20]), .A(wire1[20]), .B(wire1[22]), .S(shamt[1]) );
    mux_2to1 m121( .Z(wire2[21]), .A(wire1[21]), .B(wire1[23]), .S(shamt[1]) );
    mux_2to1 m122( .Z(wire2[22]), .A(wire1[22]), .B(wire1[24]), .S(shamt[1]) );
    mux_2to1 m123( .Z(wire2[23]), .A(wire1[23]), .B(wire1[25]), .S(shamt[1]) );
    mux_2to1 m124( .Z(wire2[24]), .A(wire1[24]), .B(wire1[26]), .S(shamt[1]) );
    mux_2to1 m125( .Z(wire2[25]), .A(wire1[25]), .B(wire1[27]), .S(shamt[1]) );
    mux_2to1 m126( .Z(wire2[26]), .A(wire1[26]), .B(wire1[28]), .S(shamt[1]) );
    mux_2to1 m127( .Z(wire2[27]), .A(wire1[27]), .B(wire1[29]), .S(shamt[1]) );
    mux_2to1 m128( .Z(wire2[28]), .A(wire1[28]), .B(wire1[30]), .S(shamt[1]) );
    mux_2to1 m129( .Z(wire2[29]), .A(wire1[29]), .B(wire1[31]), .S(shamt[1]) );
    mux_2to1 m130( .Z(wire2[30]), .A(wire1[30]), .B(1'b0), .S(shamt[1]) ); // 2 ** 1 = 2, logical left shift => 1'b0 * 2 start at bottom
    mux_2to1 m131( .Z(wire2[31]), .A(wire1[31]), .B(1'b0), .S(shamt[1]) );

    mux_2to1 m200( .Z(wire3[0]), .A(wire2[0]), .B(wire2[4]), .S(shamt[2]) );
    mux_2to1 m201( .Z(wire3[1]), .A(wire2[1]), .B(wire2[5]), .S(shamt[2]) );
    mux_2to1 m202( .Z(wire3[2]), .A(wire2[2]), .B(wire2[6]), .S(shamt[2]) );
    mux_2to1 m203( .Z(wire3[3]), .A(wire2[3]), .B(wire2[7]), .S(shamt[2]) );
    mux_2to1 m204( .Z(wire3[4]), .A(wire2[4]), .B(wire2[8]), .S(shamt[2]) );
    mux_2to1 m205( .Z(wire3[5]), .A(wire2[5]), .B(wire2[9]), .S(shamt[2]) );
    mux_2to1 m206( .Z(wire3[6]), .A(wire2[6]), .B(wire2[10]), .S(shamt[2]) );
    mux_2to1 m207( .Z(wire3[7]), .A(wire2[7]), .B(wire2[11]), .S(shamt[2]) );
    mux_2to1 m208( .Z(wire3[8]), .A(wire2[8]), .B(wire2[12]), .S(shamt[2]) );
    mux_2to1 m209( .Z(wire3[9]), .A(wire2[9]), .B(wire2[13]), .S(shamt[2]) );
    mux_2to1 m210( .Z(wire3[10]), .A(wire2[10]), .B(wire2[14]), .S(shamt[2]) );
    mux_2to1 m211( .Z(wire3[11]), .A(wire2[11]), .B(wire2[15]), .S(shamt[2]) );
    mux_2to1 m212( .Z(wire3[12]), .A(wire2[12]), .B(wire2[16]), .S(shamt[2]) );
    mux_2to1 m213( .Z(wire3[13]), .A(wire2[13]), .B(wire2[17]), .S(shamt[2]) );
    mux_2to1 m214( .Z(wire3[14]), .A(wire2[14]), .B(wire2[18]), .S(shamt[2]) );
    mux_2to1 m215( .Z(wire3[15]), .A(wire2[15]), .B(wire2[19]), .S(shamt[2]) );
    mux_2to1 m216( .Z(wire3[16]), .A(wire2[16]), .B(wire2[20]), .S(shamt[2]) );
    mux_2to1 m217( .Z(wire3[17]), .A(wire2[17]), .B(wire2[21]), .S(shamt[2]) );
    mux_2to1 m218( .Z(wire3[18]), .A(wire2[18]), .B(wire2[22]), .S(shamt[2]) );
    mux_2to1 m219( .Z(wire3[19]), .A(wire2[19]), .B(wire2[23]), .S(shamt[2]) );
    mux_2to1 m220( .Z(wire3[20]), .A(wire2[20]), .B(wire2[24]), .S(shamt[2]) );
    mux_2to1 m221( .Z(wire3[21]), .A(wire2[21]), .B(wire2[25]), .S(shamt[2]) );
    mux_2to1 m222( .Z(wire3[22]), .A(wire2[22]), .B(wire2[26]), .S(shamt[2]) );
    mux_2to1 m223( .Z(wire3[23]), .A(wire2[23]), .B(wire2[27]), .S(shamt[2]) );
    mux_2to1 m224( .Z(wire3[24]), .A(wire2[24]), .B(wire2[28]), .S(shamt[2]) );
    mux_2to1 m225( .Z(wire3[25]), .A(wire2[25]), .B(wire2[29]), .S(shamt[2]) );
    mux_2to1 m226( .Z(wire3[26]), .A(wire2[26]), .B(wire2[30]), .S(shamt[2]) );
    mux_2to1 m227( .Z(wire3[27]), .A(wire2[27]), .B(wire2[31]), .S(shamt[2]) );
    mux_2to1 m228( .Z(wire3[28]), .A(wire2[28]), .B(1'b0), .S(shamt[2]) ); // 2 ** 2 = 4, logical left shift => 1'b0 * 4 start at bottom
    mux_2to1 m229( .Z(wire3[29]), .A(wire2[29]), .B(1'b0), .S(shamt[2]) );
    mux_2to1 m230( .Z(wire3[30]), .A(wire2[30]), .B(1'b0), .S(shamt[2]) );
    mux_2to1 m231( .Z(wire3[31]), .A(wire2[31]), .B(1'b0), .S(shamt[2]) );

    mux_2to1 m300( .Z(wire4[0]), .A(wire3[0]), .B(wire3[8]), .S(shamt[3]) );
    mux_2to1 m301( .Z(wire4[1]), .A(wire3[1]), .B(wire3[9]), .S(shamt[3]) );
    mux_2to1 m302( .Z(wire4[2]), .A(wire3[2]), .B(wire3[10]), .S(shamt[3]) );
    mux_2to1 m303( .Z(wire4[3]), .A(wire3[3]), .B(wire3[11]), .S(shamt[3]) );
    mux_2to1 m304( .Z(wire4[4]), .A(wire3[4]), .B(wire3[12]), .S(shamt[3]) );
    mux_2to1 m305( .Z(wire4[5]), .A(wire3[5]), .B(wire3[13]), .S(shamt[3]) );
    mux_2to1 m306( .Z(wire4[6]), .A(wire3[6]), .B(wire3[14]), .S(shamt[3]) );
    mux_2to1 m307( .Z(wire4[7]), .A(wire3[7]), .B(wire3[15]), .S(shamt[3]) );
    mux_2to1 m308( .Z(wire4[8]), .A(wire3[8]), .B(wire3[16]), .S(shamt[3]) );
    mux_2to1 m309( .Z(wire4[9]), .A(wire3[9]), .B(wire3[17]), .S(shamt[3]) );
    mux_2to1 m310( .Z(wire4[10]), .A(wire3[10]), .B(wire3[18]), .S(shamt[3]) );
    mux_2to1 m311( .Z(wire4[11]), .A(wire3[11]), .B(wire3[19]), .S(shamt[3]) );
    mux_2to1 m312( .Z(wire4[12]), .A(wire3[12]), .B(wire3[20]), .S(shamt[3]) );
    mux_2to1 m313( .Z(wire4[13]), .A(wire3[13]), .B(wire3[21]), .S(shamt[3]) );
    mux_2to1 m314( .Z(wire4[14]), .A(wire3[14]), .B(wire3[22]), .S(shamt[3]) );
    mux_2to1 m315( .Z(wire4[15]), .A(wire3[15]), .B(wire3[23]), .S(shamt[3]) );
    mux_2to1 m316( .Z(wire4[16]), .A(wire3[16]), .B(wire3[24]), .S(shamt[3]) );
    mux_2to1 m317( .Z(wire4[17]), .A(wire3[17]), .B(wire3[25]), .S(shamt[3]) );
    mux_2to1 m318( .Z(wire4[18]), .A(wire3[18]), .B(wire3[26]), .S(shamt[3]) );
    mux_2to1 m319( .Z(wire4[19]), .A(wire3[19]), .B(wire3[27]), .S(shamt[3]) );
    mux_2to1 m320( .Z(wire4[20]), .A(wire3[20]), .B(wire3[28]), .S(shamt[3]) );
    mux_2to1 m321( .Z(wire4[21]), .A(wire3[21]), .B(wire3[29]), .S(shamt[3]) );
    mux_2to1 m322( .Z(wire4[22]), .A(wire3[22]), .B(wire3[30]), .S(shamt[3]) );
    mux_2to1 m323( .Z(wire4[23]), .A(wire3[23]), .B(wire3[31]), .S(shamt[3]) );
    mux_2to1 m324( .Z(wire4[24]), .A(wire3[24]), .B(1'b0), .S(shamt[3]) ); // 2 ** 3 = 8, logical left shift => 1'b0 * 8 start at bottom
    mux_2to1 m325( .Z(wire4[25]), .A(wire3[25]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m326( .Z(wire4[26]), .A(wire3[26]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m327( .Z(wire4[27]), .A(wire3[27]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m328( .Z(wire4[28]), .A(wire3[28]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m329( .Z(wire4[29]), .A(wire3[29]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m330( .Z(wire4[30]), .A(wire3[30]), .B(1'b0), .S(shamt[3]) );
    mux_2to1 m331( .Z(wire4[31]), .A(wire3[31]), .B(1'b0), .S(shamt[3]) );

    mux_2to1 m400( .Z(dataOut[0]), .A(wire4[0]), .B(wire4[16]), .S(shamt[4]) );
    mux_2to1 m401( .Z(dataOut[1]), .A(wire4[1]), .B(wire4[17]), .S(shamt[4]) );
    mux_2to1 m402( .Z(dataOut[2]), .A(wire4[2]), .B(wire4[18]), .S(shamt[4]) );
    mux_2to1 m403( .Z(dataOut[3]), .A(wire4[3]), .B(wire4[19]), .S(shamt[4]) );
    mux_2to1 m404( .Z(dataOut[4]), .A(wire4[4]), .B(wire4[20]), .S(shamt[4]) );
    mux_2to1 m405( .Z(dataOut[5]), .A(wire4[5]), .B(wire4[21]), .S(shamt[4]) );
    mux_2to1 m406( .Z(dataOut[6]), .A(wire4[6]), .B(wire4[22]), .S(shamt[4]) );
    mux_2to1 m407( .Z(dataOut[7]), .A(wire4[7]), .B(wire4[23]), .S(shamt[4]) );
    mux_2to1 m408( .Z(dataOut[8]), .A(wire4[8]), .B(wire4[24]), .S(shamt[4]) );
    mux_2to1 m409( .Z(dataOut[9]), .A(wire4[9]), .B(wire4[25]), .S(shamt[4]) );
    mux_2to1 m410( .Z(dataOut[10]), .A(wire4[10]), .B(wire4[26]), .S(shamt[4]) );
    mux_2to1 m411( .Z(dataOut[11]), .A(wire4[11]), .B(wire4[27]), .S(shamt[4]) );
    mux_2to1 m412( .Z(dataOut[12]), .A(wire4[12]), .B(wire4[28]), .S(shamt[4]) );
    mux_2to1 m413( .Z(dataOut[13]), .A(wire4[13]), .B(wire4[29]), .S(shamt[4]) );
    mux_2to1 m414( .Z(dataOut[14]), .A(wire4[14]), .B(wire4[30]), .S(shamt[4]) );
    mux_2to1 m415( .Z(dataOut[15]), .A(wire4[15]), .B(wire4[31]), .S(shamt[4]) );
    mux_2to1 m416( .Z(dataOut[16]), .A(wire4[16]), .B(1'b0), .S(shamt[4]) ); // 2 ** 4 =16, logical left shift => 1'b0 * 16 start at bottom
    mux_2to1 m417( .Z(dataOut[17]), .A(wire4[17]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m418( .Z(dataOut[18]), .A(wire4[18]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m419( .Z(dataOut[19]), .A(wire4[19]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m420( .Z(dataOut[20]), .A(wire4[20]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m421( .Z(dataOut[21]), .A(wire4[21]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m422( .Z(dataOut[22]), .A(wire4[22]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m423( .Z(dataOut[23]), .A(wire4[23]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m424( .Z(dataOut[24]), .A(wire4[24]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m425( .Z(dataOut[25]), .A(wire4[25]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m426( .Z(dataOut[26]), .A(wire4[26]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m427( .Z(dataOut[27]), .A(wire4[27]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m428( .Z(dataOut[28]), .A(wire4[28]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m429( .Z(dataOut[29]), .A(wire4[29]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m430( .Z(dataOut[30]), .A(wire4[30]), .B(1'b0), .S(shamt[4]) );
    mux_2to1 m431( .Z(dataOut[31]), .A(wire4[31]), .B(1'b0), .S(shamt[4]) );
endmodule