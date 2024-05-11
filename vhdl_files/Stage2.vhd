--Stage2
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity stage2 is
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


    control_signal: out std_logic_vector(31 downto 0);
	imm6_extended: out std_logic_vector(15 downto 0);
	imm9_extended: out std_logic_vector(15 downto 0);
    PC_out_22: out std_logic_vector(15 downto 0);
	Inst_out_22: out std_logic_vector(15 downto 0);

    )    

end entity stage2;	

architecture control_stage of stage2 is

	signal control_wait: std_logic_vector(27 downto 0);

    signal bit_6_imm : std_logic_vector(5 downto 0);
    signal bit_9_imm : std_logic_vector(8 downto 0);
    signal SE10_out : std_logic_vector(15 downto 0);
    signal SE10_out_mul : std_logic_vector(15 downto 0);
    signal SE7_out : std_logic_vector(15 downto 0);
    signal SE7_out_mul : std_logic_vector(15 downto 0);
    signal mux2_out : std_logic_vector(15 downto 0);
    signal mux12_out : std_logic_vector(15 downto 0);


	
	component controller_logic is
		port(Inst_out_1: in std_logic_vector(15 downto 0);
		reset: in std_logic;
		carry: in std_logic;
		zero: in std_logic;
		control_final: out std_logic_vector(27 downto 0));
	end component controller_logic;
	


    component mux2to1_16bits is

        port(S0: in std_logic;
         D0,D1: in std_logic_vector(15 downto 0);
         Y: out std_logic_vector(15 downto 0));
         
     end component mux2to1_16bits;



	component SE10 is

        port (BIT6_data: in std_logic_vector(5 downto 0);
              Y: out std_logic_vector(15 downto 0));

    end component SE10;


        
	component SE7 is

        port (BIT6_data: in std_logic_vector(9 downto 0);
              Y: out std_logic_vector(15 downto 0));

    end component SE7;



	begin

        bit_6_imm <= Inst_out_1(5 downto 0);
        bit_9_imm <= Inst_out_1(8 downto 0);

        SE10_extender : SE10
        port map(bit_6_imm, SE10_out);
        
        SE7_extender : SE7
        port map(bit_9_imm, SE7_out);

        SE10_out_mul <= SE10_out + SE10_out;
        SE7_out_mul <= SE7_out + SE7_out;


		mux2: mux2to1_16bits
			port map(mux2_control_0, SE10_out, SE10_out_mul, mux2_out);

		mux12: mux2to1_16bits
			port map(mux3_control_0, SE7_out, SE7_out_mul, mux12_out);

            imm6_extended <= mux2_out;
            imm9_extended <= mux12_out;




		
		Controller : controller_logic
			port map(Inst_out_1, reset, carry, zero, control_wait);
			
            control_signal <= control_wait
            PC_out_22 <= PC_out_1
            Inst_out_22 <= Inst_out_1


end control_stage;
