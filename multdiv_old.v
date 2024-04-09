module multdiv2(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire [5:0] count;
    
    wire [63:0] final_product, final_division;

    // add your code here
    wire current_op, irr;

    counter_6bit counter(clock, 1'b1, (ctrl_MULT | ctrl_DIV), count);

    dlatch op(ctrl_MULT, ctrl_DIV | ctrl_MULT, current_op, irr);

    booth product(clock, ctrl_MULT, data_operandA, data_operandB, final_product);
    div division(clock, ctrl_DIV, data_operandA, data_operandB, final_division);

    // wire first;
    // // and first_call(first, ~count[0], ~count[1], ~count[2], ~count[3], ~count[4]);
    
    // wire temp; 
    // assign temp = first ? 1'b1 : 1'b0;
    //assign temp = ctrl_MULT;

    wire multR, divR;
    and multReady(multR, count[0], count[1], count[2], count[3], ~count[4], ~count[5]);
    and divReady(divR, ~count[0], ~count[1], ~count[2], ~count[3], ~count[4], count[5]);
    assign data_resultRDY = current_op ? multR : divR;
    wire multOverflow, divOverflow;

    wire [31:0] negdiv, div, divint, divint2, ecdResult;
    wire sign, ecdCheck; 
    alu divnegative(32'b0, final_division[31:0], 5'b00001, 5'b0, negdiv, irr, irr, irr);

    ecd edge1(data_operandA, data_operandB, ecdResult, ecdCheck);
    assign sign = (data_operandA[31] ^ data_operandB[31]); 
    assign divint = sign ? negdiv : final_division[31:0];
    assign divint2 = ecdCheck ? ecdResult : divint;
    assign div = divOverflow ? 32'b0 : divint2;
    assign data_result = current_op ? final_product[31:0]: div;

    assign divOverflow = !(|data_operandB); 

    wire check1, check2; 

    assign check1 = final_product[31] ? !(&final_product[63:32]) :  (|final_product[63:32]);
    assign check2 = data_operandA[31]&!(|data_operandA[30:0]) & (|data_operandB);
    assign multOverflow = (check2)  ?  1'b1 : check1;
    
    assign data_exception = current_op ? multOverflow : divOverflow;

endmodule