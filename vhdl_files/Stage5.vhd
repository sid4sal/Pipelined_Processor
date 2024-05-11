--Stage 5
library ieee;
use ieee.std_logic_1164.all;

entity stage5 is
	port( 
          mux9_control15 : in std_logic;
		  dm_control23 : in std_logic; --read
		  dm_control24 : in std_logic; --write
		  en: in std_logic;
		  clk: in std_logic;
		  mux8_out_4: in std_logic_vector(15 downto 0);
		  d1_out_4: in std_logic_vector(15 downto 0);


		  mux9_out: out std_logic_vector(15 downto 0);

	)
end entity stage5;

architecture Struct of stage5 is

    component mux2to1_16bits is

        port(S0: in std_logic;
         D0,D1: in std_logic_vector(15 downto 0);
         Y: out std_logic_vector(15 downto 0));
         
     end component mux2to1_16bits;

component DataMemory is 
	port(data_in: in std_logic_vector(15 downto 0);
		  mem_add: in std_logic_vector(15 downto 0);
		  rd: in std_logic;
		  wr: in std_logic;
		  clk: in std_logic;
		  data_out: out std_logic_vector(15 downto 0));
end component DataMemory;



	signal data_out_sig: std_logic_vector(15 downto 0);

	begin

	
	Data_memory: DataMemory port map(d1_out_4, mux8_out_4, dm_control23, dm_control24, clk, data_out_sig);

    mux1: mux2to1_16bits 
    port map(mux9_control15, data_out_sig, mux8_out_4, mux9_out);

end architecture Struct;

