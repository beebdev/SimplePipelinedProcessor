-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hazard_detection is
    Port ( IDEX_write_dsrc : in  STD_LOGIC_VECTOR(1 downto 0);
           IDEX_rt : in  STD_LOGIC_VECTOR (3 downto 0);
           IFID_rs : in  STD_LOGIC_VECTOR (3 downto 0);--11 to 8
           IFID_rt : in  STD_LOGIC_VECTOR (3 downto 0);--7 to 4
           stall : out  STD_LOGIC);
end hazard_detection;

architecture Behavioral of hazard_detection is
    --if (ID/EX.MemRead and
    -- ((ID/EX.RegisterRt = IF/ID.RegisterRs) or
    -- (ID/EX.RegisterRt = IF/ID.RegisterRt)))
    -- stall the pipeline
begin

	process(IDEX_write_dsrc, IDEX_rt, IFID_rs, IFID_rt)
	begin
		if (IDEX_write_dsrc = "10")
                and ((IDEX_rt = IFID_rs) or (IDEX_rt = IFID_rt)) then 
			stall <= '1';
		else
			stall <= '0';
		end if;
	end process;
	
end Behavioral;

