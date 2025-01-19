----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 21:14:00
-- Design Name: 
-- Module Name: Impl_MIPS - Behavioral
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

entity Impl_MIPS is
  Port (
    clk_i : in  STD_LOGIC := '0';
    rst_i : in  std_logic := '0';
    en_i : in  STD_LOGIC := '0';
    val_display : out STD_LOGIC_VECTOR(7 downto 0);
    display : out STD_LOGIC_VECTOR(7 downto 0)
   );
end Impl_MIPS;

architecture Behavioral of Impl_MIPS is
    component Procesador
    Port (
        clk_i : in  STD_LOGIC;              
        rst_i : in  std_logic; 
        en_i : in  STD_LOGIC;
        addr_i : in  STD_LOGIC_VECTOR(9 downto 0); -- Dirección (10 bits)
        en_mem : in STD_LOGIC;  -- Habilitación de memoria
        data_o : out STD_LOGIC_VECTOR(31 downto 0) -- Datos del puerto B
    );
    end component;
    
    component display_controller
      Port (
        rst_i : in  STD_LOGIC;
        en_i : in  STD_LOGIC;
        clk_i : in  STD_LOGIC;
        data_in : in  STD_LOGIC_VECTOR(31 downto 0);-- Dato leído de memoria
        addr_out : out  STD_LOGIC_VECTOR(9 downto 0);
        val_display : out STD_LOGIC_VECTOR(7 downto 0); -- Patrones de segmentos (activos a nivel bajo)
        display : out STD_LOGIC_VECTOR(7 downto 0) -- anodos de los displays (activos a nivel bajo)
      );
    end component;
    
    component freq_div
        generic (
            DIVISOR : positive 
        );
        Port ( rst_i : in STD_LOGIC;
               en_i : in STD_LOGIC;
               clk_i : in STD_LOGIC;
               freq_o : out STD_LOGIC);
    end component;
    signal data_in_display  : STD_LOGIC_VECTOR(31 downto 0);-- Dato leído de memoria
    signal addr_out_display : STD_LOGIC_VECTOR(9 downto 0);
    signal freq1 : STD_LOGIC := '0';
    signal freq2 : STD_LOGIC := '0';
    --signal disp_out : STD_LOGIC_VECTOR(7 downto 0); -- Patrones de segmentos (activos a nivel bajo)
    --signal anodes   : STD_LOGIC_VECTOR(7 downto 0) -- anodos de los displays (activos a nivel bajo)
begin
    cpu : Procesador
    Port map (
        clk_i => clk_i,
        rst_i => rst_i,
        en_i  => freq1,
        addr_i => addr_out_display,
        data_o => data_in_display,
        en_mem => freq2
    );
    displ_contr : display_controller
    Port map (
        clk_i => clk_i,
        rst_i => rst_i,
        en_i  => freq2,
        data_in => data_in_display,
        addr_out => addr_out_display,
        val_display => val_display,
        display => display
    );
    freq_div_inst1: freq_div
        generic map (
            DIVISOR => 500000
        )
        port map (
            rst_i  => rst_i,
            en_i   => en_i,
            clk_i  => clk_i,
            freq_o => freq1
        );
    freq_div_inst2: freq_div
        generic map (
            DIVISOR => 12500
        )
        port map (
            rst_i  => rst_i,
            en_i   => en_i,
            clk_i  => clk_i,
            freq_o => freq2
        );
end Behavioral;
