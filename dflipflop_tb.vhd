LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity dflipflop_tb is
end dflipflop_tb;

architecture testbench of dflipflop_tb is

component dflipflop IS
  PORT (d, clk, reset: in std_logic; 
				q: out std_logic);
END component;

  SIGNAL d : std_logic := '1';
  SIGNAL clock   : std_logic := '0';
  SIGNAL reset : std_logic:= '0';
  SIGNAL output_data : STD_LOGIC;
  
  BEGIN
  device:  dflipflop port map(d, clock, reset, output_data);
	clock  <= not clock after 5 ns;
	reset  <= '1' after 60 ns, '0' after 100 ns;
	d <= '0' after 20 ns, '1' after 80 ns;

PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  
