library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipe_ex_mem is
    Port ( reset : in  STD_LOGIC;
		   clk : in  STD_LOGIC;
		   IDEX_reg_write : in STD_LOGIC;
		   IDEX_write_dsrc : in STD_LOGIC_VECTOR(1 downto 0);
		   IDEX_mem_read : in STD_LOGIC;
		   comp_result : in STD_LOGIC_VECTOR(31 downto 0);
		   tag_result : in STD_LOGIC_VECTOR(31 downto 0);
		   alu_result : in STD_LOGIC_VECTOR(31 downto 0);
		   reg_write_dst : in STD_LOGIC_VECTOR(3 downto 0);
		   EXMEM_reg_write : out STD_LOGIC;
		   EXMEM_write_dsrc : out STD_LOGIC_VECTOR(1 downto 0);
		   EXMEM_mem_read : out STD_LOGIC;
		   EXMEM_comp_result : out STD_LOGIC_VECTOR(31 downto 0);
		   EXMEM_tag_result : out STD_LOGIC_VECTOR(31 downto 0);
		   EXMEM_alu_result : out STD_LOGIC_VECTOR(31 downto 0);
		   EXMEM_reg_write_dst : out STD_LOGIC_VECTOR(3 downto 0) );
end pipe_ex_mem;

architecture Behavioral of pipe_ex_mem is
begin
    process (reset, clk)
    begin
        if (reset = '1') then
		   EXMEM_reg_write <= '0';
		   EXMEM_write_dsrc <= (others => '0');
		   EXMEM_mem_read <= '0';
		   EXMEM_comp_result <= (others => '0');
		   EXMEM_tag_result <= (others => '0');
		   EXMEM_alu_result <= (others => '0');
		   EXMEM_reg_write_dst <= (others => '0');
        elsif (rising_edge(clk)) then
		   EXMEM_reg_write <= IDEX_reg_write;
		   EXMEM_write_dsrc <= IDEX_write_dsrc;
		   EXMEM_mem_read <= IDEX_mem_read;
		   EXMEM_comp_result <= comp_result;
		   EXMEM_tag_result <= tag_result;
		   EXMEM_alu_result <= alu_result;
		   EXMEM_reg_write_dst <= reg_write_dst;
        end if;
    end process;
end Behavioral;

