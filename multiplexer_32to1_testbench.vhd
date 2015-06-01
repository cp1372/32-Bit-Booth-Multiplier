LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;

entity mux_tb is
end mux_tb;

architecture testbench of mux_tb is

  component multiplexer_32to1 port (
    input_00 : in std_logic_vector(31 downto 0);
		input_01 : in std_logic_vector(31 downto 0);	
		input_10 : in std_logic_vector(31 downto 0);
		input_11 : in std_logic_vector(31 downto 0);
    sel : 		 in std_logic_vector(1 downto 0);
    output :   out std_logic_vector(31 downto 0)
     );
	end component;
       
 	 signal input_00 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal input_01 :  std_logic_vector(31 downto 0) := "00000000000000000000000000000001";	
	signal input_10 :  std_logic_vector(31 downto 0) := "00000000000000000000000000000010";
	signal input_11 :  std_logic_vector(31 downto 0) := "00000000000000000000000000000011";
  	signal sel : 	   std_logic_vector(1 downto 0)  := "00";
  	signal output :    std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

  BEGIN

  device:  multiplexer_32to1 port map(input_00, input_01, input_10, input_11, sel, output);
	
	sel <=  "01" after 20 ns, "10" after 40 ns, "11" after 60 ns, "00" after 160 ns, "00" after 180 ns;
	input_11 <= "00000000000000000000000000001111" after 120 ns;
	input_00 <= "00000000000000000000000000010011" after 100 ns;

PROCESS
BEGIN
WAIT FOR 800 ns;
END PROCESS;

END testbench;
  
