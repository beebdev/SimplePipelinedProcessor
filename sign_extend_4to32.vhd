library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sign_extend_NtoM is
    generic (N : integer;
             M : integer );
    Port ( data_in : in STD_LOGIC_VECTOR (N downto 0);
           data_out : out STD_LOGIC_VECTOR (M downto 0));
end sign_extend_NtoM;

architecture Behavioral of sign_extend_NtoM is
begin
    sign_extend : process(data_in) is
    begin
        -- LS four bits are same as data_in
        data_out(N downto 0) <= data_in;
        -- Rest are the same as MSB in data_in
        for i in M downto N loop
            data_out(i) <= data_in(N-1);
        end loop;
    end process;

end Behavioral;
