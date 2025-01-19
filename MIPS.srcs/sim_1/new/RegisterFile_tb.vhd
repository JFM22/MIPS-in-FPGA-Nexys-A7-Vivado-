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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile_tb is
--  Port ( );
end RegisterFile_tb;
architecture Behavioral of RegisterFile_tb is
    component RegisterFile
    generic (
        N : positive := 5;
        M : positive := 32
    );
    port (
        clk_i : in  STD_LOGIC;
        reset_i : in  STD_LOGIC; 
        en_i : in  STD_LOGIC;
        readReg1_i : in  STD_LOGIC_VECTOR(N-1 downto 0);
        readReg2_i : in  STD_LOGIC_VECTOR(N-1 downto 0);
        writeReg_i : in  STD_LOGIC_VECTOR(N-1 downto 0);
        writeData_i: in  STD_LOGIC_VECTOR(M-1 downto 0);
        write_en_i : in  STD_LOGIC;
        readData1_o: out STD_LOGIC_VECTOR(M-1 downto 0);
        readData2_o : out STD_LOGIC_VECTOR(M-1 downto 0)
    );
    end component;
    
    signal clk : STD_LOGIC := '0';
    constant CLK_PERIOD : Time := 10ns;
    
    signal readReg1 : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); 
    signal readReg2 : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal writeReg : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal writeData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal write_en : STD_LOGIC := '0';       
    signal readData1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 
    signal readData2 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal en : STD_LOGIC;
    signal rst : STD_LOGIC;
    
begin
    rf : RegisterFile
        generic map (
            N => 5,
            M => 32
        )
        port map(
            clk_i => clk,
            reset_i => rst,
            en_i => en,
            readReg1_i => readReg1,
            readReg2_i => readReg2,
            writeReg_i => writeReg,
            writeData_i => writeData,
            write_en_i => write_en,
            readData1_o => readData1,
            readData2_o => readData2
        );
    clk <= not clk after CLK_PERIOD/2;
    main : process
    begin
        rst <= '1';
        en <= '0';
        wait for clk_period;
        rst <= '0';
        en <= '1';
        wait for clk_period;
        --Escritura en el registro 1
        write_en <= '1';
        writeReg <= "00001"; 
        writeData <= x"DEADBEEF";
        wait for CLK_PERIOD;
        write_en <= '0';
        readReg1 <= "00001";
        wait for CLK_PERIOD;
        assert readData1 = x"DEADBEEF"
        report "ERROR: Registro 1 no contiene el valor esperado (DEADBEEF)" severity failure;
    
        --Escritura en el registro 2
        write_en <= '1';
        writeReg <= "00010";
        writeData <= x"CAFEBABE";
        wait for CLK_PERIOD;
    
        write_en <= '0';
        readReg2 <= "00010";
        wait for CLK_PERIOD;
        assert readData2 = x"CAFEBABE"
        report "ERROR: Registro 2 no contiene el valor esperado (CAFEBABE)" severity failure;
    
        --
        write_en <= '1';
        writeReg <= "00011";
        writeData <= x"12345678"; 
        readReg1 <= "00011";
        wait for CLK_PERIOD;
        assert readData1 = x"12345678"
        report "ERROR: Registro 3 no contiene el valor esperado (12345678)" severity failure;
        
        report "Todo fino 10/10" severity note;
        wait;
    end process;
end Behavioral;