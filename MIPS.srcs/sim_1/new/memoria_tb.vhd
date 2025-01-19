----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2025 19:31:51
-- Design Name: 
-- Module Name: memoria_tb - Behavioral
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

entity memoria_tb is
--  Port ( );
end memoria_tb;

architecture Behavioral of memoria_tb is

    -- IP Core
    component blk_mem_gen_0 is
    Port (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        clkb : IN STD_LOGIC;
        enb : IN STD_LOGIC;
        web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        dinb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
    end component;
    
-- Señales
    signal clka : std_logic := '0';
    signal ena : std_logic := '0';
    signal wea : std_logic_vector(0 downto 0) := "0";
    signal addra : std_logic_vector(9 downto 0) := (others => '0');
    signal dina: std_logic_vector(31 downto 0) := (others => '0');
    signal douta : std_logic_vector(31 downto 0);

    signal clkb : std_logic := '0';
    signal enb: std_logic := '0';
    signal web : std_logic_vector(0 downto 0) := "0";
    signal addrb : std_logic_vector(9 downto 0) := (others => '0');
    signal dinb : std_logic_vector(31 downto 0) := (others => '0');
    signal doutb : std_logic_vector(31 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin
    uut : blk_mem_gen_0
        port map (
            clka => clka,
            ena => ena,
            wea => wea,
            addra => addra,
            dina => dina,
            douta => douta,
            clkb => clkb,
            enb => enb,
            web => web,
            addrb => addrb,
            dinb => dinb,
            doutb => doutb
        );

    clka <= not clka after CLK_PERIOD/2;
    clkb <= not clka after CLK_PERIOD/2;

    main : process
    begin
        -- Inicialización de señales
        ena <= '0';
        enb <= '0';
        wea <= "0";
        web <= "0";
        addra <= (others => '0');
        addrb <= (others => '0');
        dina <= (others => '0');
        dinb <= (others => '0');
        wait for CLK_PERIOD;

        -- Escribir en el puerto A
        ena <= '1';
        wea <= "1";
        addra <= "0000000001"; -- Dirección 1
        dina <= x"DEADBEEF";  -- Dato a escribir
        wait for CLK_PERIOD;

        -- Leer desde el puerto A
        wea <= "0"; -- Deshabilitar escritura primero!
        wait for CLK_PERIOD;
        assert douta = x"DEADBEEF"
        report "ERROR: Dato incorrecto en dirección 1 (Puerto A)" severity failure;

        -- Probar deshabilitar del enable en puerto A
        ena <= '0';
        dina <= x"12345678";
        wait for CLK_PERIOD;
        assert douta /= x"12345678"
        report "ERROR: Puerto A habilitado cuando no debería" severity failure;

        -- Escribir y leer en el puerto B
        enb <= '1';
        web <= "1";
        addrb <= "0000000010"; -- Dirección 2
        dinb <= x"CAFEBABE";  -- Dato a escribir
        wait for CLK_PERIOD;

        -- Leer desde el puerto B
        web <= "0";
        wait for CLK_PERIOD;
        assert doutb = x"CAFEBABE"
        report "ERROR: Dato incorrecto en dirección 2 (Puerto B)" severity failure;

        -- Probar deshabilitación del enable en puerto B
        enb <= '0';
        dinb <= x"87654321";
        wait for CLK_PERIOD;
        assert doutb /= x"87654321"
        report "ERROR: Puerto B debería estar deshabilitado" severity failure;
        
-------------------------------------
        report "Simulación completada" severity note;
        wait; -------------
    end process;

end Behavioral;
