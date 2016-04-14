library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter is
	port (
		clk : in std_logic;
		rst : in std_logic;
		count : out std_logic
	);
end entity Counter;

architecture RTL of Counter is
	constant COUNT_MAX : integer := 12_000_000;
	
	signal count_value : integer range 0 to COUNT_MAX := 0;
	signal current_out : std_logic := '0';
	
begin
	
	tick : process (clk, rst) is
	begin
		if rst = '1' then
			count_value <= 1;
		elsif rising_edge(clk) then
			
			if count_value = COUNT_MAX then
				count_value <= 1;
			else
				count_value <= count_value + 1;
			end if;
			
		end if;
	end process tick;
	
	toggle : process (clk, rst) is
	begin
		if rst = '1' then
			count <= '0';
			current_out <= '0';
		elsif rising_edge(clk) then
		
			if count_value = COUNT_MAX then
				count <= not current_out;
				current_out <= not current_out;
			end if;
		
		end if;
	end process toggle;
	
	
end architecture RTL;
