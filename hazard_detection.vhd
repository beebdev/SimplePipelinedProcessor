----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:37:20 04/09/2020 
-- Design Name: 
-- Module Name:    hazard_detection - Behavioral 
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

entity hazard_detection is
    Port ( id_ex_memread : in  STD_LOGIC;
           id_ex_rt : in  STD_LOGIC_VECTOR (3 downto 0);
           if_id_rs : in  STD_LOGIC_VECTOR (3 downto 0);--11 to 8
           if_id_rt : in  STD_LOGIC_VECTOR (3 downto 0);--7 to 4
           stall : out  STD_LOGIC);
end hazard_detection;

architecture Behavioral of hazard_detection is
--if (ID/EX.MemRead and
-- ((ID/EX.RegisterRt = IF/ID.RegisterRs) or
-- (ID/EX.RegisterRt = IF/ID.RegisterRt)))
-- stall the pipeline
begin
	process(id_ex_memread,id_ex_rt,if_id_rs,if_id_rt)
	begin
		if id_ex_memread = '1' and ((id_ex_rt = if_id_rs) or (id_ex_rt = if_id_rt)) then 
			stall <= '1';
		else
			stall <= '0';
		end if;
	end process;


end Behavioral;

