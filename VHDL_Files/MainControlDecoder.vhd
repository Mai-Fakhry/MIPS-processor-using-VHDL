library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainControlDecoder is
    Port ( op : in  STD_LOGIC_vector(5 downto 0);
           memtoreg, memwrite : out  STD_LOGIC;
           branch, alusrc : out  STD_LOGIC;
           regdst, regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           aluop : out  STD_LOGIC_vector(1 downto 0));
end MainControlDecoder;

architecture Behavioral of MainControlDecoder is
signal controls: std_logic_vector(8 downto 0);
begin

process(op)
begin
case op is 
when "000000"=> controls <="110000010";--Rtype
when "100011"=> controls <="101001000";--lw
when "101011"=> controls <="001010000";--sw 
when "000100"=> controls <="000100001";--beq
when "001000"=> controls <="101000000";--addi
when "000010"=> controls <="000000100";--j
when others => controls <="---------";--illegal op
end case; 
end process;

(regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, 
aluop(1), aluop(0)) <= controls;
end Behavioral;

