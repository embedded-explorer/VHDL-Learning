----------------------------------------------------------------------------------
-- Full Adder Testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
component full_adder is
    Port (
        ai,bi,ci    : in    std_logic;
        s, co       : out   std_logic 
    );
end component;

signal a_tb, b_tb, cin_tb : std_logic;
signal sum_tb, cout_tb    : std_logic;

begin

uut : full_adder port map(
    ai  =>  a_tb, 
    bi  =>  b_tb, 
    ci  =>  cin_tb, 
    s   =>  sum_tb, 
    co  =>  cout_tb
);

stim_proc: process
begin
    a_tb <= '0'; b_tb <= '0'; cin_tb <= '0'; wait for 10 ns;
    a_tb <= '0'; b_tb <= '0'; cin_tb <= '1'; wait for 10 ns;
    a_tb <= '0'; b_tb <= '1'; cin_tb <= '0'; wait for 10 ns;
    a_tb <= '0'; b_tb <= '1'; cin_tb <= '1'; wait for 10 ns;
    a_tb <= '1'; b_tb <= '0'; cin_tb <= '0'; wait for 10 ns;
    a_tb <= '1'; b_tb <= '0'; cin_tb <= '1'; wait for 10 ns;
    a_tb <= '1'; b_tb <= '1'; cin_tb <= '0'; wait for 10 ns;
    a_tb <= '1'; b_tb <= '1'; cin_tb <= '1'; wait for 10 ns;
    wait;
end process stim_proc;
end Behavioral;