LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity reg_32_tb is
end reg_32_tb;

architecture testbench of reg_32_tb is

component reg_32 IS
  PORT (clk, reset, load: IN std_logic;
				input : IN std_logic_vector(31 DOWNTO 0);
        output: out std_logic_vector(31 DOWNTO 0)
        );
END component;
       

  SIGNAL RESET :std_logic := '0';
  SIGNAL clock   : std_logic := '0';
	SIGNAL load : std_logic:= '1';

	SIGNAL input :  std_logic_vector(31 downto 0) := "00000000000000000000000000011011";
	SIGNAL output :  std_logic_vector(31 downto 0);

  BEGIN

  device:  reg_32 port map(clock, reset, load, input, output);
	
	clock  <= not clock after 5 ns;

	load <= '0' after 60 ns;
	
	input <= "00000000000000000000000000000011" after 30 ns, "11110000000000000000000000000011" after 70 ns;

	reset  <= '1' after 20 ns, '0' after 40 ns;


PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  
