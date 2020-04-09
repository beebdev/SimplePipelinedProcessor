-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipe_id_ex is
    Port ( reset                : in STD_LOGIC;
           clk                  : in STD_LOGIC;
           reg_write            : in STD_LOGIC;
           write_dsrc           : in STD_LOGIC_VECTOR(1 downto 0);
           reg_dst              : in STD_LOGIC;
           read_data_a          : in STD_LOGIC_VECTOR(31 downto 0);
           read_data_b          : in STD_LOGIC_VECTOR(31 downto 0);
           sign_ext_offset      : in STD_LOGIC_VECTOR(31 downto 0);
           rs                   : in STD_LOGIC_VECTOR(3 downto 0);
           rt                   : in STD_LOGIC_VECTOR(3 downto 0);
           rd                   : in STD_LOGIC_VECTOR(3 downto 0);
           IDEX_reg_write       : out STD_LOGIC;
           IDEX_write_dsrc      : out STD_LOGIC_VECTOR(1 downto 0);
           IDEX_reg_dst         : out STD_LOGIC;
           IDEX_read_data_a     : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_read_data_b     : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_sign_ext_offset : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_rs              : out STD_LOGIC_VECTOR(3 downto 0);
           IDEX_rt              : out STD_LOGIC_VECTOR(3 downto 0);
           IDEX_rd              : out STD_LOGIC_VECTOR(3 downto 0) );
end pipe_id_ex;

architecture Behavioral of pipe_id_ex is
begin
    store_proc : process (reset, clk) is
    begin
        if (reset = '1') then
            -- clear IDEX stage register when reset = '1'
            IDEX_reg_write <= '0';
            IDEX_write_dsrc <= (others => '0');
            IDEX_reg_dst <= '0';
            IDEX_read_data_a <= (others => '0');
            IDEX_read_data_b <= (others => '0');
            IDEX_sign_ext_offset <= (others => '0');
            IDEX_rs <= (others => '0');
            IDEX_rt <= (others => '0');
            IDEX_rd <= (others => '0');
        elsif (rising_edge(clk)) then
            -- update IDEX stage register when rising edge
            IDEX_reg_write <= reg_write;
            IDEX_write_dsrc <= write_dsrc;
            IDEX_reg_dst <= reg_dst;
            IDEX_read_data_a <= read_data_a;
            IDEX_read_data_b <= read_data_b;
            IDEX_sign_ext_offset <= sign_ext_offset;
            IDEX_rs <= rs;
            IDEX_rt <= rt;
            IDEX_rd <= rd;
        end if;
    end process;
end Behavioral;

