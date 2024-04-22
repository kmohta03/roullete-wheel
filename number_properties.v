module number_properties(input [31:0] led_number, output [31:0] properties);

    wire [5:0] numb; 
    wire redBlack; // RED = 1 , BLACK = 0
    wire evenOdd; 
    wire highLow; 
    wire [1:0] trips; 
    wire [1:0] columns; 
    wire zeros; 

    assign numb = led_number[5:0]; 

    assign zeros = (numb == 6'd0 | numb == 6'd37); 
    assign redBlack = (numb == 6'd1 | numb == 6'd3 | numb == 6'd5 | numb == 6'd7 | numb == 6'd9 | 
                       numb == 6'd12 | numb == 6'd14 | numb == 6'd16 | numb == 6'd18 | numb == 6'd19 | 
                       numb == 6'd21 | numb == 6'd23 | numb == 6'd25 | numb == 6'd27 | numb == 6'd30 | 
                       numb == 6'd32 | numb == 6'd34 | numb == 6'd36) ? 1'b1 : 1'b0;
    
    assign evenOdd = (numb[0] == 1'b0 & ~(numb == 6'd0 | numb == 6'd37)) ? 1'b1 : 1'b0; // Even numbers have LSB = 0

    assign highLow = ((numb > 6'd18) & ~(numb == 6'd37)) ? 1'b1 : 1'b0;

    assign trips = (numb >= 6'd1 & numb <= 6'd12) ? 2'b01 :
                   (numb >= 6'd13 & numb <= 6'd24) ? 2'b10 :
                   (numb >= 6'd25 & numb <= 6'd36) ? 2'b11 : 2'b00;
    
    assign columns = (numb >= 6'd1 & numb <= 6'd36) ? ((numb - 6'd1) % 3'd3 == 0) ? 2'b01 : // Top column
                      ((numb - 6'd2) % 3'd3 == 0) ? 2'b10 : // Middle column
                      2'b11 // Bottom column
                      : 2'b00; 
    
    assign properties = {18'b0, zeros, columns, trips, highLow, evenOdd, redBlack, numb};

endmodule