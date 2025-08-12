library IEEE;
----------------------ALUDEC--------------------------------------
use IEEE.STD_LOGIC_1164.ALL;
entity aludec is
    Port ( funct : in  STD_LOGIC_vector(5 downto 0);
           aluop : in  STD_LOGIC_VECTOR(1 downto 0);
           alucontrol : out  STD_LOGIC_VECTOR(3 downto 0));
end aludec;

architecture Behavioral of aludec is

begin
process(aluop,funct)
begin
	case aluop is
		when "00" => alucontrol <= "0010"; --add
		when "01" => alucontrol <= "0110"; --sub
		when others=>
		case funct is 
			when "100100" => alucontrol <= "0000"; --and------------------------------------------36
			when "100101" => alucontrol <= "0001"; --or-------------------------------------------37
			when "100000" => alucontrol <= "0010"; --add------------------------------------------32
			when "100010" => alucontrol <= "0110"; --sub------------------------------------------34
			when "100111" => alucontrol <= "1100"; --nor------------------------------------------39
			when "101010" => alucontrol <= "0111"; --slt------------------------------------------42
			
			when others => alucontrol <="----";
		end case;
	end case;
end process;
end Behavioral;