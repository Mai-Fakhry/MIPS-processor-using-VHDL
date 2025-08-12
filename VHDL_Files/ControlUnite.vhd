
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MIPS_package.all;

entity ControlUnit is
port(op, funct: in STD_LOGIC_VECTOR(5 downto 0);
    zero: in STD_LOGIC;
    memtoreg, memwrite: out STD_LOGIC;
    pcsrc: out  STD_LOGIC;
    alusrc : out  STD_LOGIC;	 
    regdst, regwrite: out STD_LOGIC;
    jump: out STD_LOGIC;
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
signal aluop: STD_LOGIC_VECTOR(1 downto 0);
signal branch: STD_LOGIC;

begin
maindecentity: MainControlDecoder PORT MAP (op, memtoreg, memwrite,branch, alusrc,regdst, regwrite,jump, aluop);
aludecentity: aludec PORT MAP (funct,aluop,alucontrol);
pcsrc <= branch and zero;
end Behavioral;

