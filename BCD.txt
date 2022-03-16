LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------------
ENTITY BCD IS
	PORT(
		result : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		dec : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		uni : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END ENTITY BCD;
-------------------------------------------------------------------------------------
ARCHITECTURE functional OF BCD IS
	SIGNAL posi_9 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL posi_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

	SIGNAL cout_nada : STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL comp_dec : STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL d_ec : STD_LOGIC_VECTOR (3 DOWNTO 0);
-------------------------------------
BEGIN
-- substraction bin1010 for decimal value 
	restDeciBCD_8bitsModule_10: ENTITY work.fulladder_8bits
	PORT MAP( 	a => result,
					b => "11110110",
					cin => '0',
					s => posi_9,
					cout => cout_nada(0));

	restDeciBCD_8bitsModule_20: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_9,
					b => "11110110",
					cin => '0',
					s => posi_8,
					cout => cout_nada(1));

	restDeciBCD_8bitsModule_30: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_8,
					b => "11110110",
					cin => '0',
					s => posi_7,
					cout => cout_nada(2));

	restDeciBCD_8bitsModule_40: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_7,
					b => "11110110",
					cin => '0',
					s => posi_6,
					Cout => cout_nada(3));

	restDeciBCD_8bitsModule_50: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_6,
					b => "11110110",
					cin => '0',
					s => posi_5,
					cout => cout_nada(4));

	restDeciBCD_8bitsModule_60: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_5,
					b => "11110110",
					cin => '0',
					s => posi_4,
					cout => cout_nada(5));

	restDeciBCD_8bitsModule_70: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_4,
					b => "11110110",
					cin => '0',
					s => posi_3,
					cout => cout_nada(6));

	restDeciBCD_8bitsModule_80: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_3,
					b => "11110110",
					cin => '0',
					s => posi_2,
					Cout => cout_nada(7));

	restDeciBCD_8bitsModule_90: ENTITY work.fulladder_8bits
	PORT MAP( 	a => posi_2,
					b => "11110110",
					cin => '0',
					s => posi_1,
					Cout => cout_nada(8));

	-- Comparator
	comp_dec(0) <= '1' when (result < "1010") else
						'0';
	comp_dec(1) <= '1' when (posi_9 < "1010") else
						'0';
	comp_dec(2) <= '1' when (posi_8 < "1010") else
						'0';
	comp_dec(3) <= '1' when (posi_7 < "1010") else
						'0';
	comp_dec(4) <= '1' when (posi_6 < "1010") else
						'0';
	comp_dec(5) <= '1' when (posi_5 < "1010") else
						'0';
	comp_dec(6) <= '1' when (posi_4 < "1010") else
						'0';
	comp_dec(7) <= '1' when (posi_3 < "1010") else
						'0';
	comp_dec(8) <= '1' when (posi_2 < "1010") else
						'0';
	comp_dec(9) <= '1' when (posi_1 < "1010") else
						'0';

	-- priority decimal
	d_ec <= 	"1001" when comp_dec(9)='1'else
				"1000" when comp_dec(8)='1'else
				"0111" when comp_dec(7)='1'else
				"0110" when comp_dec(6)='1'else
				"0101" when comp_dec(5)='1'else
				"0100" when comp_dec(4)='1'else
				"0011" when comp_dec(3)='1'else
				"0010" when comp_dec(2)='1'else
				"0001" when comp_dec(1)='1'else
				"0000";
	dec <= d_ec;
	-- unit value
		uni <=   result(3 DOWNTO 0) when d_ec="0000" else
					posi_9(3 DOWNTO 0) when d_ec= "0001"else
					posi_8(3 DOWNTO 0) when d_ec= "0010"else
					posi_7(3 DOWNTO 0) when d_ec= "0011"else
					posi_6(3 DOWNTO 0) when d_ec= "0100"else
					posi_5(3 DOWNTO 0) when d_ec= "0101"else
					posi_4(3 DOWNTO 0) when d_ec= "0110"else
					posi_3(3 DOWNTO 0) when d_ec= "0111"else
					posi_2(3 DOWNTO 0) when d_ec= "1000"else
					posi_1(3 DOWNTO 0) when d_ec= "1001"else
					"0000";

END ARCHITECTURE;