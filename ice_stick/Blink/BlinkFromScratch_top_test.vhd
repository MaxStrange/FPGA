library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BlinkFromScratch_top_test is
end entity BlinkFromScratch_top_test;

architecture RTL of BlinkFromScratch_top_test is
	signal clk : std_logic;
--	signal slow_clk : std_logic;
	signal rst : std_logic;
	signal leds : std_logic_vector (3 downto 0);
		
begin
	
	unit_under_test : entity work.BlinkFromScratch_top
		port map(
			clk   => clk,
			led_v => leds
		);
		
--	counter : entity work.Counter
--		port map(
--			clk   => clk,
--			rst   => rst,
--			count => slow_clk
--		);
--		
--	led_controller : entity work.LED_Controller
--		port map(
--			counter => slow_clk,
--			rst     => rst,
--			leds    => leds
--		);
				
		clk_proc : process is
		begin
			
			clk <= '0';
			wait for 10 ns;
			clk <= '1';
			wait for 10 ns;
			
		end process clk_proc;
		
		rst_proc : process is
		begin
			
			rst <= '1';
			wait for 250 ns;
			rst <= '0';
			wait for 3000 ms;
			
		end process rst_proc;
		
	
end architecture RTL;