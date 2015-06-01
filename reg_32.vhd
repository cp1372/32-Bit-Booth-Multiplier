library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_32 IS
  PORT (clk, reset, load: IN std_logic;
				input : IN std_logic_vector(31 DOWNTO 0);
        output: out std_logic_vector(31 DOWNTO 0)
       );
END ENTITY reg_32;

ARCHITECTURE RTL OF reg_32 IS

SIGNAL temp : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL sel : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  PROCESS(clk, reset)
  BEGIN
    IF reset = '1' THEN
      temp <= "00000000000000000000000000000000";
    ELSIF (clk'event AND clk = '1') AND load = '1' THEN
      temp <= input;
    END IF;
  END PROCESS;

	output <= temp;

END ARCHITECTURE RTL;
