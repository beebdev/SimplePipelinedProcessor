----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: instruction_memory - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (3 downto 0);
           insn_out : out STD_LOGIC_VECTOR (15 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

type mem_array is array(0 to 24) of std_logic_vector(15 downto 0);
signal sig_insn_mem : mem_array;

begin
    mem_process: process ( clk,
                           addr_in ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
  
    begin
        if (reset = '1') then


            var_insn_mem(0)   := X"0000";
            var_insn_mem(1)   := X"0000";
            var_insn_mem(2)   := X"0000";
            var_insn_mem(3)   := X"0000";
            var_insn_mem(4)   := X"0000";
            var_insn_mem(5)   := X"0000";
            var_insn_mem(6)   := X"0000";
            var_insn_mem(7)   := X"0000";
            var_insn_mem(8)   := X"0000";
            var_insn_mem(9)   := X"0000";
            var_insn_mem(10)  := X"0000";
            var_insn_mem(11)  := X"0000";
            var_insn_mem(12)  := X"0000";
            var_insn_mem(13)  := X"0000";
            var_insn_mem(14)  := X"0000";
            var_insn_mem(15)  := X"0000";
        
        elsif (rising_edge(clk)) then
            -- read instructions on the rising clock edge
            var_addr := conv_integer(addr_in);
            insn_out <= var_insn_mem(var_addr);
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;

end Behavioral;
