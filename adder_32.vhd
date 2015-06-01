
library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity add32 is             
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
       cin  : in  std_logic; 
       sum  : out std_logic_vector(31 downto 0);
       cout : out std_logic);
end entity add32;

architecture structural of add32 is

component fadder is
  port(a    : in  std_logic;
       b    : in  std_logic;
       cin  : in  std_logic;
       s    : out std_logic;
       cout : out std_logic);
end component;

  SIGNAL c : 	std_logic_vector(31 downto 0);
	signal temp_cin :   std_logic;
	signal temp_cout :   std_logic;
	
	BEGIN



a0: fadder Port map (a(0), b(0), cin, sum(0), c(0) );

a1: fadder Port map (a(1), b(1), c(0), sum(1), c(1) );
a2: fadder Port map (a(2), b(2), c(1), sum(2), c(2) );
a3: fadder Port map (a(3), b(3), c(2), sum(3), c(3) );
a4: fadder Port map (a(4), b(4), c(3), sum(4), c(4) );
a5: fadder Port map (a(5), b(5), c(4), sum(5), c(5) );
a6: fadder Port map (a(6), b(6), c(5), sum(6), c(6) );
a7: fadder Port map (a(7), b(7), c(6), sum(7), c(7) );
a8: fadder Port map (a(8), b(8), c(7), sum(8), c(8) );
a9: fadder Port map (a(9), b(9), c(8), sum(9), c(9) );
a10: fadder Port map (a(10), b(10), c(9), sum(10), c(10) );

a11: fadder Port map (a(11), b(11), c(10), sum(11), c(11) );
a12: fadder Port map (a(12), b(12), c(11), sum(12), c(12) );
a13: fadder Port map (a(13), b(13), c(12), sum(13), c(13) );
a14: fadder Port map (a(14), b(14), c(13), sum(14), c(14) );
a15: fadder Port map (a(15), b(15), c(14), sum(15), c(15) );
a16: fadder Port map (a(16), b(16), c(15), sum(16), c(16) );
a17: fadder Port map (a(17), b(17), c(16), sum(17), c(17) );
a18: fadder Port map (a(18), b(18), c(17), sum(18), c(18) );
a19: fadder Port map (a(19), b(19), c(18), sum(19), c(19) );
a20: fadder Port map (a(20), b(20), c(19), sum(20), c(20) );

a21: fadder Port map (a(21), b(21), c(20), sum(21), c(21) );
a22: fadder Port map (a(22), b(22), c(21), sum(22), c(22) );
a23: fadder Port map (a(23), b(23), c(22), sum(23), c(23) );
a24: fadder Port map (a(24), b(24), c(23), sum(24), c(24) );
a25: fadder Port map (a(25), b(25), c(24), sum(25), c(25) );
a26: fadder Port map (a(26), b(26), c(25), sum(26), c(26) );
a27: fadder Port map (a(27), b(27), c(26), sum(27), c(27) );
a28: fadder Port map (a(28), b(28), c(27), sum(28), c(28) );
a29: fadder Port map (a(29), b(29), c(28), sum(29), c(29) );
a30: fadder Port map (a(30), b(30), c(29), sum(30), c(30) );

a31: fadder Port map (a(31), b(31), c(30), sum(31), cout );

  -- FA: for i in 1 to 30 
	--generate	
	 -- 	middle: fadder PORT MAP (a(i), b(i), c(i-1), sum(i), c(i));
   -- end generate FA;

end architecture structural;



