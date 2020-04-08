----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:12 04/08/2020 
-- Design Name: 
-- Module Name:    mux_2to1_32b - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2to1_32b is
    Port ( mux_select : in  STD_LOGIC;
           data_a : in  STD_LOGIC_VECTOR (31 downto 0);
           data_b : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_2to1_32b;

architecture Behavioral of mux_2to1_32b is

    component mux_2to1_1b is
        Port ( mux_select : in STD_LOGIC;
               data_a : in STD_LOGIC;
               data_b : in STD_LOGIC;
               data_out : out STD_LOGIC);
    end component;
begin
    muxes : for i in 31 downto 0 generate
        bit_mux : mux_2to1_1b
        port map (mux_select => mux_select,
                  data_a     => data_a(i),
                  data_b     => data_b(i),
                  data_out   => data_out(i));
    end generate muxes;

end Behavioral;

