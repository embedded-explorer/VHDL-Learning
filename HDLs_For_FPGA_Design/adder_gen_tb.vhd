----------------------------------------------------------------------------------
-- 4 Bit adder TestBench
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

-- Entity Decleration
entity adder_gen_tb is
end entity adder_gen_tb;

-- Architecture
architecture behavarioul of adder_gen_tb is

-- Component Declaration
component adder_inst
port(	a, b  : in      std_logic_vector(3 downto 0);
        cin   : in      std_logic;
        cout  : out     std_logic;
	    sum   : out     std_logic_vector(3 downto 0)
); 
end component;

-- Testbench signals
signal a_tb, b_tb   : std_logic_vector(3 downto 0);
signal cin_tb       : std_logic;
signal cout_tb      : std_logic;
signal sum_tb       : std_logic_vector(3 downto 0);

begin
-- instantiate the DUT
dut : adder_inst PORT MAP(
	a      => a_tb,
	b      => b_tb,
	cin    => cin_tb,
	cout   => cout_tb,
	sum    => sum_tb
);

---- stimulus using loop, generates good coverage
stim_proc: process
variable i, j, k : integer;
variable str_o : line;
begin
    for i in 0 to 15 loop
        a_tb <= std_logic_vector(to_unsigned(i, 4));
        for j in 0 to 15 loop
            b_tb <= std_logic_vector(to_unsigned(j, 4));
            for k in 0 to 1 loop
                cin_tb <= std_logic(to_unsigned(k, 1)(0));
                wait for 10 ns;
            end loop;
        end loop;
    end loop;
    wait;     
end process stim_proc;
end architecture behavarioul;