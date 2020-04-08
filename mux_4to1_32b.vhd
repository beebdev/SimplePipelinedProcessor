library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity mux_3to1_32b is
    Port ( mux_select : in STD_LOGIC_VECTOR (1 downto 0);
           data_a : in STD_LOGIC_VECTOR (31 downto 0);
           data_b : in STD_LOGIC_VECTOR (31 downto 0);
           data_c : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end mux_3to1_32b;

architecture Behavioral of mux_3to1_32b is
begin
    process (data_a, data_b, data_c, mux_select)
    begin
        with mux_select select
        data_out <= data_a when "00",
                    data_b when "01",
                    data_c when "10",
                    (other => 'X') when others;
    end process;
end Behavioral;
