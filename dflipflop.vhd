--Behavioural data flow description for D-Flip Flop using Guarded Signal

library ieee;
use ieee.std_logic_1164.all;

ENTITY dflipflop IS
  PORT (d, clk, reset: in std_logic; 
		q: out std_logic);
END dflipflop;

ARCHITECTURE rtl OF dflipflop IS
  BEGIN
  PROCESS(clk, reset)
  BEGIN
    IF reset = '1' THEN
      q <= '0';
    ELSIF (clk'event AND clk = '1') THEN
      q <= d;
    END IF;
  END PROCESS;
END rtl;
