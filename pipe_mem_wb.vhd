----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:00 04/07/2020 
-- Design Name: 
-- Module Name:    pipe_mem_wb - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipe_mem_wb is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tag_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
           tag_result_out : out  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_result_out : out  STD_LOGIC_VECTOR (31 downto 0));
end pipe_mem_wb;

architecture Behavioral of pipe_mem_wb is
	component stage_reg_32b is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (31 downto 0);
				  Q : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;	
begin

	--piping tag
		store_tag : stage_reg_32b port map 
		(clk => clk,
		reset => reset,
		D => tag_result_in ,
		Q => tag_result_out 
		);
	
	--piping alu
		store_alu : stage_reg_32b port map 
		(clk => clk,
		reset => reset,
		D => alu_result_in ,
		Q => alu_result_out 
		);
		
	--piping reg data for write back
		store_data : stage_reg_32b port map 
		(clk => clk,
		reset => reset,
		D => data_in ,
		Q => data_out 
		);	

end Behavioral;

