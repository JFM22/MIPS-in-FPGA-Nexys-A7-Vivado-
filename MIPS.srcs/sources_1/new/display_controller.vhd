----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2024 19:56:50
-- Design Name: 
-- Module Name: display_controller - Behavioral
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

entity display_controller is
  Port (
    rst_i    : in  STD_LOGIC;
    en_i     : in  STD_LOGIC;
    clk_i    : in  STD_LOGIC;
    data_in  : in  STD_LOGIC_VECTOR(31 downto 0);-- Dato leído de memoria
    addr_out : out  STD_LOGIC_VECTOR(9 downto 0);
    val_display : out STD_LOGIC_VECTOR(7 downto 0); -- Patrones de segmentos (activos a nivel bajo)
    display   : out STD_LOGIC_VECTOR(7 downto 0) -- anodos de los displays (activos a nivel bajo)
  );
end display_controller;

architecture Behavioral of display_controller is
  signal counter : integer range 0 to 7 := 0; -- Contador para los 8 displays
  signal displayed : STD_LOGIC_VECTOR(7 downto 0) := "11111110"; -- todos desactivados
  signal hex_pattern : STD_LOGIC_VECTOR(7 downto 0); -- Patrón de segmentos
  signal current_addr : STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- Dirección actual
begin
  process(clk_i, rst_i)
  begin
    if rst_i = '1' then
      counter <= 0;
      displayed <= "11111110";-- Activa el primer display
      current_addr <= "1111111000"; --Dir. inicial
    elsif rising_edge(clk_i) then
      if en_i = '1' then
        if counter = 7 then
            counter <= 0;
            displayed <= "11111110";
            current_addr <= "1111111000";
        else
            counter <= (counter + 1) mod 8; --avanza al siguiente display
            --delayed_anode <= delayed_anode(6 downto 0) & delayed_anode(7); -- Rota el anodo 11111110 -> 11111101
            current_addr <= std_logic_vector(unsigned(current_addr(9 downto 0)) + 1); --Incrementa la dirección 
        end if;
        displayed <= displayed(6 downto 0) & displayed(7); -- Rota el anodo 11111110 -> 11111101

      end if;
    end if;
  end process;
  -- Conversor de hexadecimal a 7 segmentos
  process(data_in)
  begin
    case data_in(3 downto 0) is
      when "0000" => hex_pattern <= "11000000"; -- 0
      when "0001" => hex_pattern <= "11111001"; -- 1
      when "0010" => hex_pattern <= "10100100"; -- 2
      when "0011" => hex_pattern <= "10110000"; -- 3
      when "0100" => hex_pattern <= "10011001"; -- 4
      when "0101" => hex_pattern <= "10010010"; -- 5
      when "0110" => hex_pattern <= "10000010"; -- 6
      when "0111" => hex_pattern <= "11111000"; -- 7
      when "1000" => hex_pattern <= "10000000"; -- 8
      when "1001" => hex_pattern <= "10011000"; -- 9
      when others => hex_pattern <= "11111111";
    end case;
  end process;

  val_display <= hex_pattern;
  display <= displayed;
  addr_out <= current_addr;

end Behavioral;

