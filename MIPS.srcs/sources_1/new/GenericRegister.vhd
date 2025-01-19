----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2024 19:14:58
-- Design Name: 
-- Module Name: GenericRegister - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entidad genérica para un registro paralelo-paralelo
entity GenericRegister is
    generic (
        N : POSITIVE := 32  -- Tamaño del registro (por defecto 32 bits)
    );
    port (
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC; 
        en_i : in STD_LOGIC;
        D_i : in STD_LOGIC_VECTOR(N-1 downto 0); -- Entrada de datos
        Q_o : out STD_LOGIC_VECTOR(N-1 downto 0)  -- Salida de datos
    );
end GenericRegister;

architecture Behavioral of GenericRegister is
    signal Q : STD_LOGIC_VECTOR(N-1 downto 0) := (others => '0');
begin
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            Q <= (others => '0');  -- Inicialización del registro
        elsif rising_edge(clk_i) then
            if en_i = '1' then
                Q <= D_i;  -- Carga el dato
            end if;
        end if;
    end process;

    Q_o <= Q;
end Behavioral;

