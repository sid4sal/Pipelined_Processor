--Stage1
library ieee;
use ieee.std_logic_1164.all;

entity Stage1 is
	port( clk: in std_logic;
	      rst: in std_logic;
		  PC_en: in std_logic;

		  mux1_control_0: in std_logic;
		  mux1_control_1: in std_logic;

		  Rf_d2: in std_logic_vector(15 downto 0);
		  ALU1_out: in std_logic_vector(15 downto 0);
		  ALU3_out_back: in std_logic_vector(15 downto 0);

		  Inst_out_11: out std_logic_vector(15 downto 0);
		  PC_out_11: out std_logic_vector(15 downto 0)); 


end entity Stage1;

architecture Struct of Stage1 is

entity mux4to1_16bits is
   port(
		S1,S0: in std_logic;
		D0,D1,D2,D3: in std_logic_vector(15 downto 0);
		Y: out std_logic_vector(15 downto 0)
	);
end entity mux4to1_16bits;


component InstrMemory is
	port(mem_add: in std_logic_vector(15 downto 0);
		  Inst: out std_logic_vector(15 downto 0));
end component InstrMemory;


entity reg_for_PC is 

	port(d   : in std_logic_vector(15 downto 0);
		clk : in std_logic;
		en  : in std_logic;
		rst : in std_logic;
		q   : out std_logic_vector(15 downto 0));
end entity reg_for_PC;

component PC_Incrementer is
	port(PC_curr: in std_logic_vector(15 downto 0);
		  PC_next: out std_logic_vector(15 downto 0));
end component PC_Incrementer;

signal sig1, PC_next, PC_C: std_logic_vector(15 downto 0);

begin


	
	PC_inc: PC_Incrementer port map(PC_curr => PC_C, PC_next => PC_next);
	
	inst1: InstrMemory port map(mem_add => PC_C, Inst => Inst_out_11);

	mux2: mux4to1_16bits port map(S0 =>mux1_control_0,S1 =>mux1_control_1, D0 => PC_next, D1 => Rf_d2, D2 => ALU1_out, D3 => ALU3_out, Y => sig1);

	PC_block: reg_for_PC port map(d => sig1, en => PC_en, clk => clk, rst => rst, q => PC_C); 
	

	PC_out_11<=PC_C;


  
end architecture Struct;