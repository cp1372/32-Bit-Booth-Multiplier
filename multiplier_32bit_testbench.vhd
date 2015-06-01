LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity multiplier_32bit_tb is
end multiplier_32bit_tb;

architecture testbench of multiplier_32bit_tb is

component multiplier_32bit 
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
			 start: in std_logic;
       p 		: out std_logic_vector(63 downto 0);
			 done : out std_logic;
 			 reset: in std_logic;
			 clk : in std_logic
			);
end component;

 	SIGNAL a : STD_LOGIC_VECTOR(31 DOWNTO 0) := "11111111111111111111111111001000";
	SIGNAL b : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000100011";
	SIGNAL start :std_logic := '0';
	SIGNAL p : STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL done : std_logic;
	SIGNAL RESET :  std_logic := '0';
	SIGNAL clock   : std_logic := '0';

	
  BEGIN
  device:  multiplier_32bit port map(a, b, start, p, done, reset, clock);
	clock  <= not clock after 5 ns;
	start <= '1' after 20 ns;

PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  
