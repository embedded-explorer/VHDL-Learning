----------------------------------------------------------------------------------
-- Serial in Prallel out Shift Register Example
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Decleration
entity shift_reg is
    Port (d, clk, rst, shift : in std_logic;
          q     : out std_logic_vector(3 downto 0)    
    );
end shift_reg;

-- architecture
architecture Behavioral of shift_reg is
    signal temp : std_logic_vector(3 downto 0);
begin
    q <= temp;
    
    sipo_proc : process(clk, rst, shift)
    begin
        if (rst = '1') then
            temp <= "0000";
        elsif (clk 'event and clk = '1') then
            if (shift = '1') then
                --temp(0) <= d;
                --temp(1) <= temp(0);
                --temp(2) <= temp(1);
                --temp(3) <= temp(2);
                
                temp <= temp(2 downto 0) & d;
                
            end if;
        end if;
    end process sipo_proc; 
end Behavioral;