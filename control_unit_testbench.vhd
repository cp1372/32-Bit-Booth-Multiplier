
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity control_unit_testbench is
end control_unit_testbench;


architecture testbench of control_unit_testbench is

      
component control_unit IS

  PORT (start, clk, reset: in std_logic; 
				cnt : in std_logic_vector(6 downto 0);
				done, shift, clear, load_p, load_a, load_b, enable_cnt: out std_logic);
END component control_unit;

	signal clock : std_logic  := '0';
	signal start : std_logic  := '0';
	signal reset :  std_logic := '0';

	signal cnt : std_logic_vector(6 downto 0);
	signal done, shift, clear, load_p, load_a, load_b, enable_cnt: std_logic;
	

  BEGIN

  device:  control_unit port map(start, clock, reset, cnt, done, shift, clear, load_p, load_a, load_b, enable_cnt);
	
	clock  <= not clock after 5 ns;

	start <= '1' after 30 ns, '0' after 500 ns;

	reset <= '1' after 1000 ns;

	
	cnt <= "1000000" after 250 ns;


PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench ;
  
