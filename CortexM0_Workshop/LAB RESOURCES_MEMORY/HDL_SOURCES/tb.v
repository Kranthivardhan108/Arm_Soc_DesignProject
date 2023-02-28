`timescale 1 ns / 1 ps
module tb();
reg clk,rst;



AHBLITE_SYS dut(.CLK(clk),
             .RESET(rst),
             .TCK_SWCLK(),
             .TDI_NC(),
             .TMS_SWDIO(),
             .TDO_SWO()
             );

initial
    begin
        rst=0;
        clk=0;
        #7;
        rst=1;
    end

always #5 clk=~clk;

initial 
    begin
        $dumpfile ("AHBLITE_SYS.vcd");
        $dumpvars (0, tb);
        #1;
    end

endmodule
