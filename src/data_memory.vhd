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

entity data_memory is
    Port ( reset    : in STD_LOGIC;
           clk      : in STD_LOGIC;
           addr_in  : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture Behavioral of data_memory is
    -- 16 32-bit memory for data_memory
    type mem_array is array(0 to 15) of std_logic_vector(31 downto 0);
    signal sig_data_mem : mem_array;
begin

    mem_process: process ( clk, addr_in ) is
        variable var_data_mem : mem_array;
        variable var_addr     : integer;
    begin
        var_addr := conv_integer(addr_in);
        
        if (reset = '1') then
            -- initial values of the data memory : reset to zero 
            var_data_mem(0)  := X"504D4F43";
            var_data_mem(1)  := X"000000E4";
            var_data_mem(2)  := X"01842A26";
            var_data_mem(3)  := X"00000000";
            var_data_mem(4)  := X"00000000";
            var_data_mem(5)  := X"00000000";
            var_data_mem(6)  := X"00000000";
            var_data_mem(7)  := X"00000000";
            var_data_mem(8)  := X"00000000";
            var_data_mem(9)  := X"00000000";
            var_data_mem(10) := X"00000000";
            var_data_mem(11) := X"00000000";
            var_data_mem(12) := X"00000000";
            var_data_mem(13) := X"00000000";
            var_data_mem(14) := X"00000000";
            var_data_mem(15) := X"00000000";
        end if;
       
        -- continuous read of the memory location given by var_addr 
        data_out <= var_data_mem(var_addr);
 
        -- the following are probe signals (for simulation purpose) 
        sig_data_mem <= var_data_mem;

    end process;
  
end behavioral;

