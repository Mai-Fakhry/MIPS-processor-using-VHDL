-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- 32-bit D Flip-Flop Register

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipR is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Load : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end FlipR;

architecture Behavioral of FlipR is
begin
    process(clk, rst)
    begin
        if (rst='1') then
            Q <= (others=>'0'); -- Reset all outputs to 0
        elsif rising_edge(clk) then
            if (Load='1') then
                Q <= D; -- Load input into output
            end if;
        end if;
    end process;
end Behavioral;

