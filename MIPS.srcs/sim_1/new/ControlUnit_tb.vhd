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

entity ControlUnit_tb is
--  Port ( );
end ControlUnit_tb;

architecture Behavioral of ControlUnit_tb is
    component ControlUnit
        Port (
            clk_i, en_i, rst_i : in STD_LOGIC;
            op_i : STD_LOGIC_VECTOR(5 downto 0);

            ir_en : out STD_LOGIC;
            reg_file_write_data_ctrl : out STD_LOGIC;
            mem_data_reg_en : out STD_LOGIC;
            mem_write_en : out STD_LOGIC;
            mem_addr_ctrl : out STD_LOGIC;
            pc_write : out STD_LOGIC;
            pc_write_cond : out STD_LOGIC;
            reg_file_write_address_ctrl : out STD_LOGIC;
            reg_file_write_en : out STD_LOGIC;
            alu_op : out STD_LOGIC_VECTOR(1 downto 0);
            alu_src1_ctrl : out STD_LOGIC;
            alu_src2_ctrl : out STD_LOGIC_VECTOR(1 downto 0);
            pc_data_ctrl : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal en : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal op : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');

    signal ir_en_tb : STD_LOGIC;
    signal reg_file_write_data_ctrl_tb : STD_LOGIC;
    signal mem_data_reg_en_tb : STD_LOGIC;
    signal mem_write_en_tb : STD_LOGIC;
    signal mem_addr_ctrl_tb : STD_LOGIC;
    signal pc_write_tb : STD_LOGIC;
    signal pc_write_cond_tb : STD_LOGIC;
    signal reg_file_write_address_ctrl_tb : STD_LOGIC;
    signal reg_file_write_en_tb : STD_LOGIC;
    signal alu_op_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_src1_ctrl_tb : STD_LOGIC;
    signal alu_src2_ctrl_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal pc_data_ctrl_tb : STD_LOGIC_VECTOR(1 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: ControlUnit
        Port map (
            clk_i => clk,
            en_i => en,
            rst_i => rst,
            op_i => op,

            ir_en => ir_en_tb,
            reg_file_write_data_ctrl => reg_file_write_data_ctrl_tb,
            mem_data_reg_en => mem_data_reg_en_tb,
            mem_write_en => mem_write_en_tb,
            mem_addr_ctrl => mem_addr_ctrl_tb,
            pc_write => pc_write_tb,
            pc_write_cond => pc_write_cond_tb,
            reg_file_write_address_ctrl => reg_file_write_address_ctrl_tb,
            reg_file_write_en => reg_file_write_en_tb,
            alu_op => alu_op_tb,
            alu_src1_ctrl => alu_src1_ctrl_tb,
            alu_src2_ctrl => alu_src2_ctrl_tb,
            pc_data_ctrl => pc_data_ctrl_tb
        );

    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    main : process
    begin
        -- Reset del sistema
        rst <= '1';
        wait for CLK_PERIOD;
        rst <= '0';
        report "---> INICIANDO PRUEBAS <---";
        -- Habilitar el sistema
        en <= '1';

        -- Prueba 1: Estado inicial S0
        op <= "000000";
        --wait for CLK_PERIOD;
        -- Prueba 2: Transición a S1
        wait for CLK_PERIOD;
        assert ir_en_tb = '1' report "Prueba 1 fallida: ir_en no es 1" severity error;
        assert alu_src2_ctrl_tb = "01" report "Prueba 1 fallida: alu_src2_ctrl" severity error;
        assert pc_write_tb = '1' report "Prueba 1 fallida: pc_write" severity error;

        -- Prueba 3: Transición a S2
        op <= "100011"; -- LW
        wait for CLK_PERIOD;
        assert alu_src2_ctrl_tb = "11" report "Prueba 3 fallida: alu_src2_ctrl no es 11" severity error;

        -- Prueba 4: Operación LW
        --op <= "100011";
        wait for CLK_PERIOD;
        assert alu_src1_ctrl_tb = '1' report "Prueba 4 fallida: alu_src1_ctrl no es 1" severity error;
        assert alu_src2_ctrl_tb = "10" report "Prueba 4 fallida: alu_src2_ctrl no es 10" severity error;

        -- Prueba 5: Transición a S4
        wait for CLK_PERIOD;
        assert mem_addr_ctrl_tb = '1' report "Prueba 5 fallida: mem_addr_ctrl no es 1" severity error;

        -- Prueba 6: Carga de memoria (S5 y S6)
        wait for CLK_PERIOD;
        assert mem_data_reg_en_tb = '1' report "Prueba 6 fallida: mem_data_reg_en no es 1" severity error;
        wait for CLK_PERIOD;
        assert reg_file_write_en_tb = '1' report "Prueba 6 fallida: reg_file_write_en no es 1" severity error;
        assert reg_file_write_data_ctrl_tb = '1' report "Prueba 6 fallida: reg_file_write_data_ctrl no es 1" severity error;

        -- Prueba 7: Escritura condicional en PC (branch en S9)
        op <= "000100"; -- Operación branch
        wait for 2 * CLK_PERIOD;
        assert ir_en_tb = '1' report "Prueba 1 fallida: ir_en no es 1" severity error;
        assert alu_src2_ctrl_tb = "01" report "Prueba 1 fallida: alu_src2_ctrl" severity error;
        assert pc_write_tb = '1' report "Prueba 1 fallida: pc_write" severity error;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        assert pc_write_cond_tb = '1' report "Prueba 7 fallida: pc_write_cond no es 1" severity error;
        assert alu_op_tb = "01" report "Prueba 7 fallida: alu_op no es 01" severity error;
        assert pc_data_ctrl_tb = "01" report "Prueba 7 fallida: pc_data_ctrl no es 01" severity error;
       
        op <= "000010"; --jump
        wait for 4*CLK_PERIOD;
        -- Prueba 8: Instrucción jump (S12)
        assert pc_write_tb = '1' report "Prueba 8 fallida: pc_write no es 1" severity error;
        assert pc_data_ctrl_tb = "10" report "Prueba 8 fallida: pc_data_ctrl no es 10" severity error;

        -- Prueba 9: Instrucción R-type (S10 y S11)
        op <= "000000"; -- Instrucción R-type
        wait for 4 * CLK_PERIOD;
        assert alu_op_tb = "10" report "Prueba 9 fallida: alu_op no es 10" severity error;
        wait for CLK_PERIOD;
        assert reg_file_write_address_ctrl_tb = '1' report "Prueba 9 fallida: reg_file_write_address_ctrl no es 1" severity error;
        assert reg_file_write_en_tb = '1' report "Prueba 9 fallida: reg_file_write_en no es 1" severity error;

        wait for CLK_PERIOD;
        report "---> FIN <---";
        wait;
    end process;

end Behavioral;