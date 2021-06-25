----------------------------------------------------------------------------------
-- Binary Counter
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity Decleration
entity counter is
    Port (  clk, rst, load, en : in std_logic;
            d : in std_logic_vector(3 downto 0);
            q : out std_logic_vector(3 downto 0)    
    );
end counter;

-- architecture
architecture Behavioral of counter is
    signal temp : std_logic_vector(3 downto 0);
begin
    q <= temp;
    
    count_proc : process(clk, rst, load, en)
    begin
        if (rst = '1') then
            temp <= "0000";
        elsif (clk 'event and clk = '1') then
            if (load = '1') then
                temp <= d;
            elsif (en = '1') then
                temp <= std_logic_vector(unsigned(temp) + 1);     -- vivado is unable to overload +
            end if;                                               -- fixed by adding IEEE.numeric_std.all
        end if;
    end process count_proc; 
end Behavioral;