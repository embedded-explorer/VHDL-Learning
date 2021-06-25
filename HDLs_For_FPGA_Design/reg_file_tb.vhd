----------------------------------------------------------------------------------
-- Register File Test Bench
----------------------------------------------------------------------------------

-- Import Standard Logic Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entitiy Decleration
entity reg_file_tb is
end reg_file_tb;

-- Architecture
architecture Behavioral of reg_file_tb is

-- Declerative Section
constant ADDRESS_WIDTH : integer := 2;
constant DATA_WIDTH : integer := 8;

signal clk_tb                : std_logic := '0'; 
signal wren_tb               : std_logic;
signal wData_tb              : std_logic_vector(DATA_WIDTH-1 downto 0);
signal wAddr_tb, rAddr_tb    : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal rData_tb              : std_logic_vector(DATA_WIDTH-1 downto 0);

-- Component Decleration
component reg_file is
    generic(
        dWidth  : integer := 8;
        aWidth  : integer := 2
    );
    Port(
        clk, wren       : in    std_logic;
        wData           : in    std_logic_vector    (dWidth-1 downto 0);
        wAddr, rAddr    : in    std_logic_vector    (aWidth-1 downto 0);
        rData           : out   std_logic_vector    (dWidth-1 downto 0)
    );
end component reg_file;

begin

-- Instntiation of the Component
dut : reg_file 
GENERIC MAP(
    dWidth  => DATA_WIDTH,
    aWidth  => ADDRESS_WIDTH
)
PORT MAP(
    clk     =>  clk_tb,
    wren    =>  wren_tb,
    wData   =>  wData_tb,
    wAddr   =>  wAddr_tb,
    rData   =>  rData_tb,
    rAddr   =>  rAddr_tb
);

-- Clock process
clock_proc: process
begin
    clk_tb <= '0';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns;
end process clock_proc;

-- Stimulus
stim_proc : process
begin
    wren_tb <= '0';
    wait for 25 ns;
    wren_tb <= '1';
    wait for 20 ns;
    wAddr_tb <= "00";
    wData_tb <= "00110011";
    wait for 20 ns;
    wAddr_tb <= "01";
    wData_tb <= "01010101";
    wait for 20 ns;
    wAddr_tb <= "10";
    wData_tb <= "11001100";
    wait for 20 ns;
    wAddr_tb <= "11";
    wData_tb <= "10101010";
    wait for 20 ns;
    wren_tb <= '0';
    rAddr_tb <= "00";
    wait for 20 ns;
    rAddr_tb <= "01";
    wait for 20 ns;
    rAddr_tb <= "10";
    wait for 20 ns;
    rAddr_tb <= "11";
    wait;
end process stim_proc;
end Behavioral;
