----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

entity program_counter is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (15 downto 0);
           addr_out : out STD_LOGIC_VECTOR (15 downto 0));
end program_counter;

architecture Behavioral of program_counter is

begin

    update_process: process ( reset, 
                              clk ) is
    begin
       if (reset = '1') then
           addr_out <= (others => '0'); 
       elsif (rising_edge(clk)) then
           addr_out <= addr_in; 
       end if;
    end process;

end Behavioral;
