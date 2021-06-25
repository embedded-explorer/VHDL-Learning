----------------------------------------------------------------------------------
-- 4 Bit Ripple Carry Adder using full_adder
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_inst is
    Port ( 
        a, b : in   std_logic_vector(3 downto 0);
        cin  : in   std_logic;
        sum  : out  std_logic_vector(3 downto 0);
        cout : out  std_logic
    );
end adder_inst;

architecture Behavioral of adder_inst is
    component full_adder is
        Port (
            ai,bi,ci    : in    std_logic;
            s, co       : out   std_logic 
        );
    end component;

    signal c : std_logic_vector(2 downto 0);
    
begin
    fa1 : full_adder port map(
        ai  => a(0),
        bi  => b(0),
        ci  => cin,
        s   => sum(0),
        co  => c(0)
    );
    
    fa2 : full_adder port map(
        ai  => a(1),
        bi  => b(1),
        ci  => c(0),
        s   => sum(1),
        co  => c(1)
    );
    
    fa3 : full_adder port map(
        ai  => a(2),
        bi  => b(2),
        ci  => c(1),
        s   => sum(2),
        co  => c(2)
    );
    
    fa4 : full_adder port map(
        ai  => a(3),
        bi  => b(3),
        ci  => c(2),
        s   => sum(3),
        co  => cout
    );
    
end Behavioral;
