----------------------------------------------------------------------------------
-- 4 Bit adder TestBench
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Entity Decleration of 4 bit adder
entity adder is
port(	a, b  : in      std_logic_vector(3 downto 0);
        Cin   : in      std_logic;
        Cout  : out     std_logic;
	    Sum   : out     std_logic_vector(3 downto 0)
); 
end entity adder;

-- Architecture of 4 bit adder
architecture behavarioul of adder is
signal temp : std_logic_vector(4 downto 0);
begin
    temp <= ('0' & a) + ('0' & b) + ("0000" & cin);
    sum <= temp(3 downto 0);
    Cout <= temp(4);
end architecture behavarioul;
