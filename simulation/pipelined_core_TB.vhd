-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipelined_core_TB is
end pipelined_core_TB;

architecture Behavioral of pipelined_core_TB is
    component pipelined_core is
        Port ( reset : in STD_LOGIC;
               clk : in STD_LOGIC);
    end component;
    
    -- Inputs
    signal reset    : STD_LOGIC := '0';
    signal clk      : STD_LOGIC := '1';
    
    -- Clock period definition
    constant clk_period : time := 10 ns;
    
begin
    UTT : pipelined_core
    port map ( reset    => reset,
               clk      => clk );
               
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_process : process
    begin
        reset <= '1';
        wait for 10ns;
        reset <= '0';
        wait for clk_period*15;
    end process;
end Behavioral;
