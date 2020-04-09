-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forward is
    Port ( IDEX_rs              : in STD_LOGIC_VECTOR(3 downto 0);
           IDEX_rt              : in STD_LOGIC_VECTOR(3 downto 0);
           EXMEM_reg_write_dst  : in STD_LOGIC_VECTOR(3 downto 0);
           WB_reg_write_dst     : in STD_LOGIC_VECTOR(3 downto 0);
           comp_sel_a           : out STD_LOGIC_VECTOR(1 downto 0);
           comp_sel_b           : out STD_LOGIC_VECTOR(1 downto 0);
           tag_sel_a            : out STD_LOGIC_VECTOR(1 downto 0);
           tag_sel_b            : out STD_LOGIC_VECTOR(1 downto 0);
           alu_sel_a            : out STD_LOGIC_VECTOR(1 downto 0) );
end forward;

architecture Behavioral of forward is
begin


end Behavioral;

