-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity comparator_tb is
end entity comparator_tb;

-- Architecture
architecture behavarioul of comparator_tb is

-- Component Declaration
component comparator
port(	A, B : in std_logic_vector(3 downto 0);
	Result : out std_logic
);
end component;

signal A, B : std_logic_vector(3 downto 0);
signal Result : std_logic;

begin
-- instantiate the component
uut : comparator PORT MAP(
	A 	=> A,
	B 	=> B,
	Result 	=> Result
);

-- Stimulus process
stim_proc: process
begin
	A <= "1100";	B <= "1000"; 	wait for 10 ns;
	A <= "1001";	B <= "1001"; 	wait for 10 ns;
	A <= "0011";	B <= "0011"; 	wait for 10 ns;
	A <= "0000";	B <= "1000"; 	wait for 10 ns;

    	--  Wait forever; this will finish the simulation.
    	wait;

end process;

end architecture behavarioul;
