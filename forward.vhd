-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forward is
    Port ( IDEX_rs              : in STD_LOGIC_VECTOR(3 downto 0);
           IDEX_rt              : in STD_LOGIC_VECTOR(3 downto 0);
           EXMEM_reg_write_dst  : in STD_LOGIC_VECTOR(3 downto 0);
           WB_reg_write_dst     : in STD_LOGIC_VECTOR(3 downto 0);
           EXMEM_reg_write      : in STD_LOGIC;
           WB_reg_write         : in STD_LOGIC;
           comp_sel_a           : out STD_LOGIC_VECTOR(1 downto 0);
           comp_sel_b           : out STD_LOGIC_VECTOR(1 downto 0);
           tag_sel_a            : out STD_LOGIC;
           tag_sel_b            : out STD_LOGIC;
           alu_sel_a            : out STD_LOGIC );
end forward;

architecture Behavioral of forward is
begin
    comparator_forward : process (WB_reg_write, WB_reg_write_dst,
                                  EXMEM_reg_write, EXMEM_reg_write_dst,
                                  IDEX_rs, IDEX_rt)
    begin
        -- Initialise comp_sel_a and comp_sel_b to "00"
        comp_sel_a <= "00";
        comp_sel_b <= "00";
        
        -- WB overwrites if writes back
        if (WB_reg_write = '1' and WB_reg_write_dst /= "0000") then
            if (WB_reg_write_dst = IDEX_rs) then
                comp_sel_a <= "01";
            end if;
            
            if (WB_reg_write_dst = IDEX_rt) then
                comp_sel_b <= "01";
            end if;
        end if;
        
        -- EXMEM overwrites if writes back
        if (EXMEM_reg_write = '1' and EXMEM_reg_write_dst /= "0000") then
            if (EXMEM_reg_write_dst = IDEX_rs) then
                comp_sel_a <= "10";
            end if;
            
            if (EXMEM_reg_write_dst = IDEX_rt) then
                comp_sel_b <= "10";
            end if;
        end if;
    end process;
    
    -- For tag_gen we don't forward data from mem stage
    tag_gen_forward : process (WB_reg_write, WB_reg_write_dst,
                               IDEX_rs, IDEX_rt)
    begin
        -- Initialise comp_sel_a and comp_sel_b to "00"
        tag_sel_a <= '0';
        tag_sel_b <= '0';
        
        -- WB overwrites if writes back
        if (WB_reg_write = '1' and WB_reg_write_dst /= "0000") then
            if (WB_reg_write_dst = IDEX_rs) then
                tag_sel_a <= '1';
            end if;
            
            if (WB_reg_write_dst = IDEX_rt) then
                tag_sel_b <= '1';
            end if;
        end if;
    end process;
    
    -- For alu we don't forward from mem
    alu_forward : process (WB_reg_write, WB_reg_write_dst,
                               IDEX_rs, IDEX_rt)
    begin
        -- Initialise comp_sel_a and comp_sel_b to "00"
        alu_sel_a <= '0';
        
        -- WB overwrites if writes back
        if (WB_reg_write = '1' and WB_reg_write_dst /= "0000") then
            if (WB_reg_write_dst = IDEX_rs) then
                alu_sel_a <= '1';
            end if;
        end if;
    end process;
end Behavioral;

