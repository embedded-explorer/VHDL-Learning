-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Decleration
entity shift_reg_tb is
end entity shift_reg_tb;

-- Architecture
architecture behavarioul of shift_reg_tb is

-- Component Declaration
component shift_reg
port(	d, clk, rst, shift : in std_logic;
	    q  : out std_logic_vector(3 downto 0)
); 
end component;

signal d, clk, rst, shift : std_logic;
signal q : std_logic_vector(3 downto 0);

begin
-- instantiate the component
uut : shift_reg PORT MAP(
	d      => d,
	clk    => clk,
	rst    => rst,
	shift  => shift,
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
    d <= '1'; rst <= '0'; shift <= '0';
    wait for 15 ns;
    d <= '1'; rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait for 20 ns;
    d <= '0', '1' after 20 ns;
    shift <= '1';
    d <= '0', '1' after 20 ns;
    d <= '0', '1' after 20 ns;

    --  Wait forever; this will finish the simulation.
    wait;
end process;

end architecture behavarioul;