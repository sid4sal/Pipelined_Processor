library ieee;
use ieee.std_logic_1164.all;
library work;

entity SE10 is

	port (BIT6_data: in std_logic_vector(5 downto 0);
			Y: out std_logic_vector(15 downto 0));
	end entity SE10;

architecture Struct of SE10 is

signal out_temp: std_logic_vector(15 downto 0);

begin

	out_temp(5 downto 0) <= BIT6_data;

	out_temp(15) <= out_temp(5);
	out_temp(14) <= out_temp(5);
	out_temp(13) <= out_temp(5);
	out_temp(12) <= out_temp(5);
	out_temp(11) <= out_temp(5);
	out_temp(10) <= out_temp(5);
	out_temp(9) <= out_temp(5);
	out_temp(8) <= out_temp(5);
	out_temp(7) <= out_temp(5);
	out_temp(6) <= out_temp(5);

-- BIT6_data = "110101"
-- Y = "1111111111010101"


	Y <= out_temp;

end architecture Struct;