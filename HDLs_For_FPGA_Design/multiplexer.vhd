-------------------------------------------------------
-- 4 to 1 Multiplexer
-------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Decleration
entity multiplexer is
port(	D : in std_logic_vector(3 downto 0);
	S : in std_logic_vector(1 downto 0);
	Y : out std_logic
);
end entity multiplexer;

-- Architecture using Selected Signal Assignment
architecture sel of multiplexer is
begin
	with S select
	Y <= 	D(0) when "00",
			D(1) when "01",
			D(2) when "10",
			D(3) when "11",
			D(3) when others;
end architecture sel;

-- Architecture using Conditional Assignment
--architecture dataflow of multiplexer is
--begin
--	Y <= 	D(0) when (S = "00") else
--			D(1) when (S = "01") else
--			D(2) when (S = "10") else
--			D(3);
--end architecture dataflow;

-- Architecture using Process Assignment
--architecture behavioural of multiplexer is
--begin
--	mux_proc : process(D, S)
--	begin
--		if 	(S = "00") then Y <= D(0);
--		elsif (S = "01") then Y <= D(1);
--		elsif (S = "10") then Y <= D(2);
--		else	Y <= D(3);
--		end if;
--	end process mux_proc;
--end architecture behavioural;


