library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity mux_2to1_8bits is

		port(A,B: in std_logic_vector(7 downto 0);
           S0:in std_logic;
	        Y: out std_logic_vector(7 downto 0));
			  
end entity mux_2to1_8bits;
  
architecture Struct of mux_2to1_8bits is
	
begin

	mux_proc : process (A, B, S0) 
	
	begin
	
		if S0 = '0' then
			Y <= A;
		else
			Y <= B;
		end if;
	end process mux_proc;
			
end architecture Struct;