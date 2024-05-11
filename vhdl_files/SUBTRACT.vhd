
library ieee;
use ieee.std_logic_1164.all;

entity SUBTRACT is
    port (
        A, B: in std_logic_vector(15 downto 0);
        Y: out std_logic_vector(15 downto 0);
        C_sub: out std_logic
    );
end entity SUBTRACT;

architecture Struct of SUBTRACT is
    component ADD_4BIT is
        port (
            A, B: in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Y: out std_logic_vector(3 downto 0);
            C_out: out std_logic
        );
    end component ADD_4BIT;

    signal B_ones_complement: std_logic_vector(15 downto 0);
    signal Z: std_logic_vector(15 downto 0);
    signal C: std_logic_vector(7 downto 0);
    signal C_X: std_logic;
	signal K : std_logic_vector(15 downto 0) := (others => '0');

begin
    -- Compute two's complement of B
    B_ones_complement <= not B;

    -- Perform addition using modified B (two's complement)
    Adder1: ADD_4BIT port map(A(3 downto 0), B_ones_complement(3 downto 0), '0', Z(3 downto 0), C(0));
    Adder2: ADD_4BIT port map(A(7 downto 4), B_ones_complement(7 downto 4), C(0), Z(7 downto 4), C(1));
    Adder3: ADD_4BIT port map(A(11 downto 8), B_ones_complement(11 downto 8), C(1), Z(11 downto 8), C(2));
    Adder4: ADD_4BIT port map(A(15 downto 12), B_ones_complement(15 downto 12), C(2), Z(15 downto 12), C_X);



    Adder5: ADD_4BIT port map(Z(3 downto 0), K(3 downto 0), C_X, Y(3 downto 0), C(3));
    Adder6: ADD_4BIT port map(Z(7 downto 4), K(7 downto 4), C(3), Y(7 downto 4), C(4));
    Adder7: ADD_4BIT port map(Z(11 downto 8), K(11 downto 8), C(4), Y(11 downto 8), C(5));
    Adder8: ADD_4BIT port map(Z(15 downto 12), K(15 downto 12), C(5), Y(15 downto 12), C_out);


    -- Output carry of the final adder is the borrow for subtraction
    C_sub <= C_out;
end architecture Struct;
