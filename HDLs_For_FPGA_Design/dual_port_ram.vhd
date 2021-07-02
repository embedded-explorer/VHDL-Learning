----------------------------------------------------------------------------------
-- Simple Dual Port RAM
-- In simple dual port one port is used for writing and other is used for writing
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

entity dual_port_ram is
generic ( 
    dWidth          : integer   := 8;
    aWidth          : integer   := 4      -- 2**4 = 16 8 Bit wide memory locations
);
port (
    clk, we         : in    std_logic;
    d_in            : in    std_logic_vector (dWidth-1 downto 0);
    wAddr, rAddr    : in    std_logic_vector (aWidth-1 downto 0);
    d_out           : out   std_logic_vector (dWidth-1 downto 0)
);
end dual_port_ram;

architecture Behavioral of dual_port_ram is
-- define new type for 16x8 RAM
    type ram_type is array(0 to 2**aWidth) of std_logic_vector(dWidth-1 downto 0);
    
-- Function to read from the file to initialize RAM values
    impure function read_file(txt_file : in string) return ram_type is
        file ram_file : text open read_mode is txt_file;
        variable txt_line : line;
        variable txt_bit : bit_vector(dWidth-1 downto 0);
        variable txt_ram : ram_type;
        begin for i in ram_type 'range loop
            readline(ram_file, txt_line);
            read(txt_line, txt_bit);
            txt_ram(i) := to_stdlogicvector(txt_bit);
        end loop;
        return txt_ram;
    end function;
    
    signal ram : ram_type := read_file("initialRAM.txt");
    
begin
ram_proc : process (clk)
begin
    if (clk 'event and clk = '1') then
        if(we = '1') then
        -- Write input data into RAM 
            ram(to_integer(unsigned(wAddr))) <= d_in;  
        end if;
        d_out <= ram(to_integer(unsigned(rAddr)));
     end if;
end process ram_proc;
end Behavioral;
