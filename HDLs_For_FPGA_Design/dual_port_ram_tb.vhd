----------------------------------------------------------------------------------
-- Dual Port RAM Test bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity dual_port_ram_tb is
end dual_port_ram_tb;

architecture Behavioral of dual_port_ram_tb is
component dual_port_ram is
generic ( 
    dWidth          : integer   := 8;
    aWidth          : integer   := 4
);
port (
    clk, we         : in    std_logic;
    d_in            : in    std_logic_vector (dWidth-1 downto 0);
    wAddr, rAddr    : in    std_logic_vector (aWidth-1 downto 0);
    d_out           : out   std_logic_vector (dWidth-1 downto 0)
);
end component;

constant DATAWIDTH  : integer := 8;
constant ADDRWIDTH  : integer := 4;
constant clk_period : time := 10ns;

signal clk_tb, we_tb        : std_logic;
signal din_tb, dout_tb      : std_logic_vector (DATAWIDTH-1 downto 0);
signal wAddr_tb, rAddr_tb   : std_logic_vector (ADDRWIDTH-1 downto 0);

begin
uut : dual_port_ram port map(
    clk     => clk_tb,
    we      => we_tb,
    d_in    => din_tb,
    d_out   => dout_tb,
    wAddr   => wAddr_tb,
    rAddr   => rAddr_tb
);

-- clock process
clk_proc : process
    begin
    clk_tb <= '0';
    wait for clk_period / 2;
    clk_tb <= '1';
    wait for clk_period / 2;
end process;

stim_proc : process
begin

    we_tb <= '0';
    wait for 20 ns;
    for i in 1 to 16 loop
        rAddr_tb <= std_logic_vector(to_unsigned((i-1), 4));
        wait for 10 ns;
    end loop;
    
    we_tb <= '1';
    wait for 20 ns;
    for i in 1 to 16 loop
        wAddr_tb <= std_logic_vector(to_unsigned((i-1), 4));
        din_tb   <= std_logic_vector(to_unsigned(i, 8));
        wait for 10 ns;
    end loop;
    
    we_tb <= '0';
    wait for 20 ns;
    for i in 1 to 16 loop
        rAddr_tb <= std_logic_vector(to_unsigned((i-1), 4));
        wait for 10 ns;
    end loop;
    
    wait;
end process;
end Behavioral;
