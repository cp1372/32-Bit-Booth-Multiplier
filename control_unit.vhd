library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY control_unit IS

  PORT (start, clk, reset: in std_logic; 
				cnt : in std_logic_vector(6 downto 0);
				done, shift, clear, load_p, load_a, load_b, enable_cnt: out std_logic);

END control_unit;


ARCHITECTURE RTL OF control_unit IS

TYPE state IS (idle, load_data, addP_holdA, shiftData, finished);

Signal cState, nState : state;
signal cnt_done: std_logic;

BEGIN

-- takes the MSB bit of the 7bit counter
cnt_done <= cnt(6);

transitions : process(clk, reset)
BEGIN
	if (reset = '1') THEN
		cState <= idle;
	elsif (clk'event and clk='1') then
		cState <= nState;
	end if;
END process transitions;

decoding : process(cState, start, cnt_done)
BEGIN
		case cState is
			when idle =>
				if start = '1' then
					nState <= load_data;
				else 
					nState <= idle;
				end if;

			when load_data =>
				nState <= addP_holdA;

			when addP_holdA =>
				nState <= shiftData;

			when shiftData =>
				if (cnt_done = '1') then 
						nState <= finished;
				else 
						nState <= addP_holdA;
				end if;

			when finished  =>
					nState <= idle;
		end case;
END process decoding;


outputs : process(cState)
BEGIN
		case cState is

			when idle =>
				clear <= '1';
				done <= '0';
				shift <= '0';
				load_p <= '0';
				load_a <= '0';
				load_b <= '0';
				enable_cnt <= '0';

			when load_data =>
				
				clear <= '0';
				done <= '0';
				shift <= '0';
				load_p <= '1';
				load_a <= '1';
				load_b <= '1';
				enable_cnt <= '1';

			when addP_holdA =>
				
				clear <= '0';
				done <= '0';
				shift <= '0';
				load_p <= '1';
				load_a <= '0';
				load_b <= '0';
				enable_cnt <= '1';
				
			when shiftData =>
				
				clear <= '0';
				done <= '0';
				shift <= '1';
				load_p <= '0';
				load_a <= '0';
				load_b <= '0';
				enable_cnt <= '1';

			when finished  =>
				
				clear <= '0';
				done <= '1';
				shift <= '0';
				load_p <= '0';
				load_a <= '0';
				load_b <= '0';
				enable_cnt <= '0';

		end case;
END process outputs;

END ARCHITECTURE RTL;
