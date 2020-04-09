-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity rotate_left_shift_8b is
    Port ( A    : in STD_LOGIC_VECTOR (7 downto 0);
           sft  : in STD_LOGIC_VECTOR (2 downto 0);
           B    : out STD_LOGIC_VECTOR (7 downto 0));
end rotate_left_shift_8b;

architecture Behavioral of rotate_left_shift_8b is
begin

    shift_proc: process (A,sft)
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
