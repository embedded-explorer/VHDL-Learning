----------------------------------------------------------------------------------
-- D Flip Flop
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Decleration
entity d_ff is
    Port (d, clk, rst : in std_logic;
          q           : out std_logic    );
end d_ff;

-- architecture
architecture Behavioral of d_ff is
begin
    process(clk)
    begin
        if (clk 'event and clk = '1') then  -- raising_edge(clk)
            if(rst = '1') then
                q <= '0';                   -- sync reset
            else
                q <= d;
            end if;
        end if;
    end process;
end Behavioral;