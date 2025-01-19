----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2024 19:20:05
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entidad genérica para el Register File
entity RegisterFile is
    generic (
        N : POSITIVE := 5;  --Tamaño del puerto de dirección (5 Bits para 32 registros)
        M : POSITIVE := 32  -- Tamaño del puerto de datos (32 bits)
    );
    port (
        clk_i : in  STD_LOGIC;
        reset_i : in  STD_LOGIC;
        en_i : in  STD_LOGIC;
        readReg1_i : in  STD_LOGIC_VECTOR(N-1 downto 0);-- Dir del primer registro a leer
        readReg2_i : in  STD_LOGIC_VECTOR(N-1 downto 0);-- Dir segundo registro a leer
        writeReg_i : in  STD_LOGIC_VECTOR(N-1 downto 0);-- Dir del registro a escribir
        writeData_i : in  STD_LOGIC_VECTOR(M-1 downto 0);-- Dato a escribir
        write_en_i : in  STD_LOGIC;-- Habilitación de escritura
        readData1_o: out STD_LOGIC_VECTOR(M-1 downto 0);-- Dato leído del primer registro
        readData2_o : out STD_LOGIC_VECTOR(M-1 downto 0)-- D. leido del segundo registro
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_array is array (2**N-1 downto 0) of STD_LOGIC_VECTOR(M-1 downto 0);
    signal registers : reg_array := (others => (others => '0'));

begin
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            registers <= (others => (others => '0'));  -- Inicializar todos los registros a 0
        elsif rising_edge(clk_i) then
            if en_i = '1' then
                if write_en_i = '1' and writeReg_i /= "00000" then
                    registers(to_integer(unsigned(writeReg_i))) <= writeData_i;  -- Escritura en el registro indicado
                end if;
                --readData1_o <= registers(to_integer(unsigned(readReg1_i)));
                --readData2_o <= registers(to_integer(unsigned(readReg2_i)));
            end if;
        end if;
    end process;
    -- Lectura de los registros
    readData1_o <= registers(to_integer(unsigned(readReg1_i)));
    readData2_o <= registers(to_integer(unsigned(readReg2_i)));
end Behavioral;
