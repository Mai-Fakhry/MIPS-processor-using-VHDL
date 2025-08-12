library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MIPS_package.all;

entity MIPS is
port(clk, reset: in STD_LOGIC;
pc: out STD_LOGIC_VECTOR(31 downto 0);
instr: in STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC;
aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
readdata: in STD_LOGIC_VECTOR(31 downto 0));
end MIPS;

architecture Behavioral of MIPS is

signal memtoreg, alusrc, regdst, regwrite, jump, pcsrc: STD_LOGIC;
signal zero: STD_LOGIC;
signal alucontrol: STD_LOGIC_VECTOR(3 downto 0);

-- Internal signals instead of using buffer
signal pc_internal: STD_LOGIC_VECTOR(31 downto 0);
signal aluout_internal: STD_LOGIC_VECTOR(31 downto 0);
signal writedata_internal: STD_LOGIC_VECTOR(31 downto 0);

begin

theCU: ControlUnit port map (instr(31 downto 26), instr(5 downto 0), zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
theDatapath: datapath port map (clk, reset, readdata, instr, memtoreg, pcsrc ,alusrc, regwrite, regdst, jump, alucontrol, zero, pc_internal, aluout_internal, writedata_internal);

pc <= pc_internal;
aluout <= aluout_internal;
writedata <= writedata_internal;

end Behavioral;

