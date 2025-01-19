----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 21:35:49
-- Design Name: 
-- Module Name: MIPS_tb - Behavioral
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

entity MIPS_tb is
--  Port ( );
end MIPS_tb;

architecture Behavioral of MIPS_tb is
    component Impl_MIPS
      Port (
        clk_i : in  STD_LOGIC := '0';
        rst_i : in  std_logic := '0';
        en_i : in  STD_LOGIC := '0';
        val_display : out STD_LOGIC_VECTOR(7 downto 0);
        display   : out STD_LOGIC_VECTOR(7 downto 0)
       );
    end component;
    
    signal clk : STD_LOGIC := '0';
    signal disp_out : STD_LOGIC_VECTOR(7 downto 0);
    signal display   : STD_LOGIC_VECTOR(7 downto 0);
    constant CLK_PERIOD : time := 10 ns;
    signal en : STD_LOGIC;
    signal rst : STD_LOGIC;
    
begin
    MIPS : Impl_MIPS
    Port map (
        clk_i => clk, 
        rst_i => rst,
        en_i => en,
        val_display => disp_out,
        display   => display
    );
    clk <= not clk after CLK_PERIOD/2;
    process
    begin
        rst <= '1';
        en <= '0';
        wait for CLK_PERIOD;
        rst <= '1';
        en <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD*30;
        rst <= '0';
        --wait for CLK_PERIOD*10000000;
        wait;
    end process;
end Behavioral;
