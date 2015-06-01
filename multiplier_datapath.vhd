library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity datapath is  
  port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
			 clk, shift, reset, load_p, load_a, load_b, cnt_enable : in std_logic;
	   	 cnt :  out std_logic_vector(6 downto 0);
       preg  : inout std_logic_vector(31 downto 0);
       areg : inout std_logic_vector(31 downto 0)
			);
end entity datapath;

architecture wiring of datapath is


  component counter 
		port (
    RESET    : in std_logic;
    CLK      : in std_logic;
	enable   : in std_logic;
    cnt_out  : out std_logic_vector(6 downto 0) -- Output data
				); 
	end component;

	component sreg_r32
  	PORT (clk, ser_in, reset, load, shift: IN std_logic;
				input : IN std_logic_vector(31 DOWNTO 0);
        q_out: INOUT std_logic_vector(31 DOWNTO 0);
				ser_out : OUT STD_LOGIC
       );
	end component;

	component reg_32 IS
  	PORT (clk, reset, load: IN std_logic;
		  input : IN std_logic_vector(31 DOWNTO 0);
          output: out std_logic_vector(31 DOWNTO 0)
       );
	end component;

	component add32 is   
 		port(a    : in  std_logic_vector(31 downto 0);
       b    : in  std_logic_vector(31 downto 0);
       cin  : in  std_logic; 
       sum  : out std_logic_vector(31 downto 0);
       cout : out std_logic);
	end component;

	component dflipflop
 		PORT (d, clk, reset: in std_logic; 
				q: out std_logic);
	end component;

	
	component multiplexer_32to1 
		port (
    input_00 : in std_logic_vector(31 downto 0);
		input_01 : in std_logic_vector(31 downto 0);	
		input_10 : in std_logic_vector(31 downto 0);
		input_11 : in std_logic_vector(31 downto 0);
    sel : 		 in std_logic_vector(1 downto 0);
    output :   out std_logic_vector(31 downto 0)
     );
	end component;

	component INVERTER_32 IS 
		PORT( a: IN  std_logic_vector(31 downto 0); 
				b: OUT std_logic_vector(31 downto 0)
		); 
	end component;

	signal b_out, b_out_neg, mux_output, adder_output : std_logic_vector(31 downto 0);
	signal useless_cout, areg_so, preg_so, cin_adder : std_logic;
	
	signal a_sel: std_logic_vector(1 downto 0) := "00" ;
	signal mux_zeros: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
	
begin
	
cin_adder <= a_sel(1) AND (NOT a_sel(0) );

	Aregister: 	sreg_r32 port map(clk, preg_so, reset, load_a, shift, a, areg, a_sel(1) );
	Pregister:	sreg_r32 port map(clk, preg(31), reset, load_p, shift, adder_output, preg, preg_so );
	Bregister:  reg_32   port map(clk, reset, load_b, b, b_out);

	negate_b:	inverter_32 port map(b_out, b_out_neg);

	adderinput: multiplexer_32to1	port map(mux_zeros, b_out, b_out_neg, mux_zeros, a_sel, mux_output);

	previousA:	dflipflop  port map(a_sel(1), clk, reset, a_sel(0) );
	theAdder:	  add32		port map(mux_output, preg, cin_adder, adder_output, useless_cout);

	ctn:				counter port map (reset, clk, cnt_enable, cnt );

end architecture wiring;