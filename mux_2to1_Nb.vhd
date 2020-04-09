-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_Nb is
    generic (N : integer);
    Port ( mux_select   : in STD_LOGIC;
           data_a       : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_b       : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_out     : out STD_LOGIC_VECTOR (N-1 downto 0));
end mux_2to1_Nb;

architecture Behavioral of mux_2to1_Nb is
    component mux_2to1_1b is
        Port ( mux_select   : in STD_LOGIC;
               data_a       : in STD_LOGIC;
               data_b       : in STD_LOGIC;
               data_out     : out STD_LOGIC);
    end component;
begin

    -- generate N mux_2to1_1b to for mux_2to1_16b
    muxes : for i in N-1 downto 0 generate
        bit_mux : mux_2to1_1b
        port map (mux_select => mux_select,
                  data_a     => data_a(i),
                  data_b     => data_b(i),
                  data_out   => data_out(i));
    end generate muxes;

end Behavioral;
