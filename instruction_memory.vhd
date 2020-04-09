-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_memory is
    Port ( reset    : in STD_LOGIC;
           clk      : in STD_LOGIC;
           addr_in  : in STD_LOGIC_VECTOR (3 downto 0);
           insn_out : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
    type mem_array is array(0 to 24) of std_logic_vector(31 downto 0);
    signal sig_insn_mem : mem_array;
begin
    mem_process: process ( clk, addr_in ) is
        variable var_insn_mem : mem_array;
        variable var_addr     : integer;
    begin
        if (reset = '1') then
            var_insn_mem(0)   := (others => '0');
            var_insn_mem(1)   := (others => '0');
            var_insn_mem(2)   := (others => '0');
            var_insn_mem(3)   := (others => '0');
            var_insn_mem(4)   := (others => '0');
            var_insn_mem(5)   := (others => '0');
            var_insn_mem(6)   := (others => '0');
            var_insn_mem(7)   := (others => '0');
            var_insn_mem(8)   := (others => '0');
            var_insn_mem(9)   := (others => '0');
            var_insn_mem(10)  := (others => '0');
            var_insn_mem(11)  := (others => '0');
            var_insn_mem(12)  := (others => '0');
            var_insn_mem(13)  := (others => '0');
            var_insn_mem(14)  := (others => '0');
            var_insn_mem(15)  := (others => '0');
        elsif (rising_edge(clk)) then
            -- read instructions on the rising clock edge
            var_addr := conv_integer(addr_in);
            insn_out <= var_insn_mem(var_addr);
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;
    end process;

end Behavioral;
