-- Logic Design and Computer Organization - CSE221
-- Major Task - Phase 1
-- 32-register 32-bit Register File (RF)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MIPS_package.all;


entity RegisterFile is
 Port (
		-- 5 bits of first Read (used in first mux)
      read_sel1 : in std_logic_vector(4 downto 0);
		-- 5 bits of second Read (used in second mux)
      read_sel2 : in std_logic_vector(4 downto 0);
		-- 5 bits of Write (used in decoder)
		write_sel : in std_logic_vector(4 downto 0);
		-- Write enable signal
      write_ena : in std_logic;
		-- Clock
      clk: in std_logic;
		-- Write data which is written in the registers when their Load equals 1
      write_data: in std_logic_vector(31 downto 0);  
		-- Output of first read (first mux)
      data1: out std_logic_vector(31 downto 0);
		-- Output of second read (second mux)
      data2: out std_logic_vector(31 downto 0);
		-- Additional reset signal to control from outside the RF
		-- Resets all the registers except the first
		resetSignal: in std_logic
		); 
end RegisterFile;

architecture Behavioral of RegisterFile is

-- Connection signals between decoder and registers
signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : STD_LOGIC;
signal reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15 : STD_LOGIC;
signal reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23 : STD_LOGIC;
signal reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31 : STD_LOGIC;

-- Connection signals between registers and multiplixers 1 and 2
signal breg0, breg1, breg2, breg3, breg4, breg5, breg6, breg7 : STD_LOGIC_VECTOR (31 downto 0);
signal breg8, breg9, breg10, breg11, breg12, breg13, breg14, breg15 : STD_LOGIC_VECTOR (31 downto 0);
signal breg16, breg17, breg18, breg19, breg20, breg21, breg22, breg23 : STD_LOGIC_VECTOR (31 downto 0);
signal breg24, breg25, breg26, breg27, breg28, breg29, breg30, breg31 : STD_LOGIC_VECTOR (31 downto 0);

begin

-- write_sel is the 5-bit code of the register we're writing into
-- Outputs of decoder are the signals "reg" which go into the registers
theDecoder: Decoder_5to32 port map (
    input => write_sel,
    output_0 => reg0,
    output_1 => reg1,
    output_2 => reg2,
    output_3 => reg3,
    output_4 => reg4,
    output_5 => reg5,
    output_6 => reg6,
    output_7 => reg7,
    output_8 => reg8,
    output_9 => reg9,
    output_10 => reg10,
    output_11 => reg11,
    output_12 => reg12,
    output_13 => reg13,
    output_14 => reg14,
    output_15 => reg15,
    output_16 => reg16,
    output_17 => reg17,
    output_18 => reg18,
    output_19 => reg19,
    output_20 => reg20,
    output_21 => reg21,
    output_22 => reg22,
    output_23 => reg23,
    output_24 => reg24,
    output_25 => reg25,
    output_26 => reg26,
    output_27 => reg27,
    output_28 => reg28,
    output_29 => reg29,
    output_30 => reg30,
    output_31 => reg31
);


-- Mux1 and Mux2 inputs are the signals "breg" which come out from the registers
Mux1: mux32to1 PORT MAP (
    data_in0  => breg0,
    data_in1  => breg1,
    data_in2  => breg2,
    data_in3  => breg3,
    data_in4  => breg4,
    data_in5  => breg5,
    data_in6  => breg6,
    data_in7  => breg7,
    data_in8  => breg8,
    data_in9  => breg9,
    data_in10 => breg10,
    data_in11 => breg11,
    data_in12 => breg12,
    data_in13 => breg13,
    data_in14 => breg14,
    data_in15 => breg15,
    data_in16 => breg16,
    data_in17 => breg17,
    data_in18 => breg18,
    data_in19 => breg19,
    data_in20 => breg20,
    data_in21 => breg21,
    data_in22 => breg22,
    data_in23 => breg23,
    data_in24 => breg24,
    data_in25 => breg25,
    data_in26 => breg26,
    data_in27 => breg27,
    data_in28 => breg28,
    data_in29 => breg29,
    data_in30 => breg30,
    data_in31 => breg31,
    sel       => read_sel1,
    data_out      => data1
);

Mux2: mux32to1 PORT MAP (
    data_in0  => breg0,
    data_in1  => breg1,
    data_in2  => breg2,
    data_in3  => breg3,
    data_in4  => breg4,
    data_in5  => breg5,
    data_in6  => breg6,
    data_in7  => breg7,
    data_in8  => breg8,
    data_in9  => breg9,
    data_in10 => breg10,
    data_in11 => breg11,
    data_in12 => breg12,
    data_in13 => breg13,
    data_in14 => breg14,
    data_in15 => breg15,
    data_in16 => breg16,
    data_in17 => breg17,
    data_in18 => breg18,
    data_in19 => breg19,
    data_in20 => breg20,
    data_in21 => breg21,
    data_in22 => breg22,
    data_in23 => breg23,
    data_in24 => breg24,
    data_in25 => breg25,
    data_in26 => breg26,
    data_in27 => breg27,
    data_in28 => breg28,
    data_in29 => breg29,
    data_in30 => breg30,
    data_in31 => breg31,
    sel       => read_sel2,
    data_out      => data2
);

-- 32 Flip Registers
-- Parameters: clk, rst, Load, D, Q
-- Load is an AND gate between write_enable and the reg signals from the decoder
-- The write_data is inputted in all registers (but not loaded unless the Load is 1)
-- The outputs of all registers are the breg signals which connect to Mux1 and Mux2

-- First one has reset set to '1' except resetSignal which is set to '0' for all other registers
-- To make the first register always have the value zero no matter what happens
FlipRegister0: FlipR PORT MAP (clk, '1', write_ena AND reg0, write_data, breg0);
FlipRegister1: FlipR PORT MAP (clk, resetSignal, write_ena AND reg1, write_data, breg1);
FlipRegister2: FlipR PORT MAP (clk, resetSignal, write_ena AND reg2, write_data, breg2);
FlipRegister3: FlipR PORT MAP (clk, resetSignal, write_ena AND reg3, write_data, breg3);
FlipRegister4: FlipR PORT MAP (clk, resetSignal, write_ena AND reg4, write_data, breg4);
FlipRegister5: FlipR PORT MAP (clk, resetSignal, write_ena AND reg5, write_data, breg5);
FlipRegister6: FlipR PORT MAP (clk, resetSignal, write_ena AND reg6, write_data, breg6);
FlipRegister7: FlipR PORT MAP (clk, resetSignal, write_ena AND reg7, write_data, breg7);
FlipRegister8: FlipR PORT MAP (clk, resetSignal, write_ena AND reg8, write_data, breg8);
FlipRegister9: FlipR PORT MAP (clk, resetSignal, write_ena AND reg9, write_data, breg9);
FlipRegister10: FlipR PORT MAP (clk, resetSignal, write_ena AND reg10, write_data, breg10);
FlipRegister11: FlipR PORT MAP (clk, resetSignal, write_ena AND reg11, write_data, breg11);
FlipRegister12: FlipR PORT MAP (clk, resetSignal, write_ena AND reg12, write_data, breg12);
FlipRegister13: FlipR PORT MAP (clk, resetSignal, write_ena AND reg13, write_data, breg13);
FlipRegister14: FlipR PORT MAP (clk, resetSignal, write_ena AND reg14, write_data, breg14);
FlipRegister15: FlipR PORT MAP (clk, resetSignal, write_ena AND reg15, write_data, breg15);
FlipRegister16: FlipR PORT MAP (clk, resetSignal, write_ena AND reg16, write_data, breg16);
FlipRegister17: FlipR PORT MAP (clk, resetSignal, write_ena AND reg17, write_data, breg17);
FlipRegister18: FlipR PORT MAP (clk, resetSignal, write_ena AND reg18, write_data, breg18);
FlipRegister19: FlipR PORT MAP (clk, resetSignal, write_ena AND reg19, write_data, breg19);
FlipRegister20: FlipR PORT MAP (clk, resetSignal, write_ena AND reg20, write_data, breg20);
FlipRegister21: FlipR PORT MAP (clk, resetSignal, write_ena AND reg21, write_data, breg21);
FlipRegister22: FlipR PORT MAP (clk, resetSignal, write_ena AND reg22, write_data, breg22);
FlipRegister23: FlipR PORT MAP (clk, resetSignal, write_ena AND reg23, write_data, breg23);
FlipRegister24: FlipR PORT MAP (clk, resetSignal, write_ena AND reg24, write_data, breg24);
FlipRegister25: FlipR PORT MAP (clk, resetSignal, write_ena AND reg25, write_data, breg25);
FlipRegister26: FlipR PORT MAP (clk, resetSignal, write_ena AND reg26, write_data, breg26);
FlipRegister27: FlipR PORT MAP (clk, resetSignal, write_ena AND reg27, write_data, breg27);
FlipRegister28: FlipR PORT MAP (clk, resetSignal, write_ena AND reg28, write_data, breg28);
FlipRegister29: FlipR PORT MAP (clk, resetSignal, write_ena AND reg29, write_data, breg29);
FlipRegister30: FlipR PORT MAP (clk, resetSignal, write_ena AND reg30, write_data, breg30);
FlipRegister31: FlipR PORT MAP (clk, resetSignal, write_ena AND reg31, write_data, breg31);


end Behavioral;

