--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2024 19:02:41
-- Design Name: 
-- Module Name: Procesador - Behavioral
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

entity Procesador is
    Port (
        clk_i : in  STD_LOGIC;
        rst_i : in  std_logic;
        en_i : in  STD_LOGIC; 
        addr_i : in  STD_LOGIC_VECTOR(9 downto 0); -- Dirección (10 bits)
        en_mem : in STD_LOGIC; -- Habilitación de memoria, aunque la dejo siempre activada
        data_o : out STD_LOGIC_VECTOR(31 downto 0) -- Datos del puerto B
    );
end Procesador;

architecture Behavioral of Procesador is
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
    
    component ALU
        generic (
            N : POSITIVE := 32 
        );
        port (
            A : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando A
            B : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Operando B
            alu_op : in  STD_LOGIC_VECTOR(1 downto 0); -- Código de operación (alu_op)
            funct : in  STD_LOGIC_VECTOR(5 downto 0); -- Código de función (funct)
            Result : out STD_LOGIC_VECTOR(N-1 downto 0); -- Resultado de la operación
            zero : out STD_LOGIC 
        );
    end component;
    
    component GenericRegister
    generic (
        N : POSITIVE := 32
    );
    port (
        clk_i     : in  STD_LOGIC;
        rst_i   : in  STD_LOGIC;
        en_i  : in  STD_LOGIC;
        D_i       : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Entrada de datos
        Q_o       : out STD_LOGIC_VECTOR(N-1 downto 0)  -- Salida de datos
    );
    end component;
    
    component RegisterFile
    generic (
        N : POSITIVE := 5;
        M : POSITIVE := 32
    );
    port (
        clk_i : in  STD_LOGIC;
        reset_i : in  STD_LOGIC;
        en_i  : in  STD_LOGIC; 
        readReg1_i : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Dirección del primer registro a leer
        readReg2_i : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Dirección del segundo registro a leer
        writeReg_i : in  STD_LOGIC_VECTOR(N-1 downto 0); -- Dirección del registro a escribir
        writeData_i : in  STD_LOGIC_VECTOR(M-1 downto 0); -- Dato a escribir
        write_en_i : in  STD_LOGIC; -- Habilitación de escritura
        readData1_o : out STD_LOGIC_VECTOR(M-1 downto 0); -- Dato leído del primer registro
        readData2_o : out STD_LOGIC_VECTOR(M-1 downto 0)  -- Dato leído del segundo registro
    );
    end component;
    
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
    
    signal op : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');

    signal ir_en : STD_LOGIC;
    signal reg_file_write_data_ctrl : STD_LOGIC;
    signal mem_data_reg_en : STD_LOGIC;
    signal mem_write_en : STD_LOGIC_VECTOR(0 downto 0);
    signal mem_addr_ctrl : STD_LOGIC;
    signal pc_write : STD_LOGIC;
    signal pc_write_cond : STD_LOGIC;
    signal reg_file_write_address_ctrl : STD_LOGIC;
    signal reg_file_write_en : STD_LOGIC;
    signal alu_op : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal alu_src1_ctrl : STD_LOGIC;
    signal alu_src2_ctrl : STD_LOGIC_VECTOR(1 downto 0);
    signal pc_data_ctrl : STD_LOGIC_VECTOR(1 downto 0);
    
    -- Señales para conectar con la ALU
    signal data1   : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal data2   : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal funct   : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    signal ALU_Result  : STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
    signal zero    : STD_LOGIC;
    -- Program Counter
    
    signal D : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal D_unsigned : UNSIGNED(31 downto 0) := (others => '0'); 
    signal Q : STD_LOGIC_VECTOR(31 downto 0);
    -- PC register
    signal PC_en : STD_LOGIC := '0'; --NO INICIALIZADO!
    signal PC : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal PC_o : STD_LOGIC_VECTOR(31 downto 0);
    -- ALU out
    signal ALU_out_en : STD_LOGIC; --NO INICIALIZADO!
    signal ALU_out_register : STD_LOGIC_VECTOR(31 downto 0);
    -- RF A, B, Instruction Register y Mem Data Reg
    signal gr_A_output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- Dato leído del primer registro
    signal gr_B_output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');  -- Dato leído del segundo registro
    signal instruction_output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal memory_data_register_output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    
    --Register File
    signal readReg1  : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Dirección del primer registro a leer
    signal readReg2  : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Dirección del segundo registro a leer
    signal writeReg  : STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- Dirección del registro a escribir
    signal writeData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- Dato a escribir
    signal write_en  : STD_LOGIC := '0'; -- Habilitación de escritura
    signal readData1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- Dato leído del primer registro
    signal readData2 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');  -- Dato leído del segundo registro
    
    -- Señales internas para el puerto A IP CORE
    signal addr_a_internal : STD_LOGIC_VECTOR(9 downto 0);
    signal data_in_a : STD_LOGIC_VECTOR(31 downto 0);
    signal data_out_a : STD_LOGIC_VECTOR(31 downto 0);
    signal we_a_internal : STD_LOGIC_VECTOR(0 downto 0);
    signal en_a_internal : STD_LOGIC;
    signal en_b_internal : STD_LOGIC;
    
    signal addr : STD_LOGIC_VECTOR(9 downto 0);
    signal ir_en_internal : STD_LOGIC;
    signal mem_data_reg_en_internal : STD_LOGIC;
    
    signal jump_address : STD_LOGIC_VECTOR(31 downto 0);
    signal shifted_instr : std_logic_vector(27 downto 0);
begin
    c_ControlUnit: ControlUnit
        Port map (
            clk_i => clk_i,
            en_i => en_i,
            rst_i => rst_i,
            op_i => instruction_output(31 downto 26),

            ir_en => ir_en,
            reg_file_write_data_ctrl => reg_file_write_data_ctrl,
            mem_data_reg_en => mem_data_reg_en,
            mem_write_en => mem_write_en(0),
            mem_addr_ctrl => mem_addr_ctrl,
            pc_write => pc_write,
            pc_write_cond => pc_write_cond,
            reg_file_write_address_ctrl => reg_file_write_address_ctrl,
            reg_file_write_en => reg_file_write_en,
            alu_op => alu_op,
            alu_src1_ctrl => alu_src1_ctrl,
            alu_src2_ctrl => alu_src2_ctrl,
            pc_data_ctrl => pc_data_ctrl
        );
        
    c_alu : ALU
        generic map (
            N => 32
        )
        port map (
            A => data1,
            B => data2,
            alu_op => alu_op,
            funct => instruction_output(5 downto 0),
            Result => ALU_Result,
            zero => zero
        );
    
    PC_c : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i, 
            en_i => pc_en,
            D_i => PC,
            Q_o => PC_o
        );
        
    ALU_out_c : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            en_i => en_i,
            D_i => ALU_Result,
            Q_o => ALU_out_register
        );
        
    rf_A : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            en_i => en_i,
            D_i => readData1,
            Q_o => gr_A_output
        );
    rf_B : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            en_i => en_i, 
            D_i => readData2,
            Q_o => gr_B_output
        );
        
    instruction_register : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            en_i => ir_en_internal, 
            D_i => data_out_a,
            Q_o => instruction_output
        );
        
    memory_data_register : GenericRegister
        generic map (
            N => 32
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            en_i => mem_data_reg_en_internal, 
            D_i => data_out_a,
            Q_o => memory_data_register_output
        );
        
    rf : RegisterFile
        generic map (
            N => 5,
            M => 32
        )
        port map(
            clk_i => clk_i,
            reset_i => rst_i,
            en_i => en_i,
            readReg1_i => instruction_output(25 downto 21),
            readReg2_i => instruction_output(20 downto 16),
            writeReg_i => writeReg,
            writeData_i => writeData,
            write_en_i => reg_file_write_en,
            readData1_o => readData1,
            readData2_o => readData2
        );
    
    mem_inst : blk_mem_gen_0
    port map (
        -- Puerto A 
        clka   => clk_i,
        --ena    => en_a_internal,
        ena    => en_i, 
        wea    => mem_write_en,
        addra  => addr,
        dina   => gr_B_output,
        douta  => data_out_a,

        -- Puerto B 
        clkb   => clk_i,
        --enb    => en_b_internal,
        enb    => en_mem,
        web    => "0",  -- Puerto B solo permite lectura
        addrb  => addr_i,
        dinb   => (others => '0'), -- Sin datos de entrada para lectura
        doutb  => data_o
    );
    
    -- SEÑALES
    addr <= PC_o(11 downto 2) when mem_addr_ctrl = '0' else ALU_out_register(11 downto 2);
    PC_en <= ((pc_write_cond and zero) or pc_write) and en_i;
    writeReg <= instruction_output(20 downto 16) when reg_file_write_address_ctrl = '0' else instruction_output(15 downto 11);
    writeData <= ALU_out_register when (reg_file_write_data_ctrl = '0') else memory_data_register_output;
    data1 <= PC_o when (alu_src1_ctrl = '0') else gr_a_output;
    data2 <= 
        gr_b_output when alu_src2_ctrl = "00" else
        x"00000004" when alu_src2_ctrl = "01" else
        std_logic_vector(resize(signed(instruction_output(15 downto 0)), 32)) when alu_src2_ctrl = "10" else
        std_logic_vector(resize(signed(instruction_output(15 downto 0)), 32) sll 2);
        
    
    shifted_instr <= instruction_output(25 downto 0) & "00";
    jump_address <= pc_o(31 downto 28) & shifted_instr; --<---------------------!
    
    PC <=
        ALU_result when pc_data_ctrl = "00" else
        ALU_out_register when pc_data_ctrl = "01" else
        jump_address when pc_data_ctrl = "10" else
        (others => '0'); --Para evitar el latch
        
    ir_en_internal <= ir_en and en_i;
    mem_data_reg_en_internal <=  mem_data_reg_en and en_i;
end Behavioral;
