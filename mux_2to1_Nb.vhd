library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_Nb is
    generic (N : integer);
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_b : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end mux_2to1_Nb;

architecture Behavioral of mux_2to1_Nb is
begin
    process (data_a, data_b, mux_select)
    begin
        data_out <= data_a when mux_select = '0' else
                    data_b when mux_select = '1' else
                    (others => 'X');
    end process;

end Behavioral;
