library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity se is
    Port ( 
        a : in  STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input
        b : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit output
    );
end se;

architecture Behavioral of se is
begin
    -- Sign extend the 16-bit input to a 32-bit output
    b <= X"FFFF" & a 
         when a(15) = '1' else 
         X"0000" & a;
end Behavioral;