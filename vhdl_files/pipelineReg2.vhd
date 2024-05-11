library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity pipelineReg2 is 
	port(

          imm6_extended: in std_logic_vector(15 downto 0);
          imm9_extended: in std_logic_vector(15 downto 0);
		  PC_out_22: in std_logic_vector(15 downto 0);
		  Inst_out_22: in std_logic_vector(15 downto 0);
          
          en: in std_logic;
		  clk: in std_logic;

          imm6_extended_out_2: out std_logic_vector(15 downto 0);
          imm9_extended_out_2: out std_logic_vector(15 downto 0);
		  PC_out_2: out std_logic_vector(15 downto 0);
		  Inst_out_2: out std_logic_vector(15 downto 0);
		  Inst_11_9: out std_logic_vector(2 downto 0);
		  Inst_8_6: out std_logic_vector(2 downto 0);
		  Inst_5_3: out std_logic_vector(2 downto 0);
    )


end entity pipelineReg2;


architecture Struct of pipelineReg2 is

signal dummy: std_logic_vector(56 downto 0);

begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
		  
            if en = '1' then
                PC_out_2 <= PC_out_22
                Inst_out_2 <= Inst_out_22
                imm6_extended_out_2 <= imm6_extended
                imm9_extended_out_2 <= imm9_extended
                Inst_11_9 <= Inst_out_22(11 downto 9)
                Inst_8_6 <= Inst_out_22(8 downto 6)
                Inst_5_3 <= Inst_out_22(5 downto 3)
                
            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture Struct;
