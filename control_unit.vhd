-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( opcode       : in STD_LOGIC_VECTOR (3 downto 0);
           reg_write    : out STD_LOGIC;
           write_dsrc   : out STD_LOGIC_VECTOR(1 downto 0);
           mem_read     : out STD_LOGIC;
           reg_dst      : out STD_LOGIC;
           alu_src      : out STD_LOGIC );
end control_unit;

architecture Behavioral of control_unit is
	constant OP_LOAD  : std_logic_vector(3 downto 0) := "0001";
	constant OP_TAG   : std_logic_vector(3 downto 0) := "0010";
	constant OP_CMP   : std_logic_vector(3 downto 0) := "0011";
begin

	 reg_dst   <= '0' when (opcode = OP_CMP 
	                        or opcode = OP_TAG) else
	              '1';
	 
	 reg_write <= '1' when (opcode = OP_CMP
	                        or opcode = OP_TAG 
	                        or opcode = OP_LOAD) else
                  '0';
					
	 alu_src   <= '0' when opcode = OP_LOAD else
	              '1';
	 
	 write_dsrc <= "00" when opcode = OP_CMP else
                   "01" when opcode = OP_TAG else
                   "10" when opcode = OP_LOAD else
                   (others => 'X'); 

end Behavioral;