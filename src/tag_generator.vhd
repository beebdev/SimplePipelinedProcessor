-----------------------------------------------------------------------------------
-- COMP3211 Computer Architecture 20T1                                           --
-- Assignment 1                                                                  --
-- Author: Po Jui Shih (z5187581)                                                --
--         Wei Leong Soon (z5187379)                                             --
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tag_generator is
    Port ( D_in         : in STD_LOGIC_VECTOR (31 downto 0);
           control      : in STD_LOGIC_VECTOR (24 downto 0);
           tag_result   : out STD_LOGIC_VECTOR (31 downto 0));
end tag_generator;

architecture Behavioral of tag_generator is
    -- Components used: swapper, rotate_left_shift_8b
    component swapper is
    Port ( control  : in STD_LOGIC_VECTOR(12 downto 0);
           D0       : in STD_LOGIC_VECTOR(7 downto 0);
           D1       : in STD_LOGIC_VECTOR(7 downto 0);
           D2       : in STD_LOGIC_VECTOR(7 downto 0);
           D3       : in STD_LOGIC_VECTOR(7 downto 0);
           A0       : out STD_LOGIC_VECTOR(7 downto 0);
           A1       : out STD_LOGIC_VECTOR(7 downto 0);
           A2       : out STD_LOGIC_VECTOR(7 downto 0);
           A3       : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    component rotate_left_shift_8b is
    Port ( A    : in STD_LOGIC_VECTOR (7 downto 0);
           sft  : in STD_LOGIC_VECTOR (2 downto 0);
           B    : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
 
    -- Stage results and control signals
    signal r0, r1, r2, r3 : STD_LOGIC_VECTOR(2 downto 0);
    signal A0, A1, A2, A3 : STD_LOGIC_VECTOR(7 downto 0);
    signal B0, B1, B2, B3 : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Component input buffer
    signal swap_in_a, swap_in_b     : STD_LOGIC_VECTOR(7 downto 0);
    signal swap_out_a, swap_out_b   : STD_LOGIC_VECTOR(7 downto 0);
begin

    -- Extract control signals from control
    r0 <= control(15 downto 13);
    r1 <= control(18 downto 16);
    r2 <= control(21 downto 19);
    r3 <= control(24 downto 22);
    
    swap_process : swapper
    port map( control => control(12 downto 0),
              D0 => D_in(31 downto 24),
              D1 => D_in(23 downto 16),
              D2 => D_in(15 downto 8),
              D3 => D_in(7 downto 0),
              A0 => A0,
              A1 => A1,
              A2 => A2,
              A3 => A3);
				 
	-- Rotate left each byte by r#
	rol_0 : rotate_left_shift_8b 
	port map( A => A0,
			  sft => r0,
			  B => B0);
			  
    rol_1 : rotate_left_shift_8b 
	port map( A => A1,
			  sft => r1,
			  B => B1);

    rol_2 : rotate_left_shift_8b 
	port map( A => A2,
			  sft => r2,
			  B => B2); 

	rol_3 : rotate_left_shift_8b 
	port map( A => A3,
			  sft => r3,
			  B => B3);

    -- XOR B to get tag_result	  
	tag_result(7 downto 0) <= B3 XOR B2 XOR B1 XOR B0;
    tag_result(31 downto 8) <= (others => '0');	
	
end Behavioral;
