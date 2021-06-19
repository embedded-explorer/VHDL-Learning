-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity multiplexer_tb is
end entity multiplexer_tb;

-- Architecture
architecture behavarioul of multiplexer_tb is

-- Component Declaration
component multiplexer
port(	D : in std_logic_vector(3 downto 0);
	S : in std_logic_vector(1 downto 0);
	Y : out std_logic
);
end component;

signal D : std_logic_vector(3 downto 0);
signal S : std_logic_vector(1 downto 0);
signal Y : std_logic;

begin
-- instantiate the component
uut : multiplexer PORT MAP(
	D 	=> D,
	S 	=> S,
	Y 	=> Y
);

-- Stimulus process
stim_proc: process
begin
	D <= "1010";	
	S <= "00"; 	wait for 10 ns;
	S <= "01"; 	wait for 10 ns;
	S <= "10"; 	wait for 10 ns;
	S <= "11"; 	wait for 10 ns;

    	--  Wait forever; this will finish the simulation.
    	wait;

end process;

end architecture behavarioul;
