library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipe_mem_wb is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           EXMEM_reg_write : in STD_LOGIC;
           EXMEM_write_dsrc : in STD_LOGIC_VECTOR(1 downto 0);
           EXMEM_comp_result : in STD_LOGIC_VECTOR(31 downto 0);
           EXMEM_tag_result : in STD_LOGIC_VECTOR(31 downto 0);
           dmem_read_data : in STD_LOGIC_VECTOR(31 downto 0);
           EXMEM_alu_result : in STD_LOGIC_VECTOR(31 downto 0);
           EXMEM_reg_write_dst : in STD_LOGIC_VECTOR(3 downto 0);
           WB_reg_write : out STD_LOGIC;
           WB_write_dsrc : out STD_LOGIC_VECTOR(1 downto 0);
           MEMWB_comp_result : out STD_LOGIC_VECTOR(31 downto 0);
           MEMWB_tag_result : out STD_LOGIC_VECTOR(31 downto 0);
           MEMWB_dmem_read_data : out STD_LOGIC_VECTOR(31 downto 0);
           MEMWB_alu_result : out STD_LOGIC_VECTOR(31 downto 0);
           WB_reg_write_dst : out STD_LOGIC_VECTOR(3 downto 0) );
end pipe_mem_wb;

architecture Behavioral of pipe_mem_wb is
begin
    process (reset, clk)
    begin
        if (reset = '1') then
            WB_reg_write <= '0';
            WB_write_dsrc <= (others => '0');
            MEMWB_comp_result <= (others => '0');
            MEMWB_tag_result <= (others => '0');
            MEMWB_dmem_read_data <= (others => '0');
            MEMWB_alu_result <= (others => '0');
            WB_reg_write_dst <= (others => '0');
        elsif (rising_edge(clk)) then
            WB_reg_write <= EXMEM_reg_write;
            WB_write_dsrc <= EXMEM_write_dsrc;
            MEMWB_comp_result <= EXMEM_comp_result;
            MEMWB_tag_result <= EXMEM_tag_result;
            MEMWB_dmem_read_data <= dmem_read_data;
            MEMWB_alu_result <= EXMEM_alu_result;
            WB_reg_write_dst <= EXMEM_reg_write_dst;
        end if;
    end process;
end Behavioral;

