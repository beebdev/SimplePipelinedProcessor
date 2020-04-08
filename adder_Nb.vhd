library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_Nb is
    generic (N : integer);
    Port ( src_a : in STD_LOGIC_VECTOR (N-1 downto 0);
           src_b : in STD_LOGIC_VECTOR (N-1 downto 0);
           sum : out STD_LOGIC_VECTOR (N-1 downto 0);
           carry_out : out STD_LOGIC );
end adder_Nb;

architecture Behavioral of adder_Nb is
    -- intermediate result with extra bit for carry
    signal result : STD_LOGIC_VECTOR(N downto 0);
begin
    result <= '0'&src_a + '0'&src_b;
    sum <= result(N-1 downto 0);
    carry_out <= result(N);
end Behavioral;
