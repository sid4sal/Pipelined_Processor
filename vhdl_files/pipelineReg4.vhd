library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity pipelineReg4 is 
	port( PC_out_3: in std_logic_vector(15 downto 0);
		  Inst_out_3: in std_logic_vector(15 downto 0);

		  en: in std_logic;
		  clk: in std_logic;
		  mux8_out_44: in std_logic_vector(15 downto 0);
		  d1_out_44: in std_logic_vector(15 downto 0);

		  PC_out_4: out std_logic_vector(15 downto 0);
		  Inst_out_4: out std_logic_vector(15 downto 0);
		  mux8_out_4: out std_logic_vector(15 downto 0);
		  d1_out_4: out std_logic_vector(15 downto 0);

	)
end entity pipelineReg4;

architecture Struct of pipelineReg4 is

signal dummy: std_logic_vector(198 downto 0);

begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
		  
            if en = '1' then
                PC_out_4 <= PC_out_3;
                Inst_out_4 <= Inst_out_3;
                mux8_out_4 <= mux8_out_44;
                d1_out_4 <= d1_out_44;

            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture Struct;