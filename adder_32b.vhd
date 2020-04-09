-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_32b is
    Port ( src_a        : in STD_LOGIC_VECTOR (31 downto 0);
           src_b        : in STD_LOGIC_VECTOR (31 downto 0);
           sum          : out STD_LOGIC_VECTOR (31 downto 0);
           carry_out    : out STD_LOGIC );
end adder_32b;

architecture Behavioral of adder_32b is
    -- intermediate result with extra bit for carry
    signal result : STD_LOGIC_VECTOR(32 downto 0);
begin

    result <= '0'&src_a + '0'&src_b;
    sum <= result(31 downto 0);
    carry_out <= result(32);

end Behavioral;