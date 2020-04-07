----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:20:43 04/07/2020 
-- Design Name: 
-- Module Name:    pipe_id_ex - Behavioral 
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

entity pipe_id_ex is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (3 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (3 downto 0);
           data_a_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct_32b_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct_32b_out : out  STD_LOGIC_VECTOR (31 downto 0);
           address_a_in : in  STD_LOGIC_VECTOR (3 downto 0);
           address_a_out : out  STD_LOGIC_VECTOR (3 downto 0);
           address_b_in : in  STD_LOGIC_VECTOR (3 downto 0);
           address_b_out : out  STD_LOGIC_VECTOR (3 downto 0);
           data_a_out : out  STD_LOGIC_VECTOR (31 downto 0);
           data_b_out : out  STD_LOGIC_VECTOR (31 downto 0));
end pipe_id_ex;

architecture Behavioral of pipe_id_ex is
	component stage_reg_4b is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (3 downto 0);
				  Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component stage_reg_32b is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (31 downto 0);
				  Q : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;	

begin
	--preserve pc
	piping_pc : stage_reg_4b port map 
		(clk => clk,
		reset => reset, 
		D => pc_in,
		Q => pc_out
		);
		
	--preserve data_a
		store_data_a : stage_reg_32b port map 
		(clk => clk,
		reset => reset,
		D => data_a_in ,
		Q => data_a_out 
		);
	
	--preserve data_b
		store_data_b : stage_reg_32b port map 
		(clk => clk,
		reset => reset,
		D => data_b_in ,
		Q => data_b_out 
		);
	
	--preserve 32 bit instruction
	 store_full_instruct : stage_reg_32b port map
		(clk => clk,
		reset => reset,
		D => instruct_32b_in ,
		Q => instruct_32b_out 
		);

	--preserve 4 bit instruction for address in reg file
	 store_address_a : stage_reg_4b port map
		(clk => clk,
		reset => reset,
		D => address_a_in ,
		Q => address_a_out 
		);

	--preserve 4 bit instruction for address in reg file
	 store_address_b : stage_reg_4b port map
		(clk => clk,
		reset => reset,
		D => address_b_in ,
		Q => address_b_out
		);	  
		
	

end Behavioral;

