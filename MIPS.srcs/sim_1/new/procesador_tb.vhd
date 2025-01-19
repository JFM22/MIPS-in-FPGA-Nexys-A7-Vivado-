----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 10:49:47
-- Design Name: 
-- Module Name: procesador_tb - Behavioral
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

entity procesador_tb is
--  Port ( );
end procesador_tb;

architecture Behavioral of procesador_tb is
    component Procesador is
    Port (
        clk_i      : in  STD_LOGIC;
        rst_i      : in  STD_LOGIC;
        en_i       : in  STD_LOGIC;
        addr_i     : in  STD_LOGIC_VECTOR(9 downto 0); -- Dirección (10 bits)
        data_o     : out STD_LOGIC_VECTOR(31 downto 0); -- Datos del puerto B
        en_mem   : in STD_LOGIC -- Habilitación de memoria
    );
    end component;
    
    constant CLK_PERIOD : time := 1 ns;
    signal clk : STD_LOGIC := '0';
    signal en : STD_LOGIC := '1';
    signal rst : STD_LOGIC := '0';
    signal addr     : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal data     : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal en_mem : STD_LOGIC := '0';
    
begin
    
    cpu : Procesador
    Port map (
        clk_i => clk,
        rst_i => rst,
        en_i  => en,
        addr_i => addr,
        data_o => data,
        en_mem => en_mem
    );
    -- Generación del reloj
    clk_process : process
    begin
        clk <= not clk;
        wait for CLK_PERIOD / 2;
    end process;

    stim_proc : process
    begin
        -- Reseteo inicial
        rst <= '1';
        en  <= '0';
        wait for 2 * CLK_PERIOD;
        en  <= '1';
        en_mem <= '1';
        wait for 30 * CLK_PERIOD;
        rst <= '0';
        en  <= '1';  
        en_mem <= '1';
        addr <= "1111111100"; 
        wait for 1000 * CLK_PERIOD;
        addr <= "1111111111";
        wait for CLK_PERIOD;
        assert signed(data) = 0 report "Dir 1023 no es 0" severity error;
        addr <= "1111111110";
        wait for CLK_PERIOD;
        assert data = x"1" report "Dir 1022 no es 1" severity error;
        addr <= "1111111101";
        wait for CLK_PERIOD;
        assert data = x"2" report "Dir 1021 no es 2" severity error;
        addr <= "1111111100";
        wait for CLK_PERIOD;
        assert data = x"3" report "Dir 1020 no es 3" severity error;
        addr <= "1111111011";
        wait for CLK_PERIOD;
        assert data = x"4" report "Dir 1019 no es 4" severity error;
        addr <= "1111111010";
        wait for CLK_PERIOD;
        assert data = x"5" report "Dir 1018 no es 5" severity error;
        addr <= "1111111001";
        wait for CLK_PERIOD;
        assert data = x"6" report "Dir 1017 no es 6" severity error;
        addr <= "1111111000";
        wait for CLK_PERIOD;
        assert data = x"7" report "Dir 1016 no es 7" severity error;     
        report "Fin de la simulación" severity note;
        wait;
    end process;
end Behavioral;
