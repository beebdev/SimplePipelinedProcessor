library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sign_extend_4to16 is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end sign_extend_4to16;

architecture Behavioral of sign_extend_4to16 is

begin
    sign_extend : process(data_in) is
    begin
        -- LS four bits are same as data_in
        data_out(3 downto 0) <= data_in;
        -- Rest are the same as MSB in data_in
        for i in 15 downto 4 loop
            data_out(i) <= data_in(3);
        end loop;
    end process;

end Behavioral;
