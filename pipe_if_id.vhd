----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:37 04/07/2020 
-- Design Name: 
-- Module Name:    pipe_if_id - Behavioral 
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

entity pipe_if_id is
    Port ( reset        : in  STD_LOGIC;
           clk          : in  STD_LOGIC;
           inst_in      : in  STD_LOGIC_VECTOR (15 downto 0);
           inst_out     : out  STD_LOGIC_VECTOR (15 downto 0) );
end pipe_if_id;

architecture Behavioral of pipe_if_id is
begin
    process (reset, clk) is
    begin
        if (reset = '1') then
            inst_out <= (others => '0');
        elsif (rising_edge(clk)) then
            inst_out <= inst_in;
        end if;
    end process;

end Behavioral;

