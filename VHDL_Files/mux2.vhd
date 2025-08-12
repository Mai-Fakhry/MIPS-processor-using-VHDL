library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
Generic(n:natural:=32);
    Port (
        a0  : in  STD_LOGIC_VECTOR(n-1 downto 0); -- Input A0 (4 bits)
        a1  : in  STD_LOGIC_VECTOR(n-1 downto 0); -- Input A1 (4 bits)
        sel : in  STD_LOGIC;                    -- Selector (1 bit)
        y   : out STD_LOGIC_VECTOR(n-1 downto 0)  -- Output (4 bits)
    );
end mux2;

architecture Behavioral of mux2 is
begin
    -- Multiplexer logic
    y <= a0 when sel = '0' else
         a1;
end Behavioral;