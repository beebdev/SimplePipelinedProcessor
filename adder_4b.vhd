----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: adder_4b - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_4b is
    Port ( src_a : in STD_LOGIC_VECTOR (3 downto 0);
           src_b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           carry_out : out STD_LOGIC );
end adder_4b;

architecture Behavioral of adder_4b is
    -- intermediate result with extra bit for carry
    signal result : STD_LOGIC_VECTOR(4 downto 0);
begin
    result <= '0'&src_a + '0'&src_b;
    sum <= result(3 downto 0);
    carry_out <= result(4);
end Behavioral;
