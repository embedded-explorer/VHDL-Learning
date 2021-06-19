-------------------------------------------------------
-- 4-Bit Comparator using Different Modelling Styles
-------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Decleration
entity comparator is
port( 	A, B : in std_logic_vector(3 downto 0);
	Result : out std_logic
);
	
end comparator;

-- Architecture Structural (gate level) Modelling
architecture Structural of comparator is
signal X : std_logic_vector(3 downto 0);
begin
	Result <= not (A(0) xor B(0)) and
		  not (A(1) xor B(1)) and
		  not (A(2) xor B(2)) and
		  not (A(3) xor B(3));
end architecture Structural;

-- Architecture Dataflow Modelling
--architecture dataflow of comparator is
--begin
--	Result <= '1' when (A=B) else '0'; 
--end dataflow;

-- Architecture Behavioural Modelling
--architecture Behavioural of comparator is
--begin
--	CompareProcess : process(A, B)
--	begin
--		if(A = B) then
--			Result <= '1';
--		else
--			Result <= '0';
--		end if;
--	end process CompareProcess;
--end Behavioural;
