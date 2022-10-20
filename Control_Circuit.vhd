library ieee;
use ieee.std_logic_1164.all;

Entity Control_Circuit is
	PORT(opcode: in std_logic_vector(2 downto 0);
		  result: out std_logic_vector(4 downto 0));
End Control_Circuit;

Architecture Logic_func of Control_Circuit is
Begin
	with opcode select
			result <= "00000" when "000",
						 "01000" when "001",
						 "10000" when "010",
						 "10011" when "011",
						 "00110" when "100",
						 "01110" when "101",
						 "11000" when others;
End Logic_func;