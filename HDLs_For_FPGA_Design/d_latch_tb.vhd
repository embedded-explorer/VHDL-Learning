-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity d_latch_tb is
end entity d_latch_tb;

-- Architecture
architecture behavarioul of d_latch_tb is

-- Component Declaration
component d_latch
port(	d, en, clr : in std_logic;
	    q          : out std_logic
);
end component;

signal d, en, clr : std_logic;
signal q : std_logic;

begin
-- instantiate the component
uut : d_latch PORT MAP(
	d      => d,
	clr    => clr,
	en     => en,
	q      => q
);

-- Stimulus process
stim_proc: process
begin
    d <= '0'; en <= '0'; clr <= '1';
    wait for 20 ns;
    d <= '1';
    wait for 20 ns;
    en <= '1';
    wait for 20 ns;
    d <= '0'; en <= '0'; clr <= '0';
    wait for 20 ns;
    d <= '1';
    wait for 20 ns;
    en <= '1';
    wait for 20 ns;
    d <= '0', '1' after 20 ns;

    --  Wait forever; this will finish the simulation.
    wait;
end process;

end architecture behavarioul;