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
entity adder_tb is
end entity adder_tb;

-- Architecture
architecture behavarioul of adder_tb is

-- Component Declaration
component adder
port(	a, b  : in      std_logic_vector(3 downto 0);
        Cin   : in      std_logic;
        Cout  : out     std_logic;
	    Sum   : out     std_logic_vector(3 downto 0)
); 
end component;

-- Testbench signals
signal a_tb, b_tb   : std_logic_vector(3 downto 0);
signal cin_tb       : std_logic;
signal cout_tb      : std_logic;
signal sum_tb       : std_logic_vector(3 downto 0);
signal expect       : std_logic_vector(3 downto 0);

begin
-- instantiate the DUT
dut : adder PORT MAP(
	a      => a_tb,
	b      => b_tb,
	Cin    => cin_tb,
	Cout   => cout_tb,
	Sum    => sum_tb
);

---- Stimulus process, Hand drawn waves, poor coverage
--stim_proc: process
--begin
--    wait for 0 ns;
--    a_tb <= "0010"; b_tb <= "0010"; cin_tb <= '0'; expect <= "0100";
--    wait for 10 ns;
--    a_tb <= "1111"; b_tb <= "0000"; cin_tb <= '1'; expect <= "0000";
--    wait for 10 ns;
--    a_tb <= "0010"; b_tb <= "0100"; cin_tb <= '1'; expect <= "0111";
    
--    --  Wait forever; this will finish the simulation.
--    wait;
--end process stim_proc;

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
                expect <= std_logic_vector(unsigned(a_tb) + unsigned(b_tb) + ('0' & cin_tb));
            end loop;
        end loop;
    end loop;     
    if (sum_tb /= std_logic_vector(unsigned(a_tb) + unsigned(b_tb) + ('0' & cin_tb))) then
        write(str_o, string'("Error - Sum"));
        writeline(output, str_o);
        wait;
    end if;       
end process stim_proc;

-- Monitor
--txt_out : process(sum_tb, cout_tb)
--variable str_o : line;
--begin
--    write(str_o, string'("a="));  write(str_o, a_tb);
--    write(str_o, string'("b="));  write(str_o, b_tb);
--    write(str_o, string'("cin="));  write(str_o, cin_tb);
--    write(str_o, string'("sum="));  write(str_o, sum_tb);
--    write(str_o, string'("cout="));  write(str_o, cout_tb);
--    write(str_o, string'("expect="));  write(str_o, expect);
--    assert false report time'image(now) & str_o.all
--        severity note; 
--end process txt_out;
end architecture behavarioul;