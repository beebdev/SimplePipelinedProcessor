library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipelined_core is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC);
end pipelined_core;

architecture Behavioral of pipelined_core is
    ---------IF Components----------------------------------
    component program_counter is
        port ( reset    : in  std_logic;
               clk      : in  std_logic;
               addr_in  : in  std_logic_vector(3 downto 0);
               addr_out : out std_logic_vector(3 downto 0) );
    end component;
    
    component instruction_memory is
        Port ( reset    : in STD_LOGIC;
               clk      : in STD_LOGIC;
               addr_in  : in STD_LOGIC_VECTOR (3 downto 0);
               insn_out : out STD_LOGIC_VECTOR (31 downto 0) );
    end component;
    
    component adder_4b is
        Port ( src_a : in STD_LOGIC_VECTOR (3 downto 0);
               src_b : in STD_LOGIC_VECTOR (3 downto 0);
               sum : out STD_LOGIC_VECTOR (3 downto 0);
               carry_out : out STD_LOGIC );
    end component;
   
    component pipe_if_id is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               inst_in : in  STD_LOGIC_VECTOR (15 downto 0);
               inst_out : out  STD_LOGIC_VECTOR (15 downto 0) );
    end component;

    ---------ID Components----------------------------------
    component control_unit is
        Port ( opcode : in STD_LOGIC_VECTOR (3 downto 0);
               reg_write : out STD_LOGIC;
               write_dsrc : out STD_LOGIC_VECTOR(1 downto 0);
               mem_read : out STD_LOGIC;
               reg_dst : out STD_LOGIC;
               alu_src : out STD_LOGIC );
    end component;
    
    component register_file is
        Port ( reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               read_register_a : in STD_LOGIC_VECTOR (3 downto 0);
               read_register_b : in STD_LOGIC_VECTOR (3 downto 0);
               write_enable : in STD_LOGIC;
               write_register : in STD_LOGIC_VECTOR (3 downto 0);
               write_data : in STD_LOGIC_VECTOR (31 downto 0);
               read_data_a : out STD_LOGIC_VECTOR (31 downto 0);
               read_data_b : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component sign_extend_NtoM is
        generic (N : integer;
                 M : integer );
        Port ( data_in : in STD_LOGIC_VECTOR (N downto 0);
               data_out : out STD_LOGIC_VECTOR (M downto 0));
    end component;
    
    component pipe_id_ex is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           reg_write : in STD_LOGIC;
           write_dsrc : in STD_LOGIC_VECTOR(1 downto 0);
           mem_read : in STD_LOGIC;
           reg_dst : in STD_LOGIC;
           alu_src : in STD_LOGIC;
           read_data_a : in STD_LOGIC_VECTOR(31 downto 0);
           read_data_b : in STD_LOGIC_VECTOR(31 downto 0);
           sign_ext_offset : in STD_LOGIC_VECTOR(31 downto 0);
           rt : in STD_LOGIC_VECTOR(3 downto 0);
           rd : in STD_LOGIC_VECTOR(3 downto 0);
           IDEX_reg_write : out STD_LOGIC;
           IDEX_write_dsrc : out STD_LOGIC_VECTOR(1 downto 0);
           IDEX_mem_read : out STD_LOGIC;
           IDEX_reg_dst : out STD_LOGIC;
           IDEX_alu_src : out STD_LOGIC;
           IDEX_read_data_a : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_read_data_b : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_sign_ext_offset : out STD_LOGIC_VECTOR(31 downto 0);
           IDEX_rt : out STD_LOGIC_VECTOR(3 downto 0);
           IDEX_rd : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
    
    ---------EX Components----------------------------------
    component tag_generator is
        Port ( D_in : in STD_LOGIC_VECTOR (31 downto 0);
               control : in STD_LOGIC_VECTOR (24 downto 0);
               tag_result : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component comparator is
        Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
               data_b : in STD_LOGIC_VECTOR (7 downto 0);
               eq : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component adder_Nb is
    generic (N : integer);
    Port ( src_a : in STD_LOGIC_VECTOR (N-1 downto 0);
           src_b : in STD_LOGIC_VECTOR (N-1 downto 0);
           sum : out STD_LOGIC_VECTOR (N-1 downto 0);
           carry_out : out STD_LOGIC );
    end component;
    
    component mux_2to1_Nb is
    generic (N : integer);
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_b : in STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;
    
    component pipe_ex_mem is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               tag_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
               alu_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
               reg_address_in : in  STD_LOGIC_VECTOR (31 downto 0);
               tag_result_out : out  STD_LOGIC_VECTOR (31 downto 0);
               alu_result_out : out  STD_LOGIC_VECTOR (31 downto 0);
               reg_address_out : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;

    ---------MEM Components---------------------------------
    component data_memory is
        Port ( reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               write_enable : in STD_LOGIC;
               write_data : in STD_LOGIC_VECTOR (32 downto 0);
               addr_in : in STD_LOGIC_VECTOR (3 downto 0);
               data_out : out STD_LOGIC_VECTOR (32 downto 0));
    end component;
    
    component pipe_mem_wb is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               tag_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
               data_in : in  STD_LOGIC_VECTOR (31 downto 0);
               alu_result_in : in  STD_LOGIC_VECTOR (31 downto 0);
               tag_result_out : out  STD_LOGIC_VECTOR (31 downto 0);
               data_out : out  STD_LOGIC_VECTOR (31 downto 0);
               alu_result_out : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    ---------IF signals--------------------------------------
    signal sig_curr_pc              : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_next_pc              : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_pc_carry             : STD_LOGIC;
    signal sig_one_4b               : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_insn                 : STD_LOGIC_VECTOR(15 downto 0);
    signal sig_ifid_insn            : STD_LOGIC_VECTOR(15 downto 0);
    
    ---------ID signals--------------------------------------
    signal sig_reg_write            : STD_LOGIC;
    signal sig_write_dsrc           : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_mem_read             : STD_LOGIC;
    signal sig_reg_dst              : STD_LOGIC;
    signal sig_alu_src              : STD_LOGIC;
    signal sig_read_data_a          : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_read_data_b          : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_sign_ext_offset      : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_IDEX_reg_write       : STD_LOGIC;
    signal sig_IDEX_write_dsrc      : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_IDEX_mem_read        : STD_LOGIC;
    signal sig_IDEX_reg_dst         : STD_LOGIC;
    signal sig_IDEX_alu_src         : STD_LOGIC;
    signal sig_IDEX_read_data_a     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_IDEX_read_data_b     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_IDEX_sign_ext_offset : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_IDEX_rt              : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_IDEX_rd              : STD_LOGIC_VECTOR(3 downto 0);
    
    ---------EX signals--------------------------------------
    signal sig_comp_result          : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_tag_result           : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_alusrc_b             : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_alu_result           : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_carry_out            : STD_LOGIC;
    signal sig_reg_write_dst        : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_EXMEM_reg_write      : STD_LOGIC;
    signal sig_EXMEM_write_dsrc     : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_EXMEM_mem_read       : STD_LOGIC;
    signal sig_EXMEM_comp_result    : STD_LOGIC;
    signal sig_EXMEM_tag_result     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_EXMEM_alu_result     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_EXMEM_reg_write_dst  : STD_LOGIC_VECTOR(3 downto 0);
    
    ---------MEM signals--------------------------------------
    signal sig_dmem_read_data       : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_WB_reg_write         : STD_LOGIC;
    signal sig_WB_write_dsrc        : STD_LOGIC_VECTOR(1 downto 0);
    signal sig_MEMWB_comp_result    : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_MEMWB_tag_result     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_MEMWB_dmem_read_data : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_MEMWB_alu_result     : STD_LOGIC_VECTOR(31 downto 0);
    signal sig_WB_reg_write_dst     : STD_LOGIC_VECTOR(3 downto 0);
    signal sig_WB_data              : STD_LOGIC_VECTOR(31 downto 0);
    
begin

	-------INSTRUCTION FETCHING-----------
    sig_one_4b <= "0001";

    pc : program_counter
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_next_pc,
               addr_out => sig_curr_pc );

    next_pc : adder_4b 
    port map ( src_a     => sig_curr_pc, 
               src_b     => sig_one_4b,
               sum       => sig_next_pc,   
               carry_out => sig_pc_carry );
					
    insn_mem : instruction_memory 
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_curr_pc,
               insn_out => sig_insn );

    pipe_IFID : pipe_if_id
    port map ( reset    => reset,
               clk      => clk,
               inst_in  => sig_insn,
               inst_out => sig_ifid_insn );
               
    ----------Instruction Decode-----------
    ctrl_unit : control_unit
    port map ( opcode       => sig_ifid_insn(15 downto 12),
               reg_write    => sig_reg_write,
               write_dsrc   => sig_write_dsrc,
               mem_read     => sig_mem_read,
               reg_dst      => sig_reg_dst,
               alu_src      => sig_alu_src);
           
    reg_file : register_file
    port map ( reset            => reset,
               clk              => clk,
               read_register_a  => sig_ifid_insn(11 downto 8),
               read_register_b  => sig_ifid_insn(7 downto 4),
               write_enable     => sig_WB_reg_write,
               write_register   => sig_WB_reg_write_dst,
               write_data       => sig_WB_data,
               read_data_a      => sig_read_data_a,
               read_data_b      => sig_read_data_b );
 
    sign_ext_4to32  : sign_extend_NtoM
    generic map (N      => 4,
                 M      => 32 )
    port map ( data_in  => sig_insn(3 downto 0),
               data_out => sig_sign_ext_offset );
            
    pipe_IDEX : pipe_id_ex
    Port map ( reset => reset,
               clk => clk,
               reg_write => sig_reg_write,
               write_dsrc => sig_write_dsrc,
               mem_read => sig_mem_read,
               reg_dst => sig_reg_dst,
               alu_src => sig_alu_src,
               read_data_a => sig_read_data_a,
               read_data_b => sig_read_data_b,
               sign_ext_offset => sig_sign_ext_offset,
               rt => sig_insn(7 downto 4),
               rd => sig_insn(3 downto 0),
               IDEX_reg_write => sig_IDEX_reg_write,
               IDEX_write_dsrc => sig_IDEX_write_dsrc,
               IDEX_mem_read => sig_IDEX_mem_read,
               IDEX_reg_dst => sig_IDEX_reg_dst,
               IDEX_alu_src => sig_IDEX_alu_src,
               IDEX_read_data_a => sig_IDEX_read_data_a,
               IDEX_read_data_b => sig_IDEX_read_data_b,
               IDEX_sign_ext_offset => sig_IDEX_sign_ext_offset,
               IDEX_rt => sig_IDEX_rt,
               IDEX_rd => sig_IDEX_rd );
 
    ----------Execution-----------
    compare : comparator
    port map ( data_a => sig_IDEX_read_data_a,
               data_b => sig_IDEX_read_data_b,
               eq => sig_comp_result);
               
    tag_gen : tag_generator
    port map ( D_in => sig_IDEX_read_data_a,
               control => sig_IDEX_read_data_b(24 downto 0),
               tag_result => sig_tag_result);

    mux_2to1_32b : mux_2to1_Nb
    generic map (N => 32)
    port map ( mux_select   => sig_IDEX_alu_src,
               data_a       => sig_IDEX_sign_ext_offset,
               data_b       => sig_IDEX_read_data_b,
               data_out     => sig_alusrc_b );
                   
    adder_32b : adder_Nb
    generic map (N => 32)
    port map ( src_a        => sig_IDEX_read_data_a,
               src_b        => sig_alusrc_b,
               sum          => sig_alu_result,
               carry_out    => sig_carry_out );
               
    



end Behavioral;
