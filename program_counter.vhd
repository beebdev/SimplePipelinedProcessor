-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is
    Port ( reset    : in STD_LOGIC;
           clk      : in STD_LOGIC;
           addr_in  : in STD_LOGIC_VECTOR (3 downto 0);
           addr_out : out STD_LOGIC_VECTOR (3 downto 0));
end program_counter;

architecture Behavioral of program_counter is
    -- Load     - 0001
    -- Tag_gen  - 0010
    -- Comp     - 0011
begin

    update_process: process ( reset, clk ) is
    begin
       if (reset = '1') then
           addr_out <= (others => '0'); 
       elsif (rising_edge(clk)) then
           addr_out <= addr_in; 
       end if;
    end process;

end Behavioral;
