library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tag_generator_TB is
end tag_generator_TB;

architecture Behavioral of tag_generator_TB is
    component tag_generator is
    Port ( D_in : in STD_LOGIC_VECTOR (31 downto 0);
           control : in STD_LOGIC_VECTOR (24 downto 0);
           tag_result : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    -- Inputs
    signal D0 : STD_LOGIC_VECTOR(7 downto 0) := "01010000";
    signal D1 : STD_LOGIC_VECTOR(7 downto 0) := "01001101";
    signal D2 : STD_LOGIC_VECTOR(7 downto 0) := "01001111";
    signal D3 : STD_LOGIC_VECTOR(7 downto 0) := "01000011";
--    signal p1 : STD_LOGIC_VECTOR(2 downto 0) := "010";
--    signal p2 : STD_LOGIC_VECTOR(2 downto 0) := "100";
--    signal s : STD_LOGIC_VECTOR(2 downto 0) := "010";
--    signal b1 : STD_LOGIC_VECTOR(1 downto 0) := "10";
--    signal b2 : STD_LOGIC_VECTOR(1 downto 0) := "01";
--    signal r0 : STD_LOGIC_VECTOR(2 downto 0) := "001";
--    signal r1 : STD_LOGIC_VECTOR(2 downto 0) := "100";
--    signal r2 : STD_LOGIC_VECTOR(2 downto 0) := "000";
--    signal r3 : STD_LOGIC_VECTOR(2 downto 0) := "110";
    signal tag_result : STD_LOGIC_VECTOR(7 downto 0);
    signal control : STD_LOGIC_VECTOR(24 downto 0) := "1100001000010101000100110";
    
begin
    UTT : tag_generator
        port map ( D_in => (D3&D2&D1&D0),
                   control => control,
                   tag_result => tag_result );

    stim_proc : process
    begin
        wait for 10ns;
    end process;
end Behavioral;
