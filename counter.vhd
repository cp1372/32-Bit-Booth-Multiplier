library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;    -- for the unsigned type
 
entity COUNTER is
  port (
    RESET    : in std_logic;
    CLK      : in std_logic;
		enable   : in std_logic;
    cnt_out  : out std_logic_vector(6 downto 0) -- Output data
		
				); 
end COUNTER;
 
architecture RTL of COUNTER is
  signal cnt : unsigned(6 downto 0);

begin
  process(RESET, CLK) is
  begin
    if RESET = '1' then
      cnt <= "0000000";
		
    elsif (CLK'event and CLK='1') then
				if enable = '1' then
        	cnt <= cnt + 1;
				else
					cnt <= cnt;
				end if;
    end if;
  end process;
 
  cnt_out <= std_logic_vector(cnt);
end architecture RTL;