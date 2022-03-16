-------------------------------------------------------
-- fullader_one_bit can add in binary two inputs 
--- (of 1 bit each one) taking into account the count.
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY fullader_one_bit IS
	PORT(		A			:	IN		STD_LOGIC;
				B			:	IN		STD_LOGIC;
				Cin		:	IN		STD_LOGIC;
				S			:	OUT	STD_LOGIC;			
				Cout		:	OUT	STD_LOGIC);
END ENTITY fullader_one_bit;
-------------------------------------------------------
ARCHITECTURE gateLevel OF fullader_one_bit IS
	SIGNAL 	p0		:	STD_LOGIC;
	SIGNAL 	p1		:	STD_LOGIC;
	SIGNAL 	p2		:	STD_LOGIC;
-------------------------------------------------------
BEGIN

	p0 	<= (A XOR B);
	-- S
	S 		<= Cin XOR p0;
	
	-- Cout
	p1 	<= Cin AND p0;
	p2 	<= A AND B;
	Cout	<= p1 OR p2;
END ARCHITECTURE gateLevel;
