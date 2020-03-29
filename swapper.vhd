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
use IEEE.NUMERIC_STD.ALL;

entity swapper is
    Port ( D_a : in STD_LOGIC_VECTOR(7 downto 0);
           D_b : in STD_LOGIC_VECTOR(7 downto 0);
           s : in STD_LOGIC_VECTOR(2 downto 0);
           p1 : in STD_LOGIC_VECTOR(2 downto 0);
           p2 : in STD_LOGIC_VECTOR(2 downto 0);
           A_a : out STD_LOGIC_VECTOR(7 downto 0);
           A_b : out STD_LOGIC_VECTOR(7 downto 0) );
end swapper;

architecture Behavioral of swapper is
    signal sig_D_a : STD_LOGIC_VECTOR(7 downto 0);
    signal sig_D_b : STD_LOGIC_VECTOR(7 downto 0);
    signal buf : STD_LOGIC_VECTOR(7 downto 0);
    signal p1_s, p1_e : integer;
    signal p2_s, p2_e : integer;
    signal sw_s : integer;
begin
    sw_s <= to_integer(unsigned(s));
    p1_s <= to_integer(unsigned(p1));
    p1_e <= p1_s + sw_s - 1;
    p2_s <= to_integer(unsigned(s));
    p2_e <= p2_s + sw_s - 1;
    
    swap_bits : process (sig_D_a, sig_D_b, buf,
                            D_a, D_b,
                            p1_s, p1_e, p2_s, p2_e, sw_s) is
    begin
        -- Initialise sig_D_a and sig_D_b
        sig_D_a <= D_a;
        sig_D_b <= D_b;
        
        -- Swap bits between sig_D_a and sig_D_b
        buf((sw_s - 1) downto 0) <= sig_D_a(p1_e downto p1_s);
        sig_D_a(p1_e downto p1_s) <= sig_D_b(p2_e downto p2_s);
        sig_D_b(p2_e downto p2_s) <= buf((sw_s - 1) downto 0);
    end process;
    
    A_a <= sig_D_a;
    A_b <= sig_D_b;
    
end Behavioral;
