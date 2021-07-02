----------------------------------------------------------------------------------
-- Stepper Motor Rotation FSM using Binary Encoding
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_binary is
generic(
    sWidth  : integer := 3; -- state width
    An0     : std_logic_vector(2 downto 0) := "000";
    An45    : std_logic_vector(2 downto 0) := "001";
    An90    : std_logic_vector(2 downto 0) := "010";
    An135   : std_logic_vector(2 downto 0) := "011";
    An180   : std_logic_vector(2 downto 0) := "100";
    An225   : std_logic_vector(2 downto 0) := "101";
    An270   : std_logic_vector(2 downto 0) := "110";
    An315   : std_logic_vector(2 downto 0) := "111"
);
Port ( 
    clk, reset, moveCW, MoveCCW : in    std_logic;
    phyPosition                 : in    std_logic_vector(sWidth-1 downto 0);
    desPosition                 : inout std_logic_vector(sWidth-1 downto 0);
    posError                    : out   std_logic_vector(sWidth-1 downto 0)
);
end fsm_binary;

architecture Behavioral of fsm_binary is
    signal currentState, nextState : std_logic_vector(sWidth-1 downto 0);
begin
    comb_proc : process(moveCW, moveCCW, phyPosition, currentState)
    begin
        case(currentState) is
            when An0 =>
                if      (moveCW = '1')  then nextState <= An45;
                elsif   (moveCCW = '1') then nextState <= An315;
                else                         nextState <= An0;
                end if;
            when An45 =>
                if      (moveCW = '1')  then nextState <= An90;
                elsif   (moveCCW = '1') then nextState <= An0;
                else                         nextState <= An45;
                end if;
            when An90 =>
                if      (moveCW = '1')  then nextState <= An135;
                elsif   (moveCCW = '1') then nextState <= An45;
                else                         nextState <= An90;
                end if;
            when An135 =>
                if      (moveCW = '1')  then nextState <= An180;
                elsif   (moveCCW = '1') then nextState <= An90;
                else                         nextState <= An135;
                end if;
            when An180 =>
                if      (moveCW = '1')  then nextState <= An225;
                elsif   (moveCCW = '1') then nextState <= An135;
                else                         nextState <= An180;
                end if;
            when An225 =>
                if      (moveCW = '1')  then nextState <= An270;
                elsif   (moveCCW = '1') then nextState <= An180;
                else                         nextState <= An225;
                end if;
            when An270 =>
                if      (moveCW = '1')  then nextState <= An315;
                elsif   (moveCCW = '1') then nextState <= An225;
                else                         nextState <= An270;
                end if;
            when An315 =>
                if      (moveCW = '1')  then nextState <= An0;
                elsif   (moveCCW = '1') then nextState <= An270;
                else                         nextState <= An315;
                end if;
            when others =>                   nextState <= An0;
        end case;
    end process comb_proc;
    
    clk_proc : process (clk, reset) begin
        if (reset = '1') then currentState <= phyPosition;
        elsif(clk 'event and clk = '1') then currentState <= nextState;
        end if;
    end process clk_proc;
    
    -- output logic
    -- Moore Output
    desPosition <= currentState;
    
    -- Melay Output
    posError <= std_logic_vector(unsigned(desPosition) - unsigned(phyPosition));

end Behavioral;
