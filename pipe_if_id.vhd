----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:37 04/07/2020 
-- Design Name: 
-- Module Name:    pipe_if_id - Behavioral 
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

entity pipe_if_id is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (3 downto 0);
           instruction_out : out  STD_LOGIC_VECTOR (15 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (3 downto 0));
end pipe_if_id;

architecture Behavioral of pipe_if_id is
	component stage_reg_4b is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (3 downto 0);
				  Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component stage_reg_16b is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (15 downto 0);
				  Q : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;


begin
	--preserving pc  
	store_pc : stage_reg_4b port map 
		(clk => clk,
		reset => reset,
		D => pc_in ,
		Q => pc_out  
		);
	
	--preserve instruction
	store_instruction : stage_reg_16b port map 
		(clk => clk,
		reset => reset,
		D => instruction_in,
		Q => instruction_out 
		);


end Behavioral;

