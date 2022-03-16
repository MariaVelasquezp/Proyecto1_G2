-------------------------------------------------------
-- fulladerFourBits compares two 2-bit words to determine 
-- it hey hold equal value. The output bit eq is set if the
-- inputs are holding the same value.
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY fulladerFourBits IS
	PORT(		a			:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				b			:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				cin		:	IN		STD_LOGIC;
				s			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);			
				cout		:	OUT	STD_LOGIC);

END ENTITY fulladerFourBits;
-------------------------------------------------------
ARCHITECTURE structural OF fulladerFourBits IS
	SIGNAL cout0, cout1, cout2	:	STD_LOGIC;
BEGIN

	-- Component Instantiation
	fullader_one_bitModule_0: ENTITY work.fullader_one_bit
	PORT MAP(	A		=>	a(0),
					B		=> b(0),
					Cin	=> cin,
					S		=> s(0),
					Cout	=> cout0);
						
	fullader_one_bitModule_1: ENTITY work.fullader_one_bit
	PORT MAP(	A		=>	a(1),
					B		=> b(1),
					Cin	=> cout0,
					S		=> s(1),
					Cout	=> cout1);
	
	fullader_one_bitModule_2: ENTITY work.fullader_one_bit
	PORT MAP(	A		=>	a(2),
					B		=> b(2),
					Cin	=> cout1,
					S		=> s(2),
					Cout	=> cout2);
	
	fullader_one_bitModule_3: ENTITY work.fullader_one_bit
	PORT MAP(	A		=>	a(3),
					B		=> b(3),
					Cin	=> cout2,
					S		=> s(3),
					Cout	=> cout);
											
END ARCHITECTURE structural;
