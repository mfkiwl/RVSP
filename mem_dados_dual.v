// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module mem_dados_dual
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)
(
	//memoria com 64 slots de 32 bits
	input [(DATA_WIDTH-1):0] dado_entr,
	input [(ADDR_WIDTH-1):0] end_lei, end_esc,
	input hab_esc, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] saida,
	output reg [(DATA_WIDTH-1):0] stdout
);
	
	// Declara a RAM de dados
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always @ (posedge write_clock)
	begin
		// Escrita
		if (hab_esc)
			ram[end_esc] <= dado_entr;
	end
	
	always @ (posedge read_clock)
	begin
		// Leitura
		saida <= ram[end_lei];
		// tirar depois, quando for implementado o módulo de I/O
		stdout <= ram[63];
	end
	
endmodule
