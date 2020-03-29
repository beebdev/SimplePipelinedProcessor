----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 14:44:45
-- Design Name: 
-- Module Name: rotate_left_shift_8b - Behavioral
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

entity rotate_left_shift_8b is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           sft : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (0 downto 0));
end rotate_left_shift_8b;

architecture Behavioral of rotate_left_shift_8b is

begin


end Behavioral;
