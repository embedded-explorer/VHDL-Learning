----------------------------------------------------------------------------------
-- Full Adder
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        ai,bi,ci    : in    std_logic;
        s, co       : out   std_logic 
    );
end full_adder;

architecture Behavioral of full_adder is
begin
    s   <= ai xor bi xor ci;
    co  <= (ai and bi) or (bi and ci) or (ai and ci);
end Behavioral;