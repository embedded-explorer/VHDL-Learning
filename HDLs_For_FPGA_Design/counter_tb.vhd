-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

-- Entity Decleration
entity counter_tb is
end entity counter_tb;

-- Architecture
architecture behavarioul of counter_tb is

-- Component Declaration
component counter
port(	clk, rst, load, en : in std_logic;
        d : in std_logic_vector(3 downto 0);
	    q  : out std_logic_vector(3 downto 0)
); 
end component;

constant    delay   : integer                       := 10;      -- wait
constant    n       : integer                       := 4;       -- width counter
constant    t       : time                          := 20 ns;   -- clock period
signal      clock   : std_logic                     := '0';     -- clock generator
signal      reset   : std_logic                     := '0';     -- reset generator
signal      data_tb : std_logic_vector(3 downto 0)  := "0000";
signal      load_tb : std_logic                     := '0';
signal      en_tb   : std_logic                     := '0';
signal      q_tb    : std_logic_vector(3 downto 0);
signal      check   : std_logic_vector(3 downto 0)  := "0000";

begin
-- instantiate the component
uut : counter PORT MAP(
	d      => data_tb,
	clk    => clock,
	rst    => reset,
	load   => load_tb,
	en     => en_tb,
	q      => q_tb
);

-- Clock process
clock_proc: process
begin
    clock <= '0';
    wait for t/2;   -- 10ns of 0
    clock <= '1';   -- 10ns of 1
    wait for t/2;
end process;

-- reset generator
reset <= '1', '0' after 10 ns;

-- Stimulus process
stim_proc: process
variable line_o : line;
begin
    wait until falling_edge(reset);
    wait until falling_edge(clock);
    load_tb <= '1';
    en_tb <= '0';
    data_tb <= "1010";
    wait until falling_edge(clock);
    if(q_tb /= "1010") then
        write(line_o, string'("Load Fail"));
        write(line_o, q_tb);
        writeline(output, line_o);
    end if;
    
    check <= "1010";
    load_tb <= '0';
    en_tb <= '1';
    
    wait for 1 ns;
    
    for i in 1 to 16 loop
        check <= std_logic_vector(unsigned(check) + 1);
        wait until falling_edge(clock);
        if(q_tb /= check) then
            report "count fail at time count" & time'image(now) & integer'image(i);
        end if;
    end loop;    
    --  Wait forever; this will finish the simulation.
    wait;
end process;
end architecture behavarioul;