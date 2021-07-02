----------------------------------------------------------------------------------
-- ROM Memory
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom is
generic(
    dWidth  : integer := 8;
    aWidth  : integer := 3 -- 2**3 = 8 address
);
Port ( 
    addr    : in    std_logic_vector(aWidth-1 downto 0);
    data    : out   std_logic_vector(dWidth-1 downto 0)
);
end rom;

architecture Behavioral of rom is
begin

    lookup_proc : process
    begin
        case(addr) is
            when "000" => data <= "10000000";
            when "001" => data <= "01000000";
            when "010" => data <= "00100000";
            when "011" => data <= "00010000";
            when "100" => data <= "00001000";
            when "101" => data <= "00000100";
            when "110" => data <= "00000010";
            when "111" => data <= "00000001";
            when others => data <= "00000000";
        end case;
    end process lookup_proc;
    
end Behavioral;
