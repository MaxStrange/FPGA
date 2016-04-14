library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BlinkFromScratch_top is
	port(
		clk   : in  std_logic;
--		rst   : in  std_logic;
		led_v : out std_logic_vector(3 downto 0)
	);
end entity BlinkFromScratch_top;

architecture RTL of BlinkFromScratch_top is
	signal slow_clk     : std_logic;
	signal rst			: std_logic;

begin
	
	rst <= '0';
	
	counter_inst : entity work.Counter
		port map(
			clk   => clk,
			rst   => rst,
			count => slow_clk
		);
		
	led_controller_inst : entity work.LED_Controller
		port map(
			counter => slow_clk,
			rst     => rst,
			leds    => led_v
		);
	
end architecture RTL;
