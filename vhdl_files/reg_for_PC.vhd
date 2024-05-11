library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;


entity reg_for_PC is 

	port(d   : in std_logic_vector(15 downto 0);
		clk : in std_logic;
		en  : in std_logic;
		rst : in std_logic;
		q   : out std_logic_vector(15 downto 0));
end entity reg_for_PC;

architecture arch_Reg of reg_for_PC is

begin

    dff_proc: process(clk, rst)
	 
    begin
	 
        if rst = '1' then
            q <= "0000000000000000";
        elsif falling_edge(clk) then
            if en = '1' then
                q <= d;
            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture arch_Reg;