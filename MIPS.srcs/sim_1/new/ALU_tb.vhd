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

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
    component ALU
        generic (
            N : positive := 32  -- Tamaño de los puertos de datos (por defecto 32 bits)
        );
        port (
            A       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando A
            B       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando B
            alu_op  : in  STD_LOGIC_VECTOR(1 downto 0);   -- Código de operación (alu_op)
            funct   : in  STD_LOGIC_VECTOR(5 downto 0);   -- Código de función (funct)
            Result  : out STD_LOGIC_VECTOR(N-1 downto 0); -- Resultado de la operación
            zero    : out STD_LOGIC                      -- Flag zero
        );
    end component;

    -- Señales para conectar con la ALU
    signal A       : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal B       : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal alu_op  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal funct   : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    signal Result  : STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
    signal zero    : STD_LOGIC;

begin
    -- Instanciación de la ALU
    uut : ALU
        generic map (
            N => 32
        )
        port map (
            A => A,
            B => B,
            alu_op => alu_op,
            funct => funct,
            Result => Result,
            zero => zero
        );

    -- Proceso para generar estímulos
    stimulus : process
    begin
    
        -- **Caso 1: ADD**
        A <= x"00000005"; -- A = 5
        B <= x"00000003"; -- B = 3
        alu_op <= "00";   -- Operación ADD
        funct <= "000000"; -- Sin uso para alu_op = "00"
        wait for 10 ns;
        assert Result = x"00000008" and zero = '0'
        report "ERROR: ADD incorrecto (A + B)" severity failure;

        -- **Caso 2: SUB**
        alu_op <= "01";   -- Operación SUB
        wait for 10 ns;
        assert Result = x"00000002" and zero = '0'
        report "ERROR: SUB incorrecto (A - B)" severity failure;

        -- **Caso 3: AND**
        alu_op <= "10";   -- ALU Control activado
        funct <= "100100"; -- Operación AND
        wait for 10 ns;
        assert Result = x"00000001" and zero = '0'
        report "ERROR: AND incorrecto (A AND B)" severity failure;

        -- **Caso 4: OR**
        funct <= "100101"; -- Operación OR
        wait for 10 ns;
        assert Result = x"00000007" and zero = '0'
        report "ERROR: OR incorrecto (A OR B)" severity failure;

        -- **Caso 5: SLT (A < B)**
        funct <= "101010"; -- Operación SLT
        A <= x"00000003"; -- A = 3
        B <= x"00000005"; -- B = 5
        wait for 10 ns;
        assert Result = x"00000001" and zero = '0'
        report "ERROR: SLT incorrecto (A < B)" severity failure;

        -- **Caso 6: SLT (A >= B)**
        A <= x"00000005"; -- A = 5
        B <= x"00000003"; -- B = 3
        wait for 10 ns;
        assert Result = x"00000000" and zero = '1'
        report "ERROR: SLT incorrecto (A >= B)" severity failure;

        -- **Caso 7: Operación indefinida**
        funct <= "111111"; -- Código de función no definido
        wait for 10 ns;
        -- Verificar que el resultado no cambia
        assert Result(0) = 'X'
        report "ERROR: En la op indef." severity failure;

        -- Finalizar simulación
        report "Simulación completada exitosamente" severity note;
        wait;
    end process;

end Behavioral;
