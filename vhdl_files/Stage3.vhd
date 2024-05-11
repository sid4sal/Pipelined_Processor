--Stage 3
library ieee;
use ieee.std_logic_1164.all;

entity stage3 is
	port(
        
          clk: in std_logic;
		  rd: in std_logic;
		  wr: in std_logic;
		  reset: in std_logic;


		  Inst_11_9: in std_logic_vector(2 downto 0);
		  Inst_8_6: in std_logic_vector(2 downto 0);
		  mux10_out: in std_logic_vector(2 downto 0);
		  mux11_out: in std_logic_vector(15 downto 0);

	      d1: out std_logic_vector(15 downto 0);
		  d2: out std_logic_vector(15 downto 0);
    )

end entity stage3;

architecture Struct of stage3 is

component reg_file is 
	port(ra1: in std_logic_vector(2 downto 0);
	     ra2: in std_logic_vector(2 downto 0);
		  wa3: in std_logic_vector(2 downto 0);
		  wd3: in std_logic_vector(15 downto 0);
		  wr: in std_logic;
		  rd: in std_logic;
		  clk:in std_logic;
		  reset: in std_logic;
		  rd1: out std_logic_vector(15 downto 0);
		  rd2: out std_logic_vector(15 downto 0));
end component reg_file;


	signal d1_dummy, d2_dummy: std_logic_vector(15 downto 0);

	begin

	RF: reg_file port map(reset, Inst_11_9, Inst_8_6, mux10_out, mux11_out,  wr, rd, clk, rd1 => d1_dummy, rd2 => d2_dummy);
		
	d1 <= d1_dummy;

	d2 <= d2_dummy;

end architecture Struct;
