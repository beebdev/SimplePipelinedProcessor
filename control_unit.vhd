----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( opcode : in STD_LOGIC_VECTOR (3 downto 0);
           reg_write : out STD_LOGIC;
           write_dsrc : out STD_LOGIC_VECTOR(1 downto 0);
           mem_read : out STD_LOGIC;
           reg_dst : out STD_LOGIC;
           alu_src : out STD_LOGIC );
end control_unit;

architecture Behavioral of control_unit is
constant OP_LOAD  : std_logic_vector(3 downto 0) := "0001";
constant OP_TAG   : std_logic_vector(3 downto 0) := "0010";
constant OP_CMP   : std_logic_vector(3 downto 0) := "0011";

begin

	 -- 1 for  data2 , 0 for data1
	 reg_dst    <= '1' when (opcode = OP_CMP or opcode = OP_TAG)  else
					'0';
	 
	 -- r-type and load word need to reg write
	 reg_write <= '1' when (opcode = OP_CMP or opcode = OP_TAG or opcode = OP_LOAD) else
					'0';
	
    --0 for extension(load)  and 1 for other case 
	 alu_src   <= '0' when opcode = OP_LOAD else 
					'1';
	 
	 -- 1 for load word case
	 mem_read <= '1' when opcode = OP_LOAD else
					 '0';
					 
	 
	 mem_to_reg <= "00" when opcode = OP_CMP else
						"01" when opcode = OP_TAG else
						"10" when opcode = OP_LOAD else
						"11"; 


end Behavioral;
