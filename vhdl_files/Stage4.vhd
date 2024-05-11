--Stage 4
library ieee;
use ieee.std_logic_1164.all;           

entity stage4 is 
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
end entity stage4;

architecture struct of stage4 is
	




    component mux4to1_16bits is
        port(
             S1,S0: in std_logic;
             D0,D1,D2,D3: in std_logic_vector(15 downto 0);
             Y: out std_logic_vector(15 downto 0)
         );
     end component mux4to1_16bits;
	

	component mux2to1_16bits is
		port(
			S0: in std_logic;
			D0,D1: in std_logic_vector(15 downto 0);
			Y: out std_logic_vector(15 downto 0)
		);
	end component mux2to1_16bits;
	
    component mux4to1_1bit is
        port(S1,S0: in std_logic;
             D0,D1,D2,D3: in std_logic;
             Y: out std_logic);
     end component mux4to1_1bit;
       

	component ALU is
	port(ALU_A, ALU_B: in std_logic_vector(15 downto 0);
		  C1: in std_logic; C0: in std_logic;  Cin: in std_logic;  Zin: in std_logic;
		  ALU_C: out std_logic_vector(15 downto 0);
		  C: out std_logic; Z: out std_logic);
	end component ALU;
 
 
   component Complementer is
	port(rf_d2: in std_logic_vector(15 downto 0);
		  complement: out std_logic_vector(15 downto 0));
	end component Complementer;
	
	
	component bitReg is 
	port(d: in std_logic;
		  en: in std_logic;
		  clk: in std_logic;
		  q: out std_logic);
	end component bitReg;
	
    component zero_Appender_Carry is

        port (C: in std_logic;
               Y: out std_logic_vector(15 downto 0));
    end component zero_Appender_Carry;
        

	
	signal mux3_out_sig, mux3_out_sig_comp,  mux4_out_sig, mux5_out_sig , mux6_out_sig, mux7_out_sig, ALU1_out_sig, ALU2_out_sig, ALU3_out_sig, carry_ALU1_out_sig, zero_ALU1_out_sig, carry_ALU2_out_sig, zero_ALU2_out_sig, carry_append_sig, carry_ALU3_out_sig, zero_ALU3_out_sig, empty_for_mux8 : std_logic_vector(15 downto 0);





	begin

    empty_for_mux8 <= Inst_out_3

    mux3 : mux2to1_16bits;
    port( mux3_control4, d1_out_3, d1_out_3, mux3_out_sig);


    mux4 : mux2to1_16bits;
    port( mux4_control5, imm6_extended_out_3, imm9_extended_out_3, mux4_out_sig);

    mux5 : mux2to1_16bits;
    port( mux5_control6, PC_out_3, d1_out_3, mux5_out_sig);

    mux6 : mux2to1_16bits;
    port(mux6_control9, d1_out_3, imm6_extended_out_3, mux6_out_sig);

    complement_block : Complementer
    port(mux3_out_sig, mux3_out_sig_comp);

    mux7 : mux2to1_16bits;
    port( mux7_control10, mux3_out_sig_comp, d2_out_3, mux7_out_sig);

    zero_appender : zero_Appender_Carry
    port(carry, carry_append_sig);


    ALU1 : ALU;
    port map(mux6_out_sig, mux7_out_sig, ALU1_control11, ALU1_control12, carry, zero, ALU1_out_sig, carry_ALU1_out_sig, zero_ALU1_out_sig);

    ALU2 : ALU;
    port map(carry_append_sig, ALU1_out_sig, ALU2_control26, ALU2_control27, carry, zero, ALU2_out_sig, carry_ALU2_out_sig, zero_ALU2_out_sig);

    ALU3 : ALU;
    port map(mux4_out_sig, mux5_out_sig, ALU3_control7, ALU3_control8, carry, zero, ALU3_out_sig, carry_ALU3_out_sig, zero_ALU3_out_sig);

    mux8 : mux4to1_16bits;
    port( mux8_control13,mux8_control14, ALU1_out_sig, ALU2_out_sig, ALU3_out_sig, empty_for_mux8, mux8_out);

    mux13 : mux4to1_1bit;
    port( mux13_control28, mux13_control29, carry_ALU1_out_sig, carry_ALU2_out_sig, carry_ALU3_out_sig,  mux13_out);

    mux14 : mux4to1_1bit;
    port( mux14_control30, mux14_control31, zero_ALU1_out_sig, zero_ALU2_out_sig, zero_ALU3_out_sig,  mux14_out);



    mux8_out <= mux8_out_sig;
    d1_out_44 <= d1_out_3;
    ALU3_out_back <= ALU3_out_sig;
    ALU1_out <= ALU1_out_sig;
    d2_out_44 <= d2_out_3;
    Cc <= mux13_out;
    Zc <= mux14_out;
end architecture struct;
		  
