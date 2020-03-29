----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 14:44:45
-- Design Name: 
-- Module Name: tag_generator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tag_generator is
    Port ( D0 : in STD_LOGIC_VECTOR (7 downto 0);
           D1 : in STD_LOGIC_VECTOR (7 downto 0);
           D2 : in STD_LOGIC_VECTOR (7 downto 0);
           D3 : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (24 downto 0);
           tag_result : out STD_LOGIC_VECTOR (7 downto 0));
end tag_generator;

architecture Behavioral of tag_generator is

    component swapper is
    Port ( D_a : in STD_LOGIC_VECTOR(7 downto 0);
           D_b : in STD_LOGIC_VECTOR(7 downto 0);
           s : in STD_LOGIC_VECTOR(2 downto 0);
           p1 : in STD_LOGIC_VECTOR(2 downto 0);
           p2 : in STD_LOGIC_VECTOR(2 downto 0);
           A_a : out STD_LOGIC_VECTOR(7 downto 0);
           A_b : out STD_LOGIC_VECTOR(7 downto 0) );
    end component;
    
    -- stage results and control signals
    signal sig_s : STD_LOGIC_VECTOR(2 downto 0);
    signal sig_p1, sig_p2 : STD_LOGIC_VECTOR(2 downto 0);
    signal sig_b1, sig_b2 : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_r0, sig_r1, sig_r2, sig_r3 : STD_LOGIC_VECTOR(2 downto 0);
    signal A0, A1, A2, A3 : STD_LOGIC_VECTOR(7 downto 0);
    signal B0, B1, B2, B3 : STD_LOGIC_VECTOR(7 downto 0);
    
    -- component input buffer
    signal swap_in_a, swap_in_b : STD_LOGIC_VECTOR(7 downto 0);
    signal swap_out_a, swap_out_b : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- extract control signals from control
    sig_s <= control(12 downto 10);
    sig_p1 <= control(6 downto 4);
    sig_p2 <= control(9 downto 7);
    sig_b1 <= control(1 downto 0);
    sig_b2 <= control(3 downto 2);
    sig_r0 <= control(15 downto 13);
    sig_r1 <= control(18 downto 16);
    sig_r2 <= control(21 downto 19);
    sig_r3 <= control(24 downto 22);
    
    -- Logic to determine which to swap;
    select_swap : process(sig_b1, sig_b2,
                D0, D1, D2, D3, A0, A1, A2, A3) is
        variable flag : std_logic_vector(3 downto 0) := "1111";
    begin
        case sig_b1 is
            when "00" =>
                swap_in_a <= D0;
                swap_out_a <= A0;
                flag(0) := '0';
            when "01" =>
                swap_in_a <= D1;
                swap_out_a <= A1;
                flag(1) := '0';
            when "10" =>
                swap_in_a <= D2;
                swap_out_a <= A2;
                flag(2) := '0';
            when "11" =>
                swap_in_a <= D3;
                swap_out_a <= A3;
                flag(3) := '0';
            when others =>
                swap_in_a <= (others => 'X');
                swap_out_a <= (others => 'X');
        end case;
                
        case sig_b2 is
            when "00" =>
                swap_in_b <= D0;
                swap_out_b <= A0;
                flag(0) := '0';
            when "01" =>
                swap_in_b <= D1;
                swap_out_b <= A1;
                flag(1) := '0';
            when "10" =>
                swap_in_b <= D2;
                swap_out_b <= A2;
                flag(2) := '0';
            when "11" =>
                swap_in_b <= D3;
                swap_out_b <= A3;
                flag(3) := '0';
            when others =>
                swap_in_b <= (others => 'X');
                swap_out_b <= (others => 'X');
        end case;
        if (flag(0) = '1') then
            A0 <= D0;
        end if;
        if (flag(1) = '1') then
            A1 <= D1;
        end if;
        if (flag(1) = '1') then
            A2 <= D2;
        end if;
        if (flag(1) = '1') then
            A3 <= D3;
        end if;
    end process;
    swap_c : swapper
    port map(D_a    => swap_in_a,
             D_b    => swap_in_b,
             s      => sig_s,
             p1     => sig_p1,
             p2     => sig_p2,
             A_a    => swap_out_a,
             A_b    => swap_out_b);
end Behavioral;
