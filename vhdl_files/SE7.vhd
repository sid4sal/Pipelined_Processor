library ieee;
use ieee.std_logic_1164.all;
library work;

entity SE7 is

port (BIT9_data: in std_logic_vector(8 downto 0);
	   Y: out std_logic_vector(15 downto 0));
end entity SE7;

architecture Struct of SE7 is

signal out_temp: std_logic_vector(15 downto 0) := (others => '0');

begin

	out_temp(8 downto 0) <= BIT9_data;

	out_temp(15) <= out_temp(8);
	out_temp(14) <= out_temp(8);
	out_temp(13) <= out_temp(8);
	out_temp(12) <= out_temp(8);
	out_temp(11) <= out_temp(8);
	out_temp(10) <= out_temp(8);
	out_temp(9) <= out_temp(8);
	Y <= out_temp;

end architecture Struct;