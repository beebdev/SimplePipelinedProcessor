-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_1b is
    Port ( mux_select   : in STD_LOGIC;
           data_a       : in STD_LOGIC;
           data_b       : in STD_LOGIC;
           data_out     : out STD_LOGIC);
end mux_2to1_1b;

architecture Behavioral of mux_2to1_1b is
begin

    data_out <= data_a when mux_select = '0' else
                data_b when mux_select = '1' else
                'X';

end Behavioral;
