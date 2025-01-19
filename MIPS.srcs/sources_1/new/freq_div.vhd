----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 19:55:35
-- Design Name: 
-- Module Name: freq_div - Behavioral
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

entity freq_div is
    generic (
        DIVISOR : positive 
    );
    Port ( rst_i : in STD_LOGIC;
           en_i : in STD_LOGIC;
           clk_i : in STD_LOGIC;
           freq_o : out STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
    signal counter : integer := 0; -- Contador interno.
begin
    process (clk_i, rst_i)
    begin
        if rst_i = '1' then
            counter <= 0;
            freq_o <= '0';
        elsif rising_edge(clk_i) then
            if en_i = '1' then
                if counter = DIVISOR-1 then
                    counter <= 0; -- Reinicia el contador.
                    freq_o <= '1'; -- Invierte la salida.
                else
                    freq_o <= '0';
                    counter <= counter + 1; -- Incrementa el contador.
                end if;
            end if;
        end if;
    end process;
end Behavioral;
