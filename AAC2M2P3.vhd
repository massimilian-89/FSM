library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;
architecture  finit_state of FSM is 
type machine_state is ( A, B, C);
signal state : machine_state; 
begin
FSM_process : process ( CLK, RST) 
begin
if (RST = '1') then 
	state <= A;
elsif (rising_edge(CLK)) then 
	case state is 
		when A =>
			if In1='1' then state <= B ;
			else state <= A;
			end if;
		when B =>
			if In1 = '0' then state <= C;
			else state <= B;
			end if ;
		when C =>
			if In1='1' then state <= A ;
			else state <= C;
			end if;
		when others => state <= A;
	end case;
end if ;
end process; 
Out1<= '1' when state = C else '0';
end architecture; 