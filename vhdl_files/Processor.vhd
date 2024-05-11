library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity Processor is
   port(rst,CLK50MHZ : in std_logic;
		  Cp, Cc, Zp, Zc: out std_logic); 
end entity Processor;


architecture Struct of Processor is

component Stage1 is
	port( clk: in std_logic;
	      rst: in std_logic;
		  PC_en: in std_logic;

		  mux1_control_0: in std_logic;
		  mux1_control_1: in std_logic;

		  Rf_d2: in std_logic_vector(15 downto 0);
		  ALU1_out: in std_logic_vector(15 downto 0);
		  ALU3_out: in std_logic_vector(15 downto 0);

		  Inst_out_11: out std_logic_vector(15 downto 0);
		  PC_out_11: out std_logic_vector(15 downto 0)); 


end component Stage1;


component pipelineReg1 is 
	port( 
        Inst_out_11: in std_logic_vector(15 downto 0);
        PC_out_11: in std_logic_vector(15 downto 0); 
        en: in std_logic;
        clk: in std_logic;
        PC_out_1: out std_logic_vector(15 downto 0);
        Inst_out_1: out std_logic_vector(15 downto 0));
end component pipelineReg1;

component stage2 is
	port(
        PC_out_1: in std_logic_vector(15 downto 0);
        Inst_out_1: in std_logic_vector(15 downto 0);
         reset: in std_logic;
        mux13_out: in std_logic;
        mux14_out: in std_logic;
        Zc: in std_logic; 
        Zp: in std_logic; 
        Cp: in std_logic; 
        Cc: in std_logic; 

    
        control_signal: out std_logic_vector(27 downto 0);
        imm6_extended: out std_logic_vector(15 downto 0);
        imm9_extended: out std_logic_vector(15 downto 0);
        PC_out_22: out std_logic_vector(15 downto 0);
        Inst_out_22: out std_logic_vector(15 downto 0);
    
        )   
end component stage2;

component pipelineReg2 is 
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
end component pipelineReg2;

component stage3 is
	port(
        
        clk: in std_logic;
        rd: in std_logic;
        wr: in std_logic;
        reset: in std_logic;


        Inst_11_9: in std_logic_vector(2 downto 0);
        Inst_8_6: in std_logic_vector(2 downto 0);
        mux10_out: in std_logic_vector(2 downto 0);
        mux11_out: in std_logic_vector(15 downto 0);

        d1: out std_logic_vector(15 downto 0);
        d2: out std_logic_vector(15 downto 0);
  )
end component stage3;

component pipelineReg3 is 
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
end component pipelineReg3;

component stage4 is 
	port(
        
        d1_out_3:in std_logic_vector(15 downto 0);
        d2_out_3: :in std_logic_vector(15 downto 0);
        PC_out_3: :in std_logic_vector(15 downto 0);
        Inst_out_3: :in std_logic_vector(15 downto 0);
        imm6_extended_out_3:in std_logic_vector(15 downto 0);
        imm9_extended_out_3: in std_logic_vector(15 downto 0);
        mux3_control4 : in std_logic;
        mux4_control5 : in std_logic;
        mux5_control6 : in std_logic;
        mux6_control9 : in std_logic;
        mux7_control0 : in std_logic;
        mux8_control13 : in std_logic;
        mux8_control14 : in std_logic;
        mux13_control28 : in std_logic;
        mux13_control29 : in std_logic;
        mux14_control30 : in std_logic;
        mux14_control31 : in std_logic;
        ALU1_control11 : in std_logic;
        ALU1_control12 : in std_logic;
        ALU2_control26 : in std_logic;
        ALU2_control27 : in std_logic;
        ALU3_control7 : in std_logic;
        ALU3_control8 : in std_logic;
        carry, zero: in std_logic;
        clk: in std_logic;



		  mux8_out: out std_logic_vector(15 downto 0);
		  d1_out_44: out std_logic_vector(15 downto 0);
		  d2_out_44: out std_logic_vector(15 downto 0);
          Cc: out std_logic;
		  Zc: out std_logic;
		  ALU3_out_back: out std_logic_vector(15 downto 0);
		  ALU1_out: out std_logic_vector(15 downto 0);


    )
end component stage4;

component pipelineReg4 is 
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
end component pipelineReg4;

component stage5 is
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
end component stage5;

component pipelineReg5 is 
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
end component pipelineReg5;

component stage6 is
	port(
        mux10_control16 :  in std_logic;
        mux10_control17 :  in std_logic;
        mux11_control20 :  in std_logic;
        Adder2_control18 :  in std_logic;
        Adder2_control19 :  in std_logic;
        mux9_out_5: in std_logic_vector(15 downto 0);
        PC_out_5: in std_logic_vector(15 downto 0);
        Inst_11_9: in std_logic_vector(2 downto 0);
        Inst_8_6: in std_logic_vector(2 downto 0);
        Inst_5_3: in std_logic_vector(2 downto 0);
        
        mux10_out: in std_logic_vector(2 downto 0);
        mux11_out: in std_logic_vector(15 downto 0);
        )
end component stage6;

component ALU is
	port(ALU_A, ALU_B: in std_logic_vector(15 downto 0);
		  C1: in std_logic; C0: in std_logic;  Cin: in std_logic;  Zin: in std_logic;
		  ALU_C: out std_logic_vector(15 downto 0);
		  C: out std_logic; Z: out std_logic);
end component ALU;



component PC_Incrementer is
	port(PC_curr: in std_logic_vector(15 downto 0);
		  PC_next: out std_logic_vector(15 downto 0));
end component PC_Incrementer;




component Complementer is
	port(rf_d2: in std_logic_vector(15 downto 0);
		  complement: out std_logic_vector(15 downto 0));
end component Complementer;

component reg_for_PC is 

	port(d   : in std_logic_vector(15 downto 0);
		clk : in std_logic;
		en  : in std_logic;
		rst : in std_logic;
		q   : out std_logic_vector(15 downto 0));
end component reg_for_PC;


component controller_logic is
	port(inst: in std_logic_vector(15 downto 0);
	reset: in std_logic;
	Cp: in std_logic;
	Cc: in std_logic;
	Zp: in std_logic;
	Zc: in std_logic;
	control_final: out std_logic_vector(31 downto 0));

end component controller_logic;


component DataMemory is 
	port(data_in: in std_logic_vector(15 downto 0);
		  mem_add: in std_logic_vector(15 downto 0);
		  rd: in std_logic;
		  wr: in std_logic;
		  clk: in std_logic;
		  data_out: out std_logic_vector(15 downto 0));
end component DataMemory;


component reg_file is 
	port(ra1: in std_logic_vector(2 downto 0);
	     ra2: in std_logic_vector(2 downto 0);
		  wa3: in std_logic_vector(2 downto 0);
		  wd3: in std_logic_vector(15 downto 0);
		  PC_in: in std_logic_vector(15 downto 0);
		  wr: in std_logic;
		  rd: in std_logic;
		  clk:in std_logic;
		  rd1: out std_logic_vector(15 downto 0);
		  rd2: out std_logic_vector(15 downto 0));
end component reg_file;



	signal clk, Zc,Cc: std_logic;


	signal  ALU1_out, Inst, PC_current, ALU3_out_back, d1, d2, ALU3_out,mux9_out,mux10_out,mux11_out, imm6_extended, imm9_extended,mux8_out: std_logic_vector(15 downto 0);

    signal  Inst_11_9, Inst_8_6, Inst_5_3 : std_logic_vector(2 downto 0);
    signal control_final : std_logic_vector(31 downto 0);

    signal enable : std_logic := '1';

	begin

	clk <= CLK50MHZ;


------Instruction Fetch------

	st1: Stage1 port map(clk, rst, control_final(25), control_final(0), control_final(1), d2, ALU1_out, ALU3_out_back, Inst);
								
	pipReg1: pipelineReg1 port map(Inst, PC_current, enable, clk, PC_current, Inst);

------Instruction Decode------

	st2: stage2 port map(PC_current, Inst, rst, mux13_out, mux14_out, Zc, Zp, Cp, Cc, control_final, imm6_extended, imm9_extended, PC_current, Inst);
								
	pipReg2: pipelineReg2 port map(imm6_extended, imm9_extended, PC_current, Inst, en, clk,
        imm6_extended, imm9_extended, PC_current, Inst,
        Inst_11_9, Inst_8_6, Inst_5_3);
											 
------Operand Read------
											 
	st3: stage3 port map(clk, rd, wr, reset, Inst_11_9, Inst_8_6, mux10_out, mux11_out, d1, d2);
						
	pipReg3: pipelineReg3 port map(PC_current, Inst, imm6_extended_out_2, imm9_extended_out_2, en, clk, d1, d2, d1, d2, PC_current, Inst, imm6_extended_out_3, imm9_extended_out_3
        );
											 
------Execution------
											 
	st4: stage4 port map(d1, d2, PC_current, Inst, imm6_extended, imm9_extended, control(4), control(5), control(6), control(9), control(10), control(13), control(14), control(28), control(29), control(30), control(31), control(11), control(12), control(26), control(27), control(7), control(8), carry, zero, clk, mux8_out, d1, d2, Cc, Zc, ALU3_out_back, ALU1_out);
								
	pipReg4: pipelineReg4 port map(PC_current, Inst, en, clk, mux8_out_44, d1, PC_current, Inst, mux8_out, d1);
											 
------Memory Read/Write-----
					
	st5: stage5 port map(control(15), control(23), control(24), en, clk, mux8_out, d1, mux9_out);
								
	pipReg5: pipelineReg5 port map(PC_current, Inst, clk, en, mux9_out, mux9_out, PC_current, Inst_11_9, Inst_8_6, Inst_5_3
        );

------Write back------

	st6: stage6 port map(control(16), control(17), control(20), control(18), control(19), control(5), PC_current, Inst_11_9, Inst_8_6, Inst_5_3, mux10_out, mux11_out);
							
end architecture Struct;
