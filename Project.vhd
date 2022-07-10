library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SevenSeg is
    Port ( cond: in STD_LOGIC_VECTOR (3 downto 0);
           n: out STD_LOGIC_VECTOR (3 downto 0);   
           segment_seven : out STD_LOGIC_VECTOR (7 downto 0) 
          ); 
end SevenSeg;


architecture Structure of SevenSeg is

begin


 sevenSegProcess: process (cond)
    begin
    
               if (cond = "1111") then     
                   n <="1110";  
                   segment_seven <= "10001001";-- H
          
               else           
                   n <= "1110"; 
                   segment_seven <= "10111111";-- -
                       
               end if;

    
    end process;
       
end Structure;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity Finite_State_Machine is
	Port (T, L, CLK, RESET : in std_logic;
	      M : in std_logic_vector (2 downto 0);
	      STATE : out std_logic_vector(1 downto 0);
              an : out STD_LOGIC_VECTOR (3 downto 0);
              seg : out STD_LOGIC_VECTOR (7 downto 0);
	      Z1 : out std_logic;
	      MOUT : out std_logic_vector (2 downto 0);
	      TOUT : out std_logic;
	      LOUT : out std_logic);
End Finite_State_Machine;


Architecture MyStructure of Finite_State_Machine is

component SevenSeg 
    port (cond : in std_logic_vector (3 downto 0);
          n : out std_logic_vector (3 downto 0);
          segment_seven : out std_logic_vector (7 downto 0));
end component;

	Type state_type is (ST0, ST1);
	Signal PresentS, NextS : state_type;
	Signal C : std_logic_vector (3 downto 0);
Begin

seg_seven_module : SevenSeg
port map (cond => C, n => an, segment_seven => seg);

	MyProcess : process(CLK, NextS, RESET)
	Begin
		if (RESET = '1') then PresentS <= ST0;
		Elsif (rising_edge(CLK)) then PresentS <= NextS;
		End if;
	End process MyProcess;


	Conditions: process(PresentS, T, L, M)
	Begin
		Z1 <= '0';
		Case PresentS is
			When ST1 =>
				If (M >= "111") then NextS <= ST0; Z1 <= '0'; C <= "0000"; MOUT <= M; TOUT <= T; LOUT <= L;
				elsif (M >= "011") and (T = '1' or L = '1') then NextS <= ST0; Z1 <= '0'; C <= "0000"; MOUT <= M; TOUT <= T; LOUT <= L;
				Else NextS <= ST1; Z1 <= '1'; C <= "1111"; MOUT <= M; TOUT <= T; LOUT <= L;
				end if;
			When ST0 => 
				If (T = '1' or L = '1') and (M <= "001") then NextS <= ST1; Z1 <= '1'; C <= "1111"; MOUT <= M; TOUT <= T; LOUT <= L;
				Elsif (T = '0' and L = '0') and (M <= "011") then NextS <= ST1; Z1 <= '1'; C <= "1111"; MOUT <= M; TOUT <= T; LOUT <= L;
				Else NextS <= ST0; Z1 <= '0'; C <= "0000"; MOUT <= M; TOUT <= T; LOUT <= L;
				end if;
			when others =>
				Z1 <= '0'; NextS <= ST0; C <= "0000"; MOUT <= M; TOUT <= T; LOUT <= L;
		End case;
	End process Conditions;

	With PresentS select
		STATE <= "00" when ST0,
	         "01" when ST1,
	         "11" when others;
End MyStructure;