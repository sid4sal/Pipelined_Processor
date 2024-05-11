library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_logic is
	port(inst: in std_logic_vector(15 downto 0);
	reset: in std_logic;
	Cp: in std_logic;
	Cc: in std_logic;
	Zp: in std_logic;
	Zc: in std_logic;
	control_final: out std_logic_vector(31 downto 0));


-- mux1(1,0): 00 : +1
-- mux1(1,0): 01 : ALU1
-- mux1(1,0): 10 : D2/RB
-- mux1(1,0): 11 : PC+2*imm

-- mux2(2): 0 : SE10
-- mux2(2): 1 : 2*SE10

-- mux3(4): 0 : D1
-- mux3(4): 1 : D2

-- mux4(5): 0 :imm6_ext
-- mux4(5): 1 : imm9_exte

-- mux5(6): 0 : PC
-- mux5(6): 1 : D1

-- mux6(9): 0 : d1
-- mux6(9): 1 : imm6_ext

-- mux7(10): 0 : d2
-- mux7(10): 1 : complement a or b

-- mux8(14,13): 00 : 
-- mux8(14,13): 01 : alu1
-- mux8(14,13): 10 : alu2
-- mux8(14,13): 11 : alu3


-- mux9(15) : 0 : mux8out
-- mux9(15) : 1 : data_from_memory

-- mux10(17,16): 00 : 
-- mux10(17,16): 01 : ra1 
-- mux10(17,16): 10 : ra2
-- mux10(17,16): 11 : ra3

-- mux11(20): 0 : mux9_out
-- mux11(20): 1 : adder_out


-- mux13(29,28): 00 : 
-- mux13(29,28): 01 : alu1carry
-- mux13(29,28): 10 : alu2carry
-- mux13(29,28): 11 : alu3carry

-- mux14(31,30): 00 : 
-- mux14(31,30): 01 : alu1zero
-- mux14(31,30): 10 : alu2zero
-- mux14(31,30): 11 : alu3zero



-- ALU1(12,11) : 00 : ADD
-- ALU1(12,11) : 01 : LLI
-- ALU1(12,11) : 10 : NAND
-- ALU1(12,11) : 11 : Subtract

-- ALU3(27,26) : 00 : add


-- ALU3(8,7) : 00 : add
-- ALU3(8,7) : 01 : LLI



-- mux12(3): 0 : SE7
-- mux12(3): 1 : 2*SE7

-- Register bank : 21: 1 : read 
--                 22: 1 : write


end entity controller_logic;

architecture controller of controller_logic is
	
	begin
		
		controller_process: process(inst, reset, carry, zero)
			
		variable control: std_logic_vector(31 downto 0) := (others => '0');
			
		begin
				
			if(inst(15 downto 12) = "0001" and inst(2 downto 0) = "000") then
				control := (others => '0');
				control(0) := '0';
				control(1) := '0';
                control(25) := '1';
                control(21) := '1';
                control(22) := '1';

				control(9) := '0';
				control(10) := '0';

				control(11) := '0';
				control(12) := '0';

				control(13) := '1';
				control(14) := '0';

				control(15) := '0';

				control(16) := '1';
				control(17) := '1';

				control(18) := '1';
				control(19) := '1';

				control(20) := '0';

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

			
			elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "010") then
				if(Cp = '1') then
					control := (others => '0');
					control(0) := '0';
					control(1) := '0';
					control(25) := '1';
					control(21) := '1';
					control(22) := '1';
	
					control(9) := '0';
					control(10) := '0';
	
					control(11) := '0';
					control(12) := '0';
	
					control(13) := '1';
					control(14) := '0';
	
					control(15) := '0';
	
					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';
	
					control(20) := '0';

					control(28) := '1';
					control(29) := '0';
	
					control(30) := '1';
					control(31) := '0';

				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';

				end if;
			

			elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "001") then
				if(Zp='1') then
				control := (others => '0');
				control(0) := '0';
				control(1) := '0';
                control(25) := '1';
                control(21) := '1';
                control(22) := '1';

				control(9) := '0';
				control(10) := '0';

				control(11) := '0';
				control(12) := '0';

				control(13) := '1';
				control(14) := '0';

				control(15) := '0';

				control(16) := '1';
				control(17) := '1';

				control(18) := '1';
				control(19) := '1';

				control(20) := '0';

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';


				else 
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';

				end if;
					

				elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "011") then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(9) := '0';
					control(10) := '0';

					
				control(11) := '0';
				control(12) := '0';

					control(13) := '0';
					control(14) := '1';

					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '0';
				control(29) := '1';

				control(30) := '0';
				control(31) := '1';

				control(15) := '0';
				control(20) := '0';


					


	
					
				elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "100") then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '0';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';

				control(20) := '0';


				
				elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "110") then
					if(Cp='1') then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '0';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';
				
				control(20) := '0';


					else
						control := (others => '0');
						control(18) := '0';
						control(19) := '0';
	
						control(25) := '1';
					end if;
						



				elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "101") then
					if(Zp='1') then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '0';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';
				
				control(20) := '0';

					else
						control := (others => '0');
						control(18) := '0';
						control(19) := '0';
	
						control(25) := '1';
					end if;
				
					

				elsif(inst(15 downto 12) = "0001" and inst(2 downto 0) = "111") then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
					control(4) := '1';

					control(9) := '0';
					control(10) := '1';

					
				control(11) := '0';
				control(12) := '0';

					control(13) := '0';
					control(14) := '1';

					control(16) := '1';
					control(17) := '1';

					control(18) := '1';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '0';
				control(29) := '1';

				control(30) := '0';
				control(31) := '1';

				control(15) := '0';
				control(20) := '0';


					
				elsif(inst(15 downto 12) = "0000") then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(2) := '0';
					control(21) := '1';
					control(22) := '1';

					control(5) := '0';
					control(6) := '1';

					control(7) := '0';
					control(8) := '0';

					control(13) := '1';
					control(14) := '1';

					control(18) := '1';
					control(19) := '1';

					control(28) := '1';
					control(29) := '1';
					control(30) := '1';
					control(31) := '1';

					control(15) := '0';
					control(16) := '0';
					control(17) := '1';
					control(20) := '0';




				
				elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "000") then
					control := (others => '0');
					control(0) := '0';
					control(1) := '0';
					control(25) := '1';
					control(21) := '1';
					control(22) := '1';
	
					control(9) := '0';
					control(10) := '0';
	
					control(11) := '0';
					control(12) := '1';
	
					control(13) := '1';
					control(14) := '0';
	
					control(15) := '0';
	
					control(16) := '1';
					control(17) := '1';
	
					control(18) := '0';
					control(19) := '1';
	
					control(20) := '0';
	
					control(28) := '1';
					control(29) := '0';
	
					control(30) := '1';
					control(31) := '0';

					
					
				elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "010") then
					if(Cp = '1') then
						control := (others => '0');
						control(0) := '0';
						control(1) := '0';
						control(25) := '1';
						control(21) := '1';
						control(22) := '1';
		
						control(9) := '0';
						control(10) := '0';
		
						control(11) := '0';
						control(12) := '1';
		
						control(13) := '1';
						control(14) := '0';
		
						control(15) := '0';
		
						control(16) := '1';
						control(17) := '1';
		
						control(18) := '0';
						control(19) := '1';
		
						control(20) := '0';
		
						control(28) := '1';
						control(29) := '0';
		
						control(30) := '1';
						control(31) := '0';
	
				
					else
						control := (others => '0');
						control(18) := '0';
						control(19) := '0';
	
						control(25) := '1';
	
					end if;
			
			elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "001") then
				if(Zp='1') then
					control := (others => '0');
					control(0) := '0';
					control(1) := '0';
					control(25) := '1';
					control(21) := '1';
					control(22) := '1';
	
					control(9) := '0';
					control(10) := '0';
	
					control(11) := '0';
					control(12) := '1';
	
					control(13) := '1';
					control(14) := '0';
	
					control(15) := '0';
	
					control(16) := '1';
					control(17) := '1';
	
					control(18) := '0';
					control(19) := '1';
	
					control(20) := '0';
	
					control(28) := '1';
					control(29) := '0';
	
					control(30) := '1';
					control(31) := '0';

			
				else 
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;



			elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "100") then
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '1';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '0';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';
				
				control(20) := '0';


					
			elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "110") then
				if(Cp='1') then	
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '1';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '0';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';
				
				control(20) := '0';

				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;
				



			elsif(inst(15 downto 12) = "0010" and inst(2 downto 0) = "101") then
				if(Zp='1') then	
					control := (others => '0');

					control(0) := '0';
					control(1) := '0';
					control(25) := '1';

					control(21) := '1';
					control(22) := '1';
	
					control(4) := '0';
					
					control(9) := '0';

					control(10) := '1';

					
				control(11) := '0';
				control(12) := '1';

					control(13) := '1';
					control(14) := '0';

					control(16) := '1';
					control(17) := '1';

					control(18) := '0';
					control(19) := '1';

					control(26) := '0';
					control(27) := '0';		

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				control(15) := '0';
				
				control(20) := '0';


				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;
				





			elsif(inst(15 downto 12) = "0011") then
				control := (others => '0');

				control(0) := '0';
				control(1) := '0';
				control(25) := '1';

				control(3) := '1';

				control(21) := '1';
				control(22) := '1';

				control(5) := '1';

				control(7) := '1';
				control(8) := '0';

				control(13) := '1';
				control(14) := '1';

				control(18) := '0';
				control(19) := '0';

				control(16) := '1';
				control(17) := '0';

				control(15) := '0';
				
				control(20) := '0';

				
				
			elsif(inst(15 downto 12) = "0100") then
				control := (others => '0');
				control(0) := '0';
				control(1) := '0';
				control(25) := '1';

				control(2) := '0';
				control(21) := '1';
				control(22) := '1';

				control(9) := '1';

				control(10) := '0';
				
				control(11) := '0';
				control(12) := '1';

				control(13) := '1';
				control(14) := '0';
				
				control(28) := '1';
				control(29) := '0';
				control(30) := '1';
				control(31) := '0';

				control(18) := '0';
				control(19) := '1';

				control(15) := '1';

				control(23) := '1';
				control(24) := '0';

				control(16) := '1';
				control(17) := '0';





				
			elsif(inst(15 downto 12) = "0101") then
				control := (others => '0');
				control(0) := '0';
				control(1) := '0';
				control(25) := '1';

				control(2) := '0';
				control(21) := '1';
				control(22) := '0';

				control(9) := '1';

				control(10) := '0';
				
				control(11) := '0';
				control(12) := '1';

				control(13) := '1';
				control(14) := '0';
				


				control(18) := '0';
				control(19) := '0';


				control(23) := '0';
				control(24) := '1';

				
			elsif(inst(15 downto 12) = "1000") then
				control := (others => '0');

				control(2) := '0';
				control(5) := '0';
				control(6) := '0';
                control(25) := '1';
                control(21) := '1';
                control(22) := '0';

				control(9) := '0';
				control(10) := '0';

				control(11) := '1';
				control(12) := '1';

				control(13) := '1';
				control(14) := '0';

				control(15) := '0';

				control(16) := '1';
				control(17) := '1';

				control(18) := '0';
				control(19) := '0';

				control(20) := '0';

				control(28) := '0';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				if(Zc='1') then

					control(0) := '1';
					control(1) := '1';


				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;

				

			elsif(inst(15 downto 12) = "1001") then
				control := (others => '0');

				control(2) := '0';
				control(5) := '0';
				control(6) := '0';
                control(25) := '1';
                control(21) := '1';
                control(22) := '0';

				control(9) := '0';
				control(10) := '0';

				control(11) := '1';
				control(12) := '1';

				control(13) := '1';
				control(14) := '0';

				control(15) := '0';

				control(16) := '1';
				control(17) := '1';

				control(18) := '0';
				control(19) := '0';

				control(20) := '0';

				control(28) := '1';
				control(29) := '0';

				control(30) := '0';
				control(31) := '0';

				if(Cc='1') then

					control(0) := '1';
					control(1) := '1';


				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;

				



			elsif(inst(15 downto 12) = "1010") then
				control := (others => '0');

				control(2) := '0';
				control(5) := '0';
				control(6) := '0';
                control(25) := '1';
                control(21) := '1';
                control(22) := '0';

				control(9) := '0';
				control(10) := '0';

				control(11) := '1';
				control(12) := '1';

				control(13) := '1';
				control(14) := '0';

				control(15) := '0';

				control(16) := '1';
				control(17) := '1';

				control(18) := '0';
				control(19) := '0';

				control(20) := '0';

				control(28) := '1';
				control(29) := '0';

				control(30) := '1';
				control(31) := '0';

				if(Zc='1' or Cc='1') then

					control(0) := '1';
					control(1) := '1';


				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;





			elsif(inst(15 downto 12) = "1100") then
				control := (others => '0');

				control(0) := '1';
				control(1) := '1';
                control(25) := '1';

                control(3) := '1';
                
				control(21) := '0';
                control(22) := '1';

                control(5) := '1';
                control(6) := '0';

                control(7) := '0';
                control(8) := '0';

                control(20) := '1';
                control(16) := '1';
                control(17) := '0';

                control(18) := '0';
                control(19) := '0';






				
			elsif(inst(15 downto 12) = "1101") then
				control := (others => '0');

				control(0) := '0';
				control(1) := '1';
                control(25) := '1';

                control(3) := '0';
                
				control(21) := '0';
                control(22) := '1';

                control(5) := '0';
                control(6) := '0';

                control(7) := '0';
                control(8) := '0';

                control(20) := '1';
                control(16) := '1';
                control(17) := '0';

                control(18) := '0';
                control(19) := '0';

				

			elsif(inst(15 downto 12) = "1111") then
				control := (others => '0');

				control(0) := '1';
				control(1) := '1';
                control(25) := '1';

                control(3) := '1';
                
				control(21) := '1';
                control(22) := '0';

                control(5) := '1';
                control(6) := '1';

                control(7) := '0';
                control(8) := '0';





				
			else
				if(reset = '1') then
					control := (others => '0');
				else
					control := (others => '0');
					control(18) := '0';
					control(19) := '0';

					control(25) := '1';
				end if;
			end if;
		
				
			control_final <= control;
				
			end process controller_process;

end controller;