library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_memory is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture Behavioral of data_memory is
    type mem_array is array(0 to 31) of std_logic_vector(31 downto 0);
    signal sig_data_mem : mem_array;
begin
    mem_process: process ( clk, addr_in ) is
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
            var_data_mem(16)  := (others => '0');
            var_data_mem(17)  := (others => '0');
            var_data_mem(18)  := (others => '0');
            var_data_mem(19)  := (others => '0');
            var_data_mem(20)  := (others => '0');
            var_data_mem(21)  := (others => '0');
            var_data_mem(22)  := (others => '0');
            var_data_mem(23)  := (others => '0');
            var_data_mem(24)  := (others => '0');
            var_data_mem(25)  := (others => '0');
            var_data_mem(26) := (others => '0');
            var_data_mem(27) := (others => '0');
            var_data_mem(28) := (others => '0');
            var_data_mem(29) := (others => '0');
            var_data_mem(30) := (others => '0');
            var_data_mem(31) := (others => '0');
				
				
        end if;
       
        -- continuous read of the memory location given by var_addr 
        data_out <= var_data_mem(var_addr);
 
        -- the following are probe signals (for simulation purpose) 
        sig_data_mem <= var_data_mem;

    end process;
  
end behavioral;

