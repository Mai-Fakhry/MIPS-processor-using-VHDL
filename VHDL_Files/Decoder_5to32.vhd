-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- 5-to-32 bit Decoder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_5to32 is
    Port (
        input : in std_logic_vector(4 downto 0);
        output_0  : out std_logic;
        output_1  : out std_logic;
        output_2  : out std_logic;
        output_3  : out std_logic;
        output_4  : out std_logic;
        output_5  : out std_logic;
        output_6  : out std_logic;
        output_7  : out std_logic;
        output_8  : out std_logic;
        output_9  : out std_logic;
        output_10 : out std_logic;
        output_11 : out std_logic;
        output_12 : out std_logic;
        output_13 : out std_logic;
        output_14 : out std_logic;
        output_15 : out std_logic;
        output_16 : out std_logic;
        output_17 : out std_logic;
        output_18 : out std_logic;
        output_19 : out std_logic;
        output_20 : out std_logic;
        output_21 : out std_logic;
        output_22 : out std_logic;
        output_23 : out std_logic;
        output_24 : out std_logic;
        output_25 : out std_logic;
        output_26 : out std_logic;
        output_27 : out std_logic;
        output_28 : out std_logic;
        output_29 : out std_logic;
        output_30 : out std_logic;
        output_31 : out std_logic
    );
end Decoder_5to32;

architecture Behavioral of Decoder_5to32 is
begin
    process(input)
    begin
        -- Default all outputs to '0'
        output_0  <= '0';
        output_1  <= '0';
        output_2  <= '0';
        output_3  <= '0';
        output_4  <= '0';
        output_5  <= '0';
        output_6  <= '0';
        output_7  <= '0';
        output_8  <= '0';
        output_9  <= '0';
        output_10 <= '0';
        output_11 <= '0';
        output_12 <= '0';
        output_13 <= '0';
        output_14 <= '0';
        output_15 <= '0';
        output_16 <= '0';
        output_17 <= '0';
        output_18 <= '0';
        output_19 <= '0';
        output_20 <= '0';
        output_21 <= '0';
        output_22 <= '0';
        output_23 <= '0';
        output_24 <= '0';
        output_25 <= '0';
        output_26 <= '0';
        output_27 <= '0';
        output_28 <= '0';
        output_29 <= '0';
        output_30 <= '0';
        output_31 <= '0';
		  
        case input is
            when "00000" => output_0  <= '1';
            when "00001" => output_1  <= '1';
            when "00010" => output_2  <= '1';
            when "00011" => output_3  <= '1';
            when "00100" => output_4  <= '1';
            when "00101" => output_5  <= '1';
            when "00110" => output_6  <= '1';
            when "00111" => output_7  <= '1';
            when "01000" => output_8  <= '1';
            when "01001" => output_9  <= '1';
            when "01010" => output_10 <= '1';
            when "01011" => output_11 <= '1';
            when "01100" => output_12 <= '1';
            when "01101" => output_13 <= '1';
            when "01110" => output_14 <= '1';
            when "01111" => output_15 <= '1';
            when "10000" => output_16 <= '1';
            when "10001" => output_17 <= '1';
            when "10010" => output_18 <= '1';
            when "10011" => output_19 <= '1';
            when "10100" => output_20 <= '1';
            when "10101" => output_21 <= '1';
            when "10110" => output_22 <= '1';
            when "10111" => output_23 <= '1';
            when "11000" => output_24 <= '1';
            when "11001" => output_25 <= '1';
            when "11010" => output_26 <= '1';
            when "11011" => output_27 <= '1';
            when "11100" => output_28 <= '1';
            when "11101" => output_29 <= '1';
            when "11110" => output_30 <= '1';
            when "11111" => output_31 <= '1';
            when others => null;
				
        end case;
    end process;
end Behavioral;


