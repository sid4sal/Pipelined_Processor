library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity pipelineReg3 is 
	port(
        PC_out_2: in std_logic_vector(15 downto 0);
        Inst_out_2: in std_logic_vector(15 downto 0);
        imm6_extended_out_2: in std_logic_vector(15 downto 0);
        imm9_extended_out_2: in std_logic_vector(15 downto 0);
		  en: in std_logic;
		  clk: in std_logic;

	      d1: in std_logic_vector(15 downto 0);
		  d2: in std_logic_vector(15 downto 0);

          d1_out_3: out std_logic_vector(15 downto 0);
		  d2_out_3: out std_logic_vector(15 downto 0);
          PC_out_3: out std_logic_vector(15 downto 0);
          Inst_out_3: out std_logic_vector(15 downto 0);
          imm6_extended_out_3: out std_logic_vector(15 downto 0);
          imm9_extended_out_3: out std_logic_vector(15 downto 0);
          )
end entity pipelineReg3;

architecture Struct of pipelineReg3 is

signal dummy: std_logic_vector(133 downto 0);

begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
		  
            if en = '1' then
                d1_out_3 <= d1
                d2_out_3 <= d2
                PC_out_3 <= PC_out_2
                Inst_out_3 <= Inst_out_2
                imm6_extended_out_3 <= imm6_extended_out_2
                imm9_extended_out_3 <= imm9_extended_out_2
            end if;
				
        end if;
		  
    end process dff_proc;
	 
end architecture Struct;