-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- 32-bit Arithmetic Logic Unit (ALU)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR(31 downto 0);
           data2 : in  STD_LOGIC_VECTOR(31 downto 0);
           aluop : in  STD_LOGIC_VECTOR(3 downto 0);
           dataout : buffer  STD_LOGIC_VECTOR(31 downto 0);
           zflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

SIGNAL data1_current: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL data2_current: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL add_sub: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL and_nor: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL or_only: STD_LOGIC_VECTOR(31 downto 0);

begin
-- Complement data1 depending on bit 3 of aluop
data1_current <= data1 when aluop(3) = '0' else NOT data1;
-- Complement data2 depending on bit 2 of aluop
data2_current <= data2 when aluop(2) = '0' else NOT data2;
-- Result of addition or subtraction depending on aluop
add_sub <= data1_current + data2_current + aluop(2);
-- Result of AND or NOR depending on aluop
and_nor <= data1_current AND data2_current;
-- Result of OR depending on aluop
or_only <= data1_current OR data2_current;

dataout <= and_nor when aluop(1 downto 0) = "00"
else or_only when aluop(1 downto 0) = "01" 
else add_sub when aluop(1 downto 0) = "10"
else (X"0000000" & "000" & add_sub(31)) when aluop(1 DOWNTO 0)="11" -- SLT
-- else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; -- In case of unexpected output, output Z's
else X"00000000"; -- In case of unexpected output, output zeroes

zflag <= '1' when (aluop(1 downto 0) = "00" and and_nor = X"00000000")
or (aluop(1 downto 0) = "01" and or_only = X"00000000")
or (aluop(1 downto 0) = "10" and add_sub = X"00000000")
else '0'; -- Zero flag is 0 when the output isn't equal to 32 zeroes

end Behavioral;

