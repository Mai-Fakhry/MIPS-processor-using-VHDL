-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- 32-to-1 bit Multiplixer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32to1 is
    Port (
        data_in0  : in STD_LOGIC_VECTOR(31 downto 0); 
        data_in1  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in2  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in3  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in4  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in5  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in6  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in7  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in8  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in9  : in STD_LOGIC_VECTOR(31 downto 0);
        data_in10 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in11 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in12 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in13 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in14 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in15 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in16 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in17 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in18 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in19 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in20 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in21 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in22 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in23 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in24 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in25 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in26 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in27 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in28 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in29 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in30 : in STD_LOGIC_VECTOR(31 downto 0);
        data_in31 : in STD_LOGIC_VECTOR(31 downto 0);
        sel       : in STD_LOGIC_VECTOR(4 downto 0);  
        data_out  : out STD_LOGIC_VECTOR(31 downto 0)  
    );
end mux32to1;

architecture Behavioral of mux32to1 is
begin
    process(sel, data_in0, data_in1, data_in2, data_in3, data_in4, data_in5, data_in6, data_in7,
            data_in8, data_in9, data_in10, data_in11, data_in12, data_in13, data_in14, data_in15,
            data_in16, data_in17, data_in18, data_in19, data_in20, data_in21, data_in22, data_in23,
            data_in24, data_in25, data_in26, data_in27, data_in28, data_in29, data_in30, data_in31)
    begin
        case sel is
            when "00000" => data_out <= data_in0;
            when "00001" => data_out <= data_in1;
            when "00010" => data_out <= data_in2;
            when "00011" => data_out <= data_in3;
            when "00100" => data_out <= data_in4;
            when "00101" => data_out <= data_in5;
            when "00110" => data_out <= data_in6;
            when "00111" => data_out <= data_in7;
            when "01000" => data_out <= data_in8;
            when "01001" => data_out <= data_in9;
            when "01010" => data_out <= data_in10;
            when "01011" => data_out <= data_in11;
            when "01100" => data_out <= data_in12;
            when "01101" => data_out <= data_in13;
            when "01110" => data_out <= data_in14;
            when "01111" => data_out <= data_in15;
            when "10000" => data_out <= data_in16;
            when "10001" => data_out <= data_in17;
            when "10010" => data_out <= data_in18;
            when "10011" => data_out <= data_in19;
            when "10100" => data_out <= data_in20;
            when "10101" => data_out <= data_in21;
            when "10110" => data_out <= data_in22;
            when "10111" => data_out <= data_in23;
            when "11000" => data_out <= data_in24;
            when "11001" => data_out <= data_in25;
            when "11010" => data_out <= data_in26;
            when "11011" => data_out <= data_in27;
            when "11100" => data_out <= data_in28;
            when "11101" => data_out <= data_in29;
            when "11110" => data_out <= data_in30;
            when "11111" => data_out <= data_in31;
				when others  => data_out <= (others => '0');
            
        end case;
    end process;
end Behavioral;