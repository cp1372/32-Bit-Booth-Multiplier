library IEEE;
library STD;

use std.textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use work.all;

-- I was assisted by Jessica Hillier and Jason Howell in writing this code. 
-- They showed me how they used write and read commands for their program and the general flow I should use.

entity batch_test is
end batch_test;

architecture filewriting of batch_test is

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


signal done_out, startin, clk, clear:std_logic;
signal input_A, input_B:std_logic_vector(31 downto 0);
signal outputdata_C:std_logic_vector(63 downto 0);

file multiplier_value: TEXT is in "C:\test\fileiotest.txt";
file multiplier_output: TEXT is out "C:\test\new_fileiotest.txt";

begin

themultiplier: multiplier_32bit port map(input_A, input_B, startin, outputdata_C, done_out, clear, clk);

process

variable output_line:LINE;
variable input_line:LINE;
variable inputdata_A, inputdata_B:std_logic_vector(31 downto 0);
variable i:bit;

begin
 
 for i in 1 to 508 loop

	clk <= '0';
	clear <= '0';
	startin <= '0';
	wait for 5 ns;
	
	clk <= '1';
	clear <= '0';
	startin	<= '1';
	wait for 5 ns;

	readline(multiplier_value,input_line);
	read(input_line, inputdata_A);
	
	readline(multiplier_value, input_line);
	read(input_line, inputdata_B);
	
	input_A <= inputdata_A;
	input_B <= inputdata_B;

		while (done_out = '0') loop
			clk  <= not clk;
			wait for 5 ns; 
		end loop;

	write(output_line, outputdata_C);
	writeline(multiplier_output, output_line);


end loop;
end process;
end filewriting;



