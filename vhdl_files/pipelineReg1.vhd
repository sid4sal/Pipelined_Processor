library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity pipelineReg1 is 
	port( 
          Inst_out_11: in std_logic_vector(15 downto 0);
          PC_out_11: in std_logic_vector(15 downto 0); 
		  en: in std_logic;
		  clk: in std_logic;
		  PC_out_1: out std_logic_vector(15 downto 0);
		  Inst_out_1: out std_logic_vector(15 downto 0));
end entity pipelineReg1;

architecture Struct of pipelineReg1 is


begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
		  
            if en = '1' then
                PC_out_1 <= PC_out_11;
				Inst_out_1 <= Inst_out_11;
            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture Struct;