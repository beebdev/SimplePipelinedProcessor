----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2020 11:07:20
-- Design Name: 
-- Module Name: comparator_TB - Behavioral
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

entity comparator_TB is
end comparator_TB;

architecture Behavioral of comparator_TB is
    component comparator is
    Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
           data_b : in STD_LOGIC_VECTOR (7 downto 0);
           eq : out STD_LOGIC);
    end component;
    
    signal data_a : STD_LOGIC_VECTOR(7 downto 0);
    signal data_b : STD_LOGIC_VECTOR(7 downto 0);
    signal eq : STD_LOGIC;
    
begin
    UTT : comparator
    port map ( data_a => data_a,
               data_b => data_b,
               eq => eq );

    stim_proc : process
    begin
        data_a <= "01010101";
        data_b <= "01010101";
        wait for 10ns;
        data_a <= "01011010";
        wait for 10ns;
        data_b <= "01011010";
        wait for 10ns;
        data_a <= "01010000";
        wait for 10ns;
    end process;

end Behavioral;
