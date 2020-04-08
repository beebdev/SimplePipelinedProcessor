----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2020 13:18:57
-- Design Name: 
-- Module Name: pipelined_core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipelined_core is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC);
end pipelined_core;

architecture Behavioral of pipelined_core is

component program_counter is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(3 downto 0);
           addr_out : out std_logic_vector(3 downto 0) );
end component;

component adder_4b is
    Port ( src_a : in STD_LOGIC_VECTOR (3 downto 0);
           src_b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           carry_out : out STD_LOGIC );
end component;


component instruction_memory is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (3 downto 0);
           insn_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component pipe_if_id is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (3 downto 0);
           instruction_out : out  STD_LOGIC_VECTOR (15 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (3 downto 0));
end component;




signal sig_next_pc              : std_logic_vector(3 downto 0);
signal sig_curr_pc              : std_logic_vector(3 downto 0);
signal sig_one_4b               : std_logic_vector(3 downto 0);
signal sig_if_pc					  : std_logic_vector(3 downto 0);
signal sig_pc_carry_out         : std_logic;
signal sig_insn                 : std_logic_vector(15 downto 0);
signal sig_sign_extended_offset : std_logic_vector(15 downto 0);
signal sig_if_insn				  : std_logic_vector(15 downto 0);

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
               carry_out => sig_pc_carry_out );
					
	 insn_mem : instruction_memory 
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_curr_pc,
               insn_out => sig_insn );
					
	 --pipelining
	 pipeline_IF_ID :  pipe_if_id
	 port map ( reset 	=> reset,
					clk 		=> clk,
					pc_in    => sig_next_pc,
					instruction_in => sig_insn,
					pc_out   => sig_if_pc,
					instruction_out => sig_if_insn);
	 
	 
				
					
	 
	 -------INSTRUCTION DECODER-----------




end Behavioral;
