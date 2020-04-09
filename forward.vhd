----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:09:11 04/09/2020 
-- Design Name: 
-- Module Name:    forward - Behavioral 
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

entity forward is
    Port ( ex_mem_regwrite : in  STD_LOGIC;
           ex_mem_rd : in  STD_LOGIC_VECTOR (3 downto 0);
           id_ex_rs : in  STD_LOGIC_VECTOR (3 downto 0);
           id_ex_rt : in  STD_LOGIC_VECTOR (3 downto 0);
           mem_wb_regwrite : in  STD_LOGIC;
           mem_wb_rd : in   STD_LOGIC_VECTOR (3 downto 0);
           --id_ex_rs : in  STD_LOGIC_VECTOR (3 downto 0);
           --id_ex_rt : in  STD_LOGIC_VECTOR (3 downto 0);
           forwarda : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardb : out  STD_LOGIC_VECTOR (1 downto 0));
end forward;

architecture Behavioral of forward is


--if (MEM/WB.RegWrite
--and (MEM/WB.RegisterRd ? 0)
--and not(EX/MEM.RegWrite and (EX/MEM.RegisterRd ? 0)
-- and (EX/MEM.RegisterRd ? ID/EX.RegisterRs))
--and (MEM/WB.RegisterRd = ID/EX.RegisterRs)) ForwardA = 01
--if (MEM/WB.RegWrite
--and (MEM/WB.RegisterRd ? 0)
--and not(EX/MEM.RegWrite and (EX/MEM.RegisterRd ? 0)
-- and (EX/MEM.RegisterRd ? ID/EX.RegisterRt))
--and (MEM/WB.RegisterRd = ID/EX.RegisterRt)) ForwardB = 01
begin

	process(ex_mem_regwrite,ex_mem_rd,id_ex_rs,id_ex_rt)
	begin	
	--EX HAZARD
		if ex_mem_regwrite = '1' and (ex_mem_rd /= "0000") and (ex_mem_rd = id_ex_rs) then
			forwarda <= "10";
		else
			forwarda <= "00";
		end if;
		
		if ex_mem_regwrite = '1' and (ex_mem_rd /= "0000") and (ex_mem_rd = id_ex_rt) then
			forwardb <= "10";
		else
			forwardb  <= "00";
		end if;
	
	--EX HAZARD
		if mem_wb_regwrite = '1' and  (mem_wb_rd /= "0000") and (ex_mem_regwrite = '0') and (ex_mem_rd /=id_ex_rs) and (mem_wb_rd = id_ex_rs) then 
			forwarda <= "01";
		else 
			forwarda <= "00";
		end if;

		if mem_wb_regwrite = '1' and  (mem_wb_rd /= "0000") and (ex_mem_regwrite = '0') and (ex_mem_rd /=id_ex_rt) and (mem_wb_rd = id_ex_rt) then 
			forwardb <= "01";
		else 
			forwardb <= "00";
		end if;	
		
	end process;	

end Behavioral;

