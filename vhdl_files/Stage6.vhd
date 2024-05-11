--Stage 6
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;


entity stage6 is
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


end entity stage6;

architecture Struct of stage6 is

component mux2to1_16bits is
   port(S0: in std_logic;
		  D0, D1: in std_logic_vector(15 downto 0);
		  Y: out std_logic_vector(15 downto 0));
end component mux2to1_16bits;


component mux4to1_3bits is

    port(
         S1,S0: in std_logic;
         D0,D1,D2,D3: in std_logic_vector(2 downto 0);
         Y: out std_logic_vector(2 downto 0);
     );
 end component mux4to1_3bits;

 component ADD is
	port(A, B: in std_logic_vector(15 downto 0);
		  Y: out std_logic_vector(15 downto 0); C_add: out std_logic);
	end component ADD;
	

	begin

signal empty_for_mux10 : std_logic_vector(2 downto 0) := "000";
signal positive_two : std_logic_vector(15 downto 0) := "0000000000000010";
signal Adder2_out_sig : std_logic_vector(15 downto 0);
signal carry_adder2 : std_logic;


	mux10: mux4to1_3bits
     port map(mux10_control16, mux10_control17, Inst_11_9, Inst_8_6,Inst_5_3, empty_for_mux10, mux10_out );			

     Adder2 : ADD
     port map(PC_out_5, positive_two, Adder2_out_sig, carry_adder2);

     mux11: mux2to1_16bits
     port map(mux11_control20, Adder2_out_sig, mux9_out_5, mux11_out );			


end architecture Struct;
