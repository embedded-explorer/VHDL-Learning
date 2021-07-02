----------------------------------------------------------------------------------
-- Single Port RAM Testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity single_port_ram_tb is
end single_port_ram_tb;

architecture Behavioral of single_port_ram_tb is

-- Component Decleration
component single_port_ram is
Port ( 
    clk, we : in std_logic;
    addr    : in std_logic_vector(9 downto 0);
    d_in    : in std_logic_vector(7 downto 0);
    d_out   : out std_logic_vector(7 downto 0)
);
end component;

signal addr_tb      : std_logic_vector(9 downto 0) := (others => '0');
signal din_tb       : std_logic_vector(7 downto 0) := (others => '0');
signal we_tb        : std_logic := '0';
signal clk_tb       : std_logic := '0';
signal dout_tb      : std_logic_vector(7 downto 0);
constant clk_period : time := 10 ns;

begin

-- Instantiate single port ram
uut: single_port_ram port map (
    addr  => addr_tb,
    d_in  => din_tb,
    we    => we_tb,
    clk   => clk_tb,
    d_out => dout_tb
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
    we_tb <= '0'; addr_tb <= "0000000000"; din_tb <= x"FF";
    wait for 100 ns;
    
    -- start reading data from ram
    for i in 0 to 5 loop
        addr_tb <= addr_tb + "0000000001";
        wait for clk_period * 5;
    end loop;
    
    we_tb <= '1'; addr_tb <= "0000000000";
    wait for 100 ns;
    
    -- start writing to ram
    for i in 0 to 5 loop
        addr_tb <= addr_tb + "0000000001";
        din_tb <= din_tb - x"01";
        wait for clk_period * 5;
    end loop;
    
    we_tb <= '0';
end process;

end Behavioral;
