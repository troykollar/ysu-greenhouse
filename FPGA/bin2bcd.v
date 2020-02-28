 module bin2bcd(
    bin,
     bcd
    );
    input [11:0] bin;
    output [11:0] bcd;
    
    reg [11:0] bcd;
    reg [3:0] i;
     
     always @(bin)
        begin
            bcd = 0;
            for (i = 0; i < 12; i = i+1)
            begin
                bcd = {bcd[10:0],bin[11-i]};
                    
                if(i < 11 && bcd[3:0] > 4) 
                    bcd[3:0] = bcd[3:0] + 3;
                if(i < 11 && bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4] + 3;
                if(i < 11 && bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8] + 3;  
            end
        end     
                
endmodule