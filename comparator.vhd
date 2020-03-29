----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 14:44:45
-- Design Name: 
-- Module Name: comparator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
           data_b : in STD_LOGIC_VECTOR (7 downto 0);
           eq : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

--signal a,b : std_logic_vector(7 downto 0);

begin
	
	--a <= "10000000";
	--b <= "10000000";
	
	check_statement:
	process (data_a,data_b)
	begin
		if data_a = data_b then
			eq <= '1';
		else
			eq <=  '0';
		end if;
	end process;
		

end Behavioral;
