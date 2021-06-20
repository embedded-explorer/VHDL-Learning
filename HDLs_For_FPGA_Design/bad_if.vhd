----------------------------------------------------------------------------------
-- Example to describe inherited latch
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Decleration
entity bad_if is
    Port (A, B, C, D : in std_logic;
          Y          : out std_logic    );
end bad_if;

-- architecture
architecture Behavioral of bad_if is
begin
    comb_process : process(A, B, C, D)
    begin
        if      ((C = '1') and (D = '1')) then Y <= '0';
        elsif   ((A = '1') or  (B = '1')) then Y <= '1';
        end if;
    end process comb_process;
end Behavioral;