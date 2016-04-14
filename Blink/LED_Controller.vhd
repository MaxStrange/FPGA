library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_Controller is
	port (
		counter : in std_logic;
		rst : in std_logic;
		leds : out std_logic_vector(3 downto 0)
	);
end entity LED_Controller;

architecture RTL of LED_Controller is
	
	signal led0_state : std_logic;
	
	
begin
	
	output_state : process (counter, rst, led0_state) is
	begin
		if rst = '1' then
			led0_state <= '0';
		elsif rising_edge(counter) then
			led0_state <= not led0_state;
		end if;
		
		leds(0) <= led0_state;
		leds(1) <= '0';
		leds(2) <= '0';
		leds(3) <= '0';
	
	end process output_state;
		
	
end architecture RTL;
