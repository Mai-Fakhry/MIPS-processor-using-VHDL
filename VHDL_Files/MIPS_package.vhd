-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- MIPS CPU Package

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MIPS_package is

component dmem is -- data memory
port(clk, we: in STD_LOGIC;
a, wd: in STD_LOGIC_VECTOR (31 downto 0);
rd: out STD_LOGIC_VECTOR (31 downto 0));
end component;

component imem is -- instruction memory
port(a: in STD_LOGIC_VECTOR(5 downto 0);
rd: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component MIPS is
port(clk, reset: in STD_LOGIC;
pc: out STD_LOGIC_VECTOR(31 downto 0);
instr: in STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC;
aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
readdata: in STD_LOGIC_VECTOR(31 downto 0));
end component;

component datapath is
port(clk, reset: in STD_LOGIC;
	readdata: in STD_LOGIC_VECTOR(31 downto 0);
	instr: in STD_LOGIC_VECTOR(31 downto 0);
	memtoreg, pcsrc,alusrc,regwrite, regdst, jump: in STD_LOGIC;
	aluoperation: in STD_LOGIC_VECTOR(3 downto 0);
	zero: out STD_LOGIC;
	pc: out STD_LOGIC_VECTOR(31 downto 0);
	aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component ControlUnit is
port(op, funct: in STD_LOGIC_VECTOR(5 downto 0);
    zero: in STD_LOGIC;
    memtoreg, memwrite: out STD_LOGIC;
    pcsrc: out  STD_LOGIC;
    alusrc : out  STD_LOGIC;	 
    regdst, regwrite: out STD_LOGIC;
    jump: out STD_LOGIC;
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component adder is 
    Port ( a : in  STD_LOGIC_VECTOR( 31 downto 0);
           b : in  STD_LOGIC_VECTOR( 31 downto 0);
           s : out STD_LOGIC_VECTOR( 31 downto 0));
end component;

component sl2 is
    Port ( a : in   STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component se is
    Port ( 
        a : in  STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input
        b : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit output
    );
end component;

component mux2 is
Generic(n:natural:=32);
    Port (
        a0  : in  STD_LOGIC_VECTOR(n-1 downto 0); -- Input A0 (4 bits)
        a1  : in  STD_LOGIC_VECTOR(n-1 downto 0); -- Input A1 (4 bits)
        sel : in  STD_LOGIC;                    -- Selector (1 bit)
        y   : out STD_LOGIC_VECTOR(n-1 downto 0)  -- Output (4 bits)
    );
end component;

component MainControlDecoder is
Port ( op : in  STD_LOGIC_vector(5 downto 0);
           memtoreg, memwrite : out  STD_LOGIC;
           branch, alusrc : out  STD_LOGIC;
           regdst, regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           aluop : out  STD_LOGIC_vector(1 downto 0));
end component;

component aludec is
    Port ( funct : in  STD_LOGIC_vector(5 downto 0);
           aluop : in  STD_LOGIC_VECTOR(1 downto 0);
           alucontrol : out  STD_LOGIC_VECTOR(3 downto 0));
end component;


Component FlipR is 
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Load : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end component;

Component mux32to1 is
Port (
        data_in0  : in STD_LOGIC_VECTOR(31 downto 0); 
        data_in1  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in2  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in3  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in4  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in5  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in6  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in7  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in8  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in9  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in10 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in11 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in12 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in13 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in14 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in15 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in16 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in17 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in18 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in19 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in20 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in21 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in22 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in23 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in24 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in25 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in26 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in27 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in28 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in29 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in30 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in31 : in STD_LOGIC_VECTOR(31 downto 0);
        sel       : in STD_LOGIC_VECTOR(4 downto 0);  
        data_out  : out STD_LOGIC_VECTOR(31 downto 0)  
    );
end component;

component ALU is
 Port ( data1 : in  STD_LOGIC_VECTOR(31 downto 0);
           data2 : in  STD_LOGIC_VECTOR(31 downto 0);
           aluop : in  STD_LOGIC_VECTOR(3 downto 0);
           dataout : buffer  STD_LOGIC_VECTOR(31 downto 0);
           zflag : out  STD_LOGIC);
end component;

component Decoder_5to32 is
Port (
        input : in std_logic_vector(4 downto 0);
        output_0  : out std_logic;
        output_1  : out std_logic;
        output_2  : out std_logic;
        output_3  : out std_logic;
        output_4  : out std_logic;
        output_5  : out std_logic;
        output_6  : out std_logic;
        output_7  : out std_logic;
        output_8  : out std_logic;
        output_9  : out std_logic;
        output_10 : out std_logic;
        output_11 : out std_logic;
        output_12 : out std_logic;
        output_13 : out std_logic;
        output_14 : out std_logic;
        output_15 : out std_logic;
        output_16 : out std_logic;
        output_17 : out std_logic;
        output_18 : out std_logic;
        output_19 : out std_logic;
        output_20 : out std_logic;
        output_21 : out std_logic;
        output_22 : out std_logic;
        output_23 : out std_logic;
        output_24 : out std_logic;
        output_25 : out std_logic;
        output_26 : out std_logic;
        output_27 : out std_logic;
        output_28 : out std_logic;
        output_29 : out std_logic;
        output_30 : out std_logic;
        output_31 : out std_logic
    );
end component;

component RegisterFile is
 Port (
      read_sel1 : in std_logic_vector(4 downto 0);
      read_sel2 : in std_logic_vector(4 downto 0);
		write_sel : in std_logic_vector(4 downto 0);
      write_ena : in std_logic;
      clk: in std_logic;
      write_data: in std_logic_vector(31 downto 0);
      data1: out std_logic_vector(31 downto 0);
      data2: out std_logic_vector(31 downto 0);
		resetSignal: in std_logic
		); 
end component;

end MIPS_package;


