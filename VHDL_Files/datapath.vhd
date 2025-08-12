library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MIPS_package.all;

entity datapath is

port(clk, reset: in STD_LOGIC;
	readdata: in STD_LOGIC_VECTOR(31 downto 0);
	instr: in STD_LOGIC_VECTOR(31 downto 0);
	memtoreg, pcsrc, alusrc, regwrite, regdst, jump: in STD_LOGIC;
	aluoperation: in STD_LOGIC_VECTOR(3 downto 0);
	zero: out STD_LOGIC;
	pc: out STD_LOGIC_VECTOR(31 downto 0);
	aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0));

end datapath;

architecture Behavioral of datapath is

signal writereg: STD_LOGIC_VECTOR(4 downto 0);
signal pcjump, pcnext, pcnextbr, pcplus4, pcbranch: STD_LOGIC_VECTOR(31 downto 0);
signal signimm, signimmsh: STD_LOGIC_VECTOR(31 downto 0);
signal srca, srcb, result: STD_LOGIC_VECTOR(31 downto 0);

-- Internal Signals
signal pc_internal: STD_LOGIC_VECTOR(31 downto 0);
signal aluout_internal: STD_LOGIC_VECTOR(31 downto 0);
signal writedata_internal: STD_LOGIC_VECTOR(31 downto 0);

begin

-- Connect internal signals to their output instead of using buffer
pc <= pc_internal;
aluout <= aluout_internal;
--writedata <= writedata_internal;
writedata <= srcb;

pcreg: FlipR port map(clk, reset, '1', pcnext, pc_internal); -- Program Counter
pcadd1: adder port map(pc_internal, X"00000004", pcplus4); -- First adder
pcjump <= pcplus4(31 downto 28) & instr(25 downto 0) & "00"; -- Jump operations
theSE: se port map(instr(15 downto 0), signimm); -- Sign Extension
immsh: sl2 port map(signimm, signimmsh); -- Shift left by 2
pcadd2: adder port map(pcplus4, signimmsh, pcbranch);  -- Second adder
pcbrmux: mux2 generic map(32) port map(pcplus4, pcbranch,  pcsrc, pcnextbr); -- First mux
pcmux: mux2 generic map(32) port map(pcnextbr, pcjump, jump,  pcnext); -- Second mux
rfmux: mux2 generic map(5) port map(instr(20 downto 16), instr(15 downto 11), regdst, writereg); -- Third mux at RF
alumux: mux2 generic map(32) port map(srcb, signimm, alusrc, result); -- Fourth mux at ALU
dmmux: mux2 generic map(32) port map(aluout_internal, readdata, memtoreg, writedata_internal); -- Fifth mux at DM
theRF: RegisterFile port map(instr(25 downto 21), instr(20 downto 16), writereg, regwrite, clk, writedata_internal, srca, srcb, reset); -- Register File
theALU: ALU port map(srca, result, aluoperation, aluout_internal, zero); -- ALU

end Behavioral;

