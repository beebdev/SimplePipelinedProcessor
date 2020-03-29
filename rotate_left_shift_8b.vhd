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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

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
           B : out STD_LOGIC_VECTOR (7 downto 0));
end rotate_left_shift_8b;

architecture Behavioral of rotate_left_shift_8b is

begin
		shift_proc:
		process (A,sft)
		begin
		case sft is
         when "001" => B <= std_logic_vector(unsigned(A) rol 1);
         when "010" => B <= std_logic_vector(unsigned(A) rol 2);
         when "011" => B <= std_logic_vector(unsigned(A) rol 3);
         when "100" => B <= std_logic_vector(unsigned(A) rol 4);
         when "101" => B <= std_logic_vector(unsigned(A) rol 5);
         when "110" => B <= std_logic_vector(unsigned(A) rol 6);
         when "111" => B <= std_logic_vector(unsigned(A) rol 7);
			when others => B <= A;
		end case;
		end process;

end Behavioral;
