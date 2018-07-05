library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_Controller_test is
end entity LED_Controller_test;

architecture TB of LED_Controller_test is
	
	signal counter : std_logic;
	signal rst : std_logic;
	signal leds : std_logic_vector (3 downto 0);
	
begin
	unit_under_test : entity work.LED_Controller
		port map(
			counter => counter,
			rst     => rst,
			leds    => leds
		);
		
	counter_proc : process is
	begin
		
		counter <= '0';
		wait for 10 ns;
		counter <= '1';
		wait for 10 ns;
	
	end process counter_proc;
	
	reset : process is
	begin
		
		rst <= '1';
		wait for 250 ns;
		rst <= '0';
		wait for 3000 ms;
		
	end process reset;
	
end architecture TB;

