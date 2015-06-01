library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity multiplier_32bit is  
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
	   start: in std_logic;
       p 		: out std_logic_vector(63 downto 0);
	   done : out std_logic;
 	   reset: in std_logic;
	   clk : in std_logic
		);
end entity multiplier_32bit;

architecture wiring of multiplier_32bit is

component datapath is  
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
	   clk, shift, reset, load_p, load_a, load_b, cnt_enable : in std_logic;
	   cnt :  out std_logic_vector(6 downto 0);
       preg  :   inout std_logic_vector(31 downto 0);
       areg : inout std_logic_vector(31 downto 0)
			);
end component;


component control_unit IS
  PORT (start, clk, reset: in std_logic; 
		cnt : in std_logic_vector(6 downto 0);
		done, shift, clear, load_p, load_a, load_b, enable_cnt: out std_logic);
	END component;

    SIGNAL shift, clear_data, load_p, load_a, load_b, cnt_enable : std_logic;
	SIGNAL cnt : std_logic_vector(6 downto 0);
	SIGNAL result : std_logic_vector(63 downto 0);
	SIGNAL preg, areg : std_logic_vector(31 downto 0);

begin
	result <= preg & areg;
	p <= result;

	Data: 				datapath  port map(a, b, clk, shift, clear_data, load_p, load_a, load_b, cnt_enable, cnt, preg, areg);
	ControlUnit:	control_unit  port map(start, clk, reset, cnt, done, shift, clear_data, load_p, load_a, load_b, cnt_enable)
end architecture wiring;

