-- TestBench Template 
  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  
use IEEE.STD_LOGIC_ARITH.all;

  ENTITY testbench IS
  END testbench;

ARCHITECTURE behavior OF testbench IS 
 
component top
port(clk, reset: in STD_LOGIC;
writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC);
end component;

signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
signal memwrite: STD_LOGIC;
signal clk : std_logic := '0';
signal reset : std_logic := '1';

begin
-- instantiate device to be tested
dut: top port map(clk, reset, writedata, dataadr, memwrite);

-- Generate clock with 10 ns period
process begin
clk <= '1';
--reset <= '0';
wait for 1 ns;
clk <= '0';
wait for 1 ns;
end process;

-- Ensure that reset is active long enough
process begin
    -- Keep reset active for 2 ns
    reset <= '1';
    wait for 2 ns;  -- Wait for enough time for the reset to propagate
    reset <= '0';   -- De-assert reset after enough time
    wait;
end process;

process(clk) begin
if (clk'Event and clk ='0' and memwrite = '1') then 
if (dataadr=x"00000054" and writedata = x"00000007") then
report "Test Successful";
end if;
end if;
end process;


END;
