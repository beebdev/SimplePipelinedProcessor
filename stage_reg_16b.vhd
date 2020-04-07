----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:12 04/07/2020 
-- Design Name: 
-- Module Name:    stage_reg_16b - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stage_reg_16b is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end stage_reg_16b;

architecture Behavioral of stage_reg_16b is

begin
	process(clk,reset)
	begin
		if reset = '1' then 
			Q <= (others => '0');
		elsif clk'event and clk = '1' then
			Q <= D;
		end if;

	end process;


end Behavioral;

