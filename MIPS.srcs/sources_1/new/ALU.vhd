----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2024 19:27:42
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    generic (
        N : POSITIVE := 32 --tamaño de los puertos de datos (por defecto 32 bits)
    );
    port (
        A       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando A
        B       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando B
        alu_op  : in  STD_LOGIC_VECTOR(1 downto 0); -- Código de operación
        funct   : in  STD_LOGIC_VECTOR(5 downto 0);-- Código de función
        Result  : out STD_LOGIC_VECTOR(N-1 downto 0); -- Resultado de la operación
        zero    : out STD_LOGIC -- zero
    );
end ALU;

architecture Behavioral of ALU is
    type alu_operations is (ADD, SUB, AND_OP, OR_OP, SLT, UNDEFINED);
    signal operation : alu_operations;
    signal result_internal : STD_LOGIC_VECTOR(N-1 downto 0);

begin
    process(alu_op, funct)
    begin
        case alu_op is
            when "00" =>
                operation <= ADD;
            when "01" =>
                operation <= SUB;
            when "10" =>
                case funct is
                    when "100000" => operation <= ADD;
                    when "100010" => operation <= SUB;
                    when "100100" => operation <= AND_OP;
                    when "100101" => operation <= OR_OP;
                    when "101010" => operation <= SLT;
                    when others => operation <= UNDEFINED;
                end case;
            when others =>
                operation <= UNDEFINED;
        end case;
    end process;

    -- Ejecución de la operación
    process(A, B, operation)
    begin
        case operation is
            when ADD =>
                result_internal <= STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B));
            when SUB =>
                result_internal <= STD_LOGIC_VECTOR(SIGNED(A) - SIGNED(B));
            when AND_OP =>
                result_internal <= A and B;
            when OR_OP =>
                result_internal <= A or B;
            when SLT =>
                if SIGNED(A) < SIGNED(B) then
                    result_internal <= (others => '0');
                    --result_internal(N-1) <= '1';
                    result_internal(0) <= '1';
                    --result_internal <= "1" & (others => '0');

                else
                    result_internal <= (others => '0');
                end if;
            when others =>
                result_internal <= (others => 'X');
        end case;
    end process;

    -- Asignación de salidas
    Result <= result_internal;
    zero <= '0' when result_internal(0) = 'X' else
            '1' when signed(result_internal) = 0 else
            '0';

end Behavioral;
