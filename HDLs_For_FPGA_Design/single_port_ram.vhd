----------------------------------------------------------------------------------
-- Single Port RAM
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- 32x8 single port RAM
entity single_port_ram is
Port ( 
    clk, we : in std_logic;
    addr    : in std_logic_vector(9 downto 0);
    d_in    : in std_logic_vector(7 downto 0);
    d_out   : out std_logic_vector(7 downto 0)
);
end single_port_ram;

architecture Behavioral of single_port_ram is
-- define new type for 1024x8 RAM
type ram_array is array(0 to 1023) of std_logic_vector(7 downto 0);
signal ram: ram_array;

begin
ram_proc : process(clk)
begin
    if(clk 'event and clk = '1') then
        if(we = '1') then
        -- write input data into ram location provided by address
        ram(to_integer(unsigned(addr))) <= d_in;
        end if;
        -- synchronous read
--        d_out <= ram(to_integer(unsigned(addr)));
    end if;
end process;
-- asynchronous read
 d_out <= ram(to_integer(unsigned(addr)));
end Behavioral;
