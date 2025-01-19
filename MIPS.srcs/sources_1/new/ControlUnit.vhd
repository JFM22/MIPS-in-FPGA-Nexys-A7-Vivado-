----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2024 09:42:58
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
  Port ( 
    clk_i, en_i, rst_i : in STD_LOGIC;
    op_i : STD_LOGIC_VECTOR(5 downto 0);
    
    ir_en : out STD_LOGIC := '0';
    reg_file_write_data_ctrl : out STD_LOGIC := '0';
    mem_data_reg_en : out STD_LOGIC := '0';
    mem_write_en : out STD_LOGIC := '0';
    mem_addr_ctrl : out STD_LOGIC := '0';
    pc_write : out STD_LOGIC := '0';
    pc_write_cond : out STD_LOGIC := '0';
    reg_file_write_address_ctrl : out STD_LOGIC := '0';
    reg_file_write_en : out STD_LOGIC := '0';
    alu_op : out STD_LOGIC_VECTOR(1 downto 0) := "00";
    alu_src1_ctrl : out STD_LOGIC := '0';
    alu_src2_ctrl : out STD_LOGIC_VECTOR(1 downto 0) := "00";
    pc_data_ctrl : out STD_LOGIC_VECTOR(1 downto 0) := "00"
  );
end ControlUnit;
-- Se trata de una maquina de estados de Moore
architecture Behavioral of ControlUnit is
    type state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12);
    signal current_state, next_state : state := S0;
begin

    -- Implemetación de la memoria del estado
    memory_p : process(rst_i, clk_i)
    begin
        if rst_i = '1' then
            current_state <= S0;
        elsif rising_edge(clk_i) and en_i = '1' then
            current_state <= next_state;
        end if;
    end process;
    
    -- Implementación de las transiciones entre estados
    transition_p : process(current_state, op_i)
    begin
        --if rising_edge(clk_i) then
            case current_state is
                when S0 => next_state <= S1;
                when S1 => next_state <= S2;
                when S2 => 
                    if (op_i = "000000") then next_state <= S10; -- R
                    elsif(op_i = "000100") then next_state <= S9; -- BEQ
                    elsif(op_i = "000010") then next_state <= S12; -- J
                    else next_state <= S3; -- LW, SW, ADDI
                    end if;
                when S3 => 
                    if (op_i = "100011") then next_state <= S4; -- LW
                    elsif (op_i = "101011") then next_state <= S7; -- SW
                    else next_state <= S8; -- ADDI
                    end if;
                when S4 => next_state <= S5;
                when S5 => next_state <= S6;
                when S10 => next_state <= S11;
                when others => -- S12,S11,S9,S8,S7,S6
                    next_state <= S0;
            end case;
         --end if;
    end process;
    
    -- Implementación de los outputs asociados a los estados
    outputs_p : process(current_state)
    begin
        -- Inicialización de señales a cero
        ir_en <= '0';
        alu_src1_ctrl <= '0';
        reg_file_write_data_ctrl <= '0';
        mem_data_reg_en <= '0';
        mem_write_en <= '0';
        mem_addr_ctrl <= '0';
        pc_write <= '0';
        pc_write_cond <= '0';
        reg_file_write_address_ctrl <= '0';
        reg_file_write_en <= '0';
        
        alu_op <= "00";  
        alu_src2_ctrl <= "00"; 
        pc_data_ctrl <= "00";  
        
        case current_state is
            when S0 =>      
            when S1 => 
                alu_src2_ctrl <= "01";
                ir_en <= '1';
                pc_write <= '1';
            when S2 => 
                alu_src2_ctrl <= "11";
            when S3 => 
                alu_src1_ctrl <= '1';
                alu_src2_ctrl <= "10";
            when S4 => 
                mem_addr_ctrl <= '1';
            when S5 => 
                mem_data_reg_en <= '1';
            when S6 => 
                reg_file_write_en <= '1';
                reg_file_write_data_ctrl <= '1';
            when S7 => 
                mem_write_en <= '1';
                mem_addr_ctrl <= '1';
            when S8 => 
                reg_file_write_en <= '1';
            when S9 => 
                alu_src1_ctrl <= '1';
                alu_op <= "01";
                pc_write_cond <= '1';
                pc_data_ctrl <= "01";
            when S10 => 
                alu_src1_ctrl <= '1';
                alu_op <= "10";
            when S11 => 
                reg_file_write_address_ctrl <= '1';
                reg_file_write_en <= '1';
            when S12 => 
                pc_write <= '1';
                pc_data_ctrl <= "10";
            when others => NULL; -- caso imposible
        end case;
    end process;
    
end Behavioral;
