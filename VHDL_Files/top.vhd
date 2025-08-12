library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MIPS_package.all;

entity top is
port(clk, reset: in STD_LOGIC;
writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC);
end top;

architecture Behavioral of top is

signal memwritet: STD_LOGIC;
signal pc, instr, readdata, dataadrt, writedatat: STD_LOGIC_VECTOR(31 downto 0);

begin

theIM: imem port map(pc(7 downto 2), instr);
theDM: dmem port map(clk, memwritet, dataadrt, writedatat, readdata);
theMIPS: MIPS port map(clk, reset, pc, instr, memwritet, dataadrt, writedatat, readdata);

memwrite <= memwritet;
dataadr <= dataadrt;
writedata <= writedatat;

end Behavioral;

