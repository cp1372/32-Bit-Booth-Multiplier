
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity adder32_testbench is
end adder32_testbench;

architecture testbench of adder32_testbench is


component add32 is           
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
       cin  : in  std_logic; 
       sum  : out std_logic_vector(31 downto 0);
       cout : out std_logic);
end component;

	signal  a :  std_logic_vector(31 downto 0) :=  "00000000000000001110000011000111";
	signal  b :  std_logic_vector(31 downto 0) :=  "00000000000000000000011100000100";
	signal cin :  std_logic := '0';
	signal  sum :  std_logic_vector(31 downto 0);
	signal   cout :  std_logic;

BEGIN
	
 device:  add32 port map(a, b, cin, sum, cout);

a <=  "00000000000000000000000000000001" after 20 ns, "00000000000000000000000000000000" after 60 ns;
b <=  "00000000000000000000010001010100" after 20 ns, "00000000000000000000000000000000" after 60 ns;
 
cin <= '1' after 50 ns;


PROCESS
BEGIN
WAIT FOR 200 ns;
END PROCESS;

END testbench;
  