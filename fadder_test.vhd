library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity fadder_test is
end fadder_test;

architecture testbench of fadder_test is

component fadder is
  port(a    : in  std_logic;
       b    : in  std_logic;
       cin  : in  std_logic;
       s    : out std_logic;
       cout : out std_logic);
end component;


	signal a :  std_logic := '0';
	signal b :  std_logic := '0';
	signal cin :  std_logic := '1';
	signal s    :  std_logic;
	signal cout :  std_logic;


BEGIN
	device:  fadder port map(a, b, cin, s, cout);

	a <=  '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
	b <=  '1' after 20 ns, '1' after 40 ns, '0' after 100 ns;
	cin <= '0' after 80 ns;

PROCESS
BEGIN
WAIT FOR 200 ns;
END PROCESS;

END testbench;