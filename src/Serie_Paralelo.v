module SerieAParalelo (
    input clk,     // Reloj de entrada
    input reset,   // Señal de reinicio
    input serial_in, // Entrada de datos en serie
    output reg [3:0] parallel_out // Salida de datos en paralelo
);

reg [3:0] shift_reg; // Registro de desplazamiento de 4 bits

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 4'b0000; // Reinicia el registro de desplazamiento
    end else begin
        shift_reg <= {shift_reg[2:0], serial_in}; // Desplaza y carga el nuevo bit serial
    end
end

assign parallel_out = shift_reg; // La salida en paralelo es igual al contenido del registro de desplazamiento

endmodule