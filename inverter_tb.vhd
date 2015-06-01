LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity inverter_tb is
end inverter_tb;

architecture testbench of inverter_tb is

component INVERTER_32 IS 
	PORT( a: IN  std_logic_vector(31 downto 0); 
				b: OUT std_logic_vector(31 downto 0)
		); 
END component;

  SIGNAL a : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
  SIGNAL b : STD_LOGIC_VECTOR(31 DOWNTO 0);

  BEGIN

  device:  INVERTER_32 port map(a, b);
  
a <= "00000000000000000000000000000111" after 40 ns;

PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;