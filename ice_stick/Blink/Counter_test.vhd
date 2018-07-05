library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter_test is
end entity Counter_test;

architecture TB of Counter_test is
	
	signal clk : std_logic;
	signal rst : std_logic;
	signal count : std_logic;
	
begin
	unit_under_test : entity work.Counter
		port map(
			clk   => clk,
			rst   => rst,
			count => count
		);
		
	clock : process is
	begin
		
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	
	end process clock;
	
	reset : process is
	begin
		
		rst <= '1';
		wait for 250 ns;
		rst <= '0';
		wait for 3000 ms;
		
	end process reset;
	
end architecture TB;

