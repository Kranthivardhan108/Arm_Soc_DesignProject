module AHBSINGLERAM(
 //AHB Signals
  input wire         CLK, //Clock Input
  input wire         HRESETn,
  input wire  [31:0] ADDRESS , // Address Input
  input wire  [1:0]  HTRANS,
  input wire  [31:0] DATA_IN,
  input wire         WE,  // Write Enable/Read Enable
  input wire         HREADY,
  input wire         HSIZE,
  
  output wire        HREADYOUT,
  output reg  [31:0] DATA_OUT,
  
  input wire         CS // Chip Select

//rd            // Output Enable
);

//parameter DATA_WIDTH = 8 ;
//parameter ADDR_WIDTH = 8 ;
//parameter RAM_DEPTH = 1 << ADDR_WIDTH;

wire [7:0] address = ADDRESS[9:2];
assign HREADYOUT = 1'b1; // Always ready

//--------------Internal variables---------------- 

reg [31:0] mem [0:255];
reg CS_Q,WE_Q;
reg [7:0] address_Q;
always @(posedge CLK)
begin
  CS_Q <= CS;
  WE_Q <= WE;
  address_Q <= address;
end

//--------------Code Starts Here------------------ 

// Tri-State Buffer control 
//assign data = (cs && rd) ? data_out : 8'bz; 

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge CLK)

   if ( CS_Q & WE_Q)
       mem[address_Q] = DATA_IN;

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @(posedge CLK)
  if (CS & !WE) 
    DATA_OUT = mem[address];
	//assign out=DATA_OUT;
endmodule //
