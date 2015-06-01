LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity counter_tb is
end counter_tb;



architecture testbench of counter_tb is

  component counter port (
    RESET    : in std_logic;
    CLK      : in std_logic;
		enable   : in std_logic;
    cnt_out  : out std_logic_vector(6 downto 0)); 
	end component;
       

  signal RESET :std_logic := '0';
  SIGNAL clock   : std_logic := '0';
	SIGNAL enable : std_logic:= '1';
  signal output_data : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
   
  BEGIN

  device:  counter port map(reset, clock, enable, output_data);
	

	clock  <= not clock after 5 ns;
	enable <= '0' after 200 ns, '1' after 400 ns;
	reset  <= '1' after 20 ns, '0' after 40 ns, '1' after 600 ns;



PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  

