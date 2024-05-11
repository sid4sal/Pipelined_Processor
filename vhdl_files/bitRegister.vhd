library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity bitReg is 
	port(d: in std_logic;
		  en: in std_logic;
		  clk: in std_logic;
		  q: out std_logic);
end entity bitReg;

architecture struct of bitReg is

begin

    dff_proc: process(clk)
	 
    begin
	 
        if rising_edge(clk) then
            if en = '1' then
                q <= d;
            end if;
        end if;
		  
    end process dff_proc;
	 
end architecture struct;


-- This VHDL code defines a simple D flip-flop (DFF) with an enable signal (`en`). Here's a breakdown of what it does:

-- - Entity `bitReg` declares the input and output ports:
--   - `d`: input data signal
--   - `en`: enable signal
--   - `clk`: clock signal
--   - `q`: output data signal

-- - Architecture `struct` contains a process (`dff_proc`) sensitive to the rising edge of the clock signal (`clk`).
--   - Inside the process, it checks if there's a rising edge of the clock (`rising_edge(clk)`).
--   - If there's a rising edge of the clock and the enable signal (`en`) is asserted (`'1'`), it assigns the value of input data signal (`d`) to the output data signal (`q`). This effectively captures the input data (`d`) into the flip-flop when the enable signal is high.

-- In summary, this code describes a simple D flip-flop with an enable signal. The flip-flop captures the input data (`d`) and stores it in the output (`q`) on the rising edge of the clock (`clk`) when the enable signal (`en`) is asserted.