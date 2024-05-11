library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity pipelineReg5 is 
	port(
          PC_out_4: in std_logic_vector(15 downto 0);
		  Inst_out_4: in std_logic_vector(15 downto 0);
          clk: in std_logic;
		  en: in std_logic;
          mux9_out_55: in std_logic_vector(15 downto 0);


          mux9_out_5: out std_logic_vector(15 downto 0);
          PC_out_5: out std_logic_vector(15 downto 0);
		  Inst_11_9: out std_logic_vector(2 downto 0);
		  Inst_8_6: out std_logic_vector(2 downto 0);
		  Inst_5_3: out std_logic_vector(2 downto 0);
    )
end entity pipelineReg5;

architecture Struct of pipelineReg5 is


begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
		  
            if en = '1' then
                Inst_11_9 <= Inst_out_4(11 downto 9);
                Inst_8_6 <= Inst_out_4(8 downto 6);
                Inst_5_3 <= Inst_out_4(3 downto 3);
                PC_out_5 <= PC_out_4;
                mux9_out_5 <= mux9_out_55;
            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture Struct;