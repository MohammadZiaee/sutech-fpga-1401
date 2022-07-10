library ieee;
use ieee.std_logic_1164.all;


entity ProjectVHDL_testbench is
end entity ProjectVHDL_testbench;


architecture Behavioral of ProjectVHDL_testbench is
	component STATE_MACHINE
		port (
		      CLK , RESET , T_IN , L_IN : in std_logic;
		      M_IN : in std_logic_vector (2 downto 0);
		      
		      T_OUT , L_OUT : out std_logic;
			  STATE : out std_logic_vector (1 downto 0);
			  M_OUT : out std_logic_vector (2 downto 0);
			  SEG :out std_logic_vector (6 downto 0)
			  );
	end component ;


	signal CLK : std_logic := '0';
	signal RESET : std_logic := '0';
	signal T_IN : std_logic := '0';
	signal L_IN : std_logic := '0';
	signal M_IN: std_logic_vector (2 downto 0) := "000";
	
	signal T_OUT : std_logic := '0';
	signal L_OUT : std_logic := '0';
	signal STATE : std_logic_vector (1 downto 0) := "11";
	signal M_OUT : std_logic_vector (2 downto 0) := "000";
	signal SEG : std_logic_vector (6 downto 0) := "1000000";
	
	begin

		FA : STATE_MACHINE
			port map (CLK , RESET , T_IN , L_IN , M_IN , T_OUT , L_OUT , STATE , M_OUT , SEG);

		TEST : process
		
			begin
			
				CLK <= '0';
				RESET <= '1';
				wait for 50 ns;
--1
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '0';
				M_IN <= "100";
				wait for 50 ns;

				CLK <= '0';
				wait for 50 ns;
--2
				CLK <= '1';
				RESET <= '0';
				T_IN <= '1';
				L_IN <= '0';
				M_IN <= "010";
				wait for 50 ns;

				CLK <= '0';
				--RESET <= '0';
				--T_IN <= '1';
				--L_IN <= '0';
				--M_IN <= "101";
				wait for 50 ns;
--3
				CLK <= '1';
				RESET <= '0';
				T_IN <= '1';
				L_IN <= '1';
				M_IN <= "000";
				wait for 50 ns;

				CLK <= '0';
				wait for 50 ns;
--4
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '0';
				M_IN <= "110";
				wait for 50 ns;

				CLK <= '0';
				--RESET <= '0';
				--T_IN <= '1';
				--L_IN <= '1';
				--M_IN <= "111";
				wait for 50 ns;
--5
				CLK <= '1';
				RESET <= '1';
				T_IN <= '1';
				L_IN <= '0';
				M_IN <= "101";
				wait for 50 ns;

				CLK <= '0' ;
				wait for 50 ns;
--6
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '1';
				M_IN <= "011";
				wait for 50 ns;

				CLK <= '0';
				wait for 50 ns;
--7
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '0';
				M_IN <= "011";
				wait for 50 ns;
--8
				CLK <= '0';
				RESET <= '1';
				--T_IN <= '0';
				--L_IN <= '1';
				--M_IN <= "100";
				wait for 50 ns;
--9
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '0';
				M_IN <= "010";
				wait for 50 ns;

				CLK <= '0';
				RESET <= '0';
				--T_IN <= '1';
				--L_IN <= '0';
				--M_IN <= "011";
				wait for 50 ns;
--10
				CLK <= '1';
				RESET <= '0';
				T_IN <= '0';
				L_IN <= '1';
				M_IN <= "111";
				wait for 50 ns;

				CLK <= '0';
				wait for 50 ns;


				wait;
				
		end process TEST;

end architecture Behavioral;
