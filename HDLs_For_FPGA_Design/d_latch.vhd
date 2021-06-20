----------------------------------------------------------------------------------
-- D Latch
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Decleration
entity d_latch is
    Port (d, en, clr : in std_logic;
          q          : out std_logic    );
end d_latch;

-- architecture
architecture Behavioral of d_latch is
begin
    process(d, en, clr)
    begin
        if      (clr = '1') then q <= '0';
        elsif   (en  = '1') then q <= d;
        end if;
    end process;
end Behavioral;