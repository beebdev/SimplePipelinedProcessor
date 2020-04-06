library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity swapper is
    Port ( control : in STD_LOGIC_VECTOR(12 downto 0);
           D0 : in STD_LOGIC_VECTOR(7 downto 0);
           D1 : in STD_LOGIC_VECTOR(7 downto 0);
           D2 : in STD_LOGIC_VECTOR(7 downto 0);
           D3 : in STD_LOGIC_VECTOR(7 downto 0);
           A0 : out STD_LOGIC_VECTOR(7 downto 0);
           A1 : out STD_LOGIC_VECTOR(7 downto 0);
           A2 : out STD_LOGIC_VECTOR(7 downto 0);
           A3 : out STD_LOGIC_VECTOR(7 downto 0));
end swapper;

architecture Behavioral of swapper is
    -- control signals
    signal b1, b2 : STD_LOGIC_VECTOR(1 downto 0);
    signal p1, p2 : STD_LOGIC_VECTOR(2 downto 0);
    signal s : STD_LOGIC_VECTOR(2 downto 0);
    
    -- swap buffer
    signal in_a, in_b : STD_LOGIC_VECTOR(7 downto 0);
    signal out_a, out_b : STD_LOGIC_VECTOR(7 downto 0);
    signal temp : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    -- start end position
    signal a_s, a_e : integer;
    signal b_s, b_e : integer;
    signal size : integer;
begin
    -- extract signal from control
    b1 <= control(1 downto 0);
    b2 <= control(3 downto 2);
    p1 <= control(6 downto 4);
    p2 <= control(9 downto 7);
    s <= control(12 downto 10);
    
    -- initialise start end position
    size <= to_integer(unsigned(s));
    a_s <= to_integer(unsigned(p1));
    a_e <= a_s + size - 1;
    b_s <= to_integer(unsigned(p2));
    b_e <= b_s + size - 1;
    
    -- determine which two to swap
    swap_determine : process (b1, b2, D0, D1, D2, D3, out_a, out_b)
    begin
        -- init all A# to D#
        A0 <= D0; A1 <= D1; A2 <= D2; A3 <= D3;
        
        -- byte specified by b1
        case b1 is
            when "00" =>
                in_a <= D0;
                A0 <= out_a;
            when "01" =>
                in_a <= D1;
                A1 <= out_a;
            when "10" =>
                in_a <= D2;
                A2 <= out_a;
            when "11" =>
                in_a <= D3;
                A3 <= out_a;
            when others =>
                in_a <= (others => 'X');
        end case;
        
        -- byte specified by b2
        case b2 is
            when "00" =>
                in_b <= D0;
                A0 <= out_b;
            when "01" =>
                in_b <= D1;
                A1 <= out_b;
            when "10" =>
                in_b <= D2;
                A2 <= out_b;
            when "11" =>
                in_b <= D3;
                A3 <= out_b;
            when others =>
                in_b <= (others => 'X');
        end case;
    end process;
    
    -- swap process
    swap_process : process(in_a, in_b, temp,
                            a_e, a_s, b_e, b_s, size)
    begin
        -- swap using a third buffer
        temp(size-1 downto 0) <= in_a(a_e downto a_s);
        in_a(a_e downto a_s) <= in_b(b_e downto b_s);
        in_b(b_e downto b_s) <= temp(size-1 downto 0);
    end process;
end Behavioral;
