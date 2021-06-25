----------------------------------------------------------------------------------
-- Register File
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity Decleration
entity reg_file is
    generic(
        dWidth  : integer := 8;
        aWidth  : integer := 2
    );
    Port(
        clk, wren       : in    std_logic;
        wData           : in    std_logic_vector    (dWidth-1 downto 0);
        wAddr, rAddr    : in    std_logic_vector    (aWidth-1 downto 0);
        rData           : out   std_logic_vector    (dWidth-1 downto 0)
    );
end entity reg_file;

-- Architecture
architecture Behavioral of reg_file is
    type registerFile is array(0 to 2**aWidth-1) of std_logic_vector (dWidth-1 downto 0);
    signal registers : registerFile;
begin
    proc : process(clk, wren, wData, wAddr, rAddr)
    begin
        if (rising_edge(clk)) then
            if(wren = '1')  then
                registers(to_integer(unsigned(wAddr))) <= wData;
            else
                rData <= registers(to_integer(unsigned(rAddr)));
            end if;
        end if;
    end process proc; 
end Behavioral;