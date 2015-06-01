library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY sreg_r32 IS
  PORT (clk, ser_in, reset, load, shift: IN std_logic;
				input : IN std_logic_vector(31 DOWNTO 0);
        q_out: INOUT std_logic_vector(31 DOWNTO 0);
				ser_out : OUT STD_LOGIC
        );
END;

ARCHITECTURE RTL OF sreg_r32 IS
	SIGNAL temp : STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sel : STD_LOGIC_VECTOR (1 DOWNTO 0);
BEGIN
	sel <= load & shift;
  PROCESS(clk, reset)
  BEGIN
    IF reset = '1' THEN
      temp <= "00000000000000000000000000000000";
    ELSIF (clk'event AND clk = '1') THEN
			CASE sel IS
				WHEN "00" =>
					temp <= temp;
				WHEN "01" =>
					temp <= ser_in & q_out(31 DOWNTO 1);
				WHEN "10" =>
					temp <= input;
				WHEN "11" =>
					temp <= temp;
				WHEN others =>
					temp <= temp;
    	END CASE;
		END IF;
  END PROCESS;

	ser_out <= temp(0);
	q_out <= temp;
END rtl; 

