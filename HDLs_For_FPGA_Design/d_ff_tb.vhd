-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity d_ff_tb is
end entity d_ff_tb;

-- Architecture
architecture behavarioul of d_ff_tb is

-- Component Declaration
component d_ff
port(	d, clk, rst : in std_logic;
	    q           : out std_logic
); 
end component;

signal d, clk, rst : std_logic;
signal q : std_logic;

begin
-- instantiate the component
uut : d_ff PORT MAP(
	d      => d,
	clk    => clk,
	rst    => rst,
	q      => q
);

-- Clock process
clock_proc: process
begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
end process;

-- Stimulus process
stim_proc: process
begin
    d <= '1'; rst <= '0';
    wait for 15 ns;
    d <= '1'; rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait for 20 ns;
    d <= '0';

    --  Wait forever; this will finish the simulation.
    wait;
end process;

end architecture behavarioul;