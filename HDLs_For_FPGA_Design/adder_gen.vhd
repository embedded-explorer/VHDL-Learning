----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_gen is
Port ( 
    a,b : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(3 downto 0);
    cout: out std_logic
);
end adder_gen;

architecture Behavioral of adder_gen is
component full_adder is
    Port (
        ai,bi,ci    : in    std_logic;
        s, co       : out   std_logic 
    );
end component;

signal c : std_logic_vector(4 downto 0);

begin
    c(0) <= cin;
    cout <= c(4);
    
    fa : for i in 0 to 3 generate
    inst: full_adder port map(
        ai  => a(i),
        bi  => b(i),
        ci  => c(i),
        s   => sum(i),
        co  => c(i+1)
    );
    end generate;
    
end Behavioral;
