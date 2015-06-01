library IEEE;
use IEEE.std_logic_1164.all;

ENTITY INVERTER_32 IS 
	PORT( a: IN  std_logic_vector(31 downto 0); 
		b: OUT std_logic_vector(31 downto 0)
		); 
END INVERTER_32;

ARCHITECTURE dataflow OF INVERTER_32 IS 
BEGIN 
	b <= NOT a;
END dataflow;