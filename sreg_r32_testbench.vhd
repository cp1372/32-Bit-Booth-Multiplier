
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity sreg_r32_tb is
end sreg_r32_tb;


architecture testbench of sreg_r32_tb is

component sreg_r32 IS
  PORT (clk, ser_in, reset, load, shift: IN std_logic;
				input : IN std_logic_vector(31 DOWNTO 0);
        q_out: INOUT std_logic_vector(31 DOWNTO 0);
				ser_out : OUT STD_LOGIC
       );
END component;

  SIGNAL clock  : std_logic := '0';
	SIGNAL ser_in : std_logic:= '1';
  SIGNAL RESET :std_logic := '0';

	SIGNAL load : std_logic:= '1';
	SIGNAL shift : std_logic:= '0';

	SIGNAL input :  std_logic_vector(31 downto 0) := "00000000000000000000000000011011";
	SIGNAL q_out :  std_logic_vector(31 downto 0);	
	SIGNAL ser_out : std_logic;

   
  BEGIN

  device:  sreg_r32 port map(clock, ser_in, reset, load, shift, input, q_out, ser_out);
	
	clock  <= not clock after 5 ns;

	ser_in <= '0' after 60 ns, '1' after 140 ns;

	load <= '0' after 60 ns, '1' after 240 ns;
	
	input <= "01110000000000000000000000100011" after 30 ns, "10000000000000000000000000001011" after 70 ns;

	shift <= '1' after 100 ns, '0' after 180 ns, '1' after 240 ns;

	reset  <= '1' after 20 ns, '0' after 40 ns;



PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  