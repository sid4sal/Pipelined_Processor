library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DataMemory is
 
	port(data_in: in std_logic_vector(15 downto 0);
		  mem_add: in std_logic_vector(15 downto 0);
		  rd: in std_logic;--23
		  wr: in std_logic;--24
		  clk: in std_logic;
		  data_out: out std_logic_vector(15 downto 0));
		  
end entity DataMemory;

architecture data of DataMemory is

	type data is array(65535 downto 0) of std_logic_vector(15 downto 0);
	
	signal data_mem : data := (others=>"0000000000000000");
	signal address : std_logic_vector(15 downto 0);
	
	begin
		
		address <= mem_add;
		
		data_mem_proc : process(data_in, data_mem, rd, clk, wr, address)
		
		begin
			
			if (rd = '1') then 
				data_out <= data_mem(to_integer(unsigned(address)));
			
			elsif (falling_edge(clk))	then 
				if(wr = '1') then
					data_mem(to_integer(unsigned(address))) <= data_in;
					data_out <= (others => '0');
				end if;
				
			end if;
		
		end process data_mem_proc;

end architecture data;
