----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: mux_2to1_4b - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2to1_4b is
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC_VECTOR (15 downto 0);
           data_b : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end mux_2to1_4b;

architecture Behavioral of mux_2to1_4b is
    component mux_2to1_1b is
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC;
           data_b : in STD_LOGIC;
           data_out : out STD_LOGIC);
    end component;
begin
    -- generate 4 mux_2to1_1b to for mux_2to1_4b
    muxes : for i in 3 downto 0 generate
        bit_mux : mux_2to1_1b
        port map (mux_select => mux_select,
                  data_a     => data_a(i),
                  data_b     => data_b(i),
                  data_out   => data_out(i));
    end generate muxes;
end Behavioral;
