----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 14:44:45
-- Design Name: 
-- Module Name: swapper - Behavioral
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

entity swapper is
    Port ( b1 : in STD_LOGIC_VECTOR (1 downto 0);
           b2 : in STD_LOGIC_VECTOR (1 downto 0);
           p1 : in STD_LOGIC_VECTOR (0 downto 0);
           p2 : in STD_LOGIC_VECTOR (2 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (7 downto 0);
           D1 : in STD_LOGIC_VECTOR (7 downto 0);
           D2 : in STD_LOGIC_VECTOR (7 downto 0);
           D3 : in STD_LOGIC_VECTOR (7 downto 0);
           A0 : out STD_LOGIC_VECTOR (7 downto 0);
           A1 : out STD_LOGIC_VECTOR (7 downto 0);
           A2 : out STD_LOGIC_VECTOR (7 downto 0);
           A3 : out STD_LOGIC_VECTOR (7 downto 0));
end swapper;

architecture Behavioral of swapper is

begin


end Behavioral;
