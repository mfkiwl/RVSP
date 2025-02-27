// Quartus Prime Verilog Template
// Single Port ROM
module memoria_de_instrucoes
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)
(
	input [(ADDR_WIDTH-1):0] ender, //endereço recebido do PC
	input clk, //clock
	output reg [(DATA_WIDTH-1):0] saida // instrução de 32 bits
);
	//Declara a ROM de instruções
	//A memória tem espaço para 2^6 = 64 instruções
	// representando 256 bytes de dados
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];
	
	initial
	begin
		// Recebe inicialização da Memória de instruções
		$readmemb("inicializa_mem_inst.txt", rom);
	end

	always @ (posedge clk)
	begin
		//envia instrução armazenada no endereço recebido
		saida <= rom[ender];
	end

endmodule

