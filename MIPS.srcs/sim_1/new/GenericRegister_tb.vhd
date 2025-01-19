----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2024 12:57:07
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity GenericRegister_tb is
--  Port ( );
end GenericRegister_tb;

architecture Behavioral of GenericRegister_tb is
    component GenericRegister
    generic (
        N : POSITIVE := 32  -- Tamaño del registro (por defecto 32 bits)
    );
    port (
        clk_i     : in  STD_LOGIC;         -- Señal de reloj
        rst_i   : in  STD_LOGIC;         -- Señal de inicialización
        en_i  : in  STD_LOGIC;         -- Señal de habilitación
        D_i       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Entrada de datos
        Q_o       : out STD_LOGIC_VECTOR(N-1 downto 0)  -- Salida de datos
    );
    end component;
    
    signal clk : STD_LOGIC := '0';
    signal CLK_PERIOD : Time := 10ns;
    signal D : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal D_unsigned : UNSIGNED(31 downto 0) := (others => '0'); 
    signal Q : STD_LOGIC_VECTOR(31 downto 0);
    signal en : STD_LOGIC;
    signal rst : STD_LOGIC;
    
begin
    gr : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk,
            rst_i => '0',
            en_i => '1',
            D_i => D,
            Q_o => Q
        );
    clk <= not clk after CLK_PERIOD/2;
    
    process
    begin
        rst <= '1';
        en <= '0';
        wait for CLK_PERIOD;
        rst<='0';
        wait for CLK_PERIOD;
        en <= '1';
        while true loop
            wait for CLK_PERIOD;
            assert Q = D report "La salida no es la esperada";
            D_unsigned <= UNSIGNED(D) + 1; -- Suma como UNSIGNED
            D <= STD_LOGIC_VECTOR(D_unsigned); -- Reconversión a STD_LOGIC_VECTOR
        end loop;
    end process;
    
end Behavioral;