-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity bad_if_tb is
end entity bad_if_tb;

-- Architecture
architecture behavarioul of bad_if_tb is

-- Component Declaration
component bad_if
port(	A, B, C, D : in std_logic;
	    Y : out std_logic
);
end component;

signal A, B, C, D : std_logic;
signal temp : std_logic_vector(3 downto 0);
signal Y : std_logic;

begin
-- instantiate the component
uut : bad_if PORT MAP(
	A  => A,
	B  => B,
	C  => C,
	D  => D,
	Y  => Y
);

-- Stimulus process
stim_proc: process
begin
    for i in 0 to 15 loop
        temp <= std_logic_vector (to_unsigned(i, 4));
        A <= temp(0);
        B <= temp(1);
        C <= temp(2);
        D <= temp(3);
        wait for 10 ns;
    end loop;

    --  Wait forever; this will finish the simulation.
    wait;

end process;

end architecture behavarioul;