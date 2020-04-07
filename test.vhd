-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

	component tag_generator is
		 Port ( D0 : in STD_LOGIC_VECTOR (7 downto 0);
				  D1 : in STD_LOGIC_VECTOR (7 downto 0);
				  D2 : in STD_LOGIC_VECTOR (7 downto 0);
				  D3 : in STD_LOGIC_VECTOR (7 downto 0);
				  control : in STD_LOGIC_VECTOR (24 downto 0);
				  tag_result : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
   signal clk,reset : std_logic;
	constant clk_period : time := 10 ns;	
	signal D0,D1,D2,D3,tag_result : STD_LOGIC_VECTOR(7 downto 0);
	signal control : STD_LOGIC_VECTOR (24 downto 0);

		
    component swapper is
    Port ( control : in STD_LOGIC_VECTOR(12 downto 0);
           D0 : in STD_LOGIC_VECTOR(7 downto 0);
           D1 : in STD_LOGIC_VECTOR(7 downto 0);
           D2 : in STD_LOGIC_VECTOR(7 downto 0);
           D3 : in STD_LOGIC_VECTOR(7 downto 0);
           A0 : out STD_LOGIC_VECTOR(7 downto 0);
           A1 : out STD_LOGIC_VECTOR(7 downto 0);
           A2 : out STD_LOGIC_VECTOR(7 downto 0);
           A3 : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

	 component rotate_left_shift_8b is
		 Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
				  sft : in STD_LOGIC_VECTOR (2 downto 0);
				  B : out STD_LOGIC_VECTOR (7 downto 0));
	 end component;



    
    -- stage results and control signals
    signal swap_control : STD_LOGIC_VECTOR(12 downto 0);
    signal r0, r1, r2, r3 : STD_LOGIC_VECTOR(2 downto 0);
    signal A0, A1, A2, A3 : STD_LOGIC_VECTOR(7 downto 0);
    --signal B0, B1, B2, B3 : STD_LOGIC_VECTOR(7 downto 0);
    
    -- component input buffer
    signal swap_in_a, swap_in_b : STD_LOGIC_VECTOR(7 downto 0);
    signal swap_out_a, swap_out_b : STD_LOGIC_VECTOR(7 downto 0);
    signal b1, b2 : STD_LOGIC_VECTOR(1 downto 0);
    signal p1, p2 : STD_LOGIC_VECTOR(2 downto 0);
    signal s : STD_LOGIC_VECTOR(2 downto 0);
    
    -- swap buffer
    signal in_a, in_b : STD_LOGIC_VECTOR(7 downto 0);
    signal out_a, out_b : STD_LOGIC_VECTOR(7 downto 0);
    signal temp : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    -- start end position
    signal a_s, a_e : integer;
    signal b_s, b_e : integer;
    signal size : integer;
begin





		uut : tag_generator 
			port map (D0 => D0,
			D1 => D1,
			D2 => D2 ,
			D3 => D3,
			control => control,
			tag_result => tag_result);


  
     clk_process : PROCESS
     BEGIN
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;		
     END PROCESS ;
	  
	  Start: PROCESS
	  BEGIN
		 reset <= '1';
		 WAIT FOR 10 NS;
		 reset <= '0';
		 wait; 
	  END PROCESS ; 
			
			D0 <= "01010000";
			D1 <= "01001101";
			D2 <= "01001111";
			D3 <= "01000011";
			 
			control <= "1100001000010101000100110";
			
			

  END ;