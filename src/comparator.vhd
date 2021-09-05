-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity comparator is
    Port ( data_a   : in STD_LOGIC_VECTOR (7 downto 0);
           data_b   : in STD_LOGIC_VECTOR (7 downto 0);
           eq       : out STD_LOGIC_VECTOR(31 downto 0));
end comparator;

architecture Behavioral of comparator is
    signal eq_buf : integer := 0;
begin

	process (data_a, data_b)
	begin
        if data_a = data_b then
            eq_buf <= 1;
		end if;
	end process;
	
	-- Directly output a 32-bit result to store in register
	eq <= conv_std_logic_vector(eq_buf, eq'length);
	
end Behavioral;
