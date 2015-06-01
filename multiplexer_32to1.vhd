library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Multiplexer that takes in 32-bit inputs per data line and outputs a 32-bit wide dataline

entity multiplexer_32to1 is
port (
    input_00 : in std_logic_vector(31 downto 0);
	input_01 : in std_logic_vector(31 downto 0);	
	input_10 : in std_logic_vector(31 downto 0);
	input_11 : in std_logic_vector(31 downto 0);
    sel : 	   in std_logic_vector(1 downto 0);
    output :   out std_logic_vector(31 downto 0)
     );
end multiplexer_32to1;

architecture behavioral of multiplexer_32to1 is
	
begin

process(input_00, input_01, input_10, input_11, sel(1), sel(0) )

begin
	case sel is
  	when "00" => 
			output <= input_00;
  	when "01" => 
			output <= input_01;
 		when "10" => 
			output <= input_10;
		when others => 
			output <= input_11;
	end case;

end process;

end behavioral;