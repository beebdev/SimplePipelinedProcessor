----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: data_memory - Behavioral
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

entity data_memory is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           write_enable : in STD_LOGIC;
           write_data : in STD_LOGIC_VECTOR (32 downto 0);
           addr_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (32 downto 0));
end data_memory;

architecture Behavioral of data_memory is

type mem_array is array(0 to 15) of std_logic_vector(32 downto 0);
signal sig_data_mem : mem_array;

begin
    mem_process: process ( clk,
                           write_enable,
                           write_data,
                           addr_in ) is
  
    variable var_data_mem : mem_array;
    variable var_addr     : integer;
  
    begin
        var_addr := conv_integer(addr_in);
        
        if (reset = '1') then
            -- initial values of the data memory : reset to zero 
            var_data_mem(0)  := (others => '0');
            var_data_mem(1)  := (others => '0');
            var_data_mem(2)  := (others => '0');
            var_data_mem(3)  := (others => '0');
            var_data_mem(4)  := (others => '0');
            var_data_mem(5)  := (others => '0');
            var_data_mem(6)  := (others => '0');
            var_data_mem(7)  := (others => '0');
            var_data_mem(8)  := (others => '0');
            var_data_mem(9)  := (others => '0');
            var_data_mem(10) := (others => '0');
            var_data_mem(11) := (others => '0');
            var_data_mem(12) := (others => '0');
            var_data_mem(13) := (others => '0');
            var_data_mem(14) := (others => '0');
            var_data_mem(15) := (others => '0');

        elsif (falling_edge(clk) and write_enable = '1') then
            -- memory writes on the falling clock edge
            var_data_mem(var_addr) := write_data;
        
		  end if;
       
        -- continuous read of the memory location given by var_addr 
        data_out <= var_data_mem(var_addr);
 
        -- the following are probe signals (for simulation purpose) 
        sig_data_mem <= var_data_mem;

    end process;
  
end behavioral;

