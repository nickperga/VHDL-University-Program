LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Alu_1bit IS -- Η υλοποίηση της Alu
	PORT (a, b, Ainvert, Binvert, Cin: IN STD_LOGIC ;
			Opcode: IN STD_LOGIC_VECTOR(1 downto 0);
			Cout, Result : OUT STD_LOGIC )  ;
END Alu_1bit;

ARCHITECTURE LogicFunc OF Alu_1bit IS
	
	COMPONENT fullAdder IS 
		PORT ( Cin, x, y : IN STD_LOGIC ;
				 s, Cout : OUT STD_LOGIC ) ;
	END COMPONENT ;
	
	COMPONENT Bitinverter IS
		port(bit1, Invert: IN STD_LOGIC ;
			  result : OUT STD_LOGIC) ;
	END COMPONENT ; 
	
	SIGNAL a1, b1, r0, r1, r2, r3:STD_LOGIC;
	SIGNAL res: STD_LOGIC_VECTOR(4 downto 0);
BEGIN
	 Line0: Bitinverter PORT MAP(a, Ainvert, a1) ;-- Έλεγχος αναστροφής της τιμής του bit a
	 Line1: Bitinverter PORT MAP(b, Binvert, b1) ;-- Έλεγχος αναστροφής της τιμής του bit b
	 Line2: r0 <= a1 and b1; --Αποτέλεσμα της and πύλης
	 Line3: r1 <= a1 or b1; --Αποτέλεσμα της or πύλης
	 Line4: fullAdder PORT MAP(Cin, a1, b1, r2, Cout); --Αποτέλεσμα του full adder
	 Line5: r3 <= a1 xor b1; --Αποτέλεσμα της xor πύλης
	 with Opcode select
			Result <= r0 when "00",
						 r1 when "01",
						 r2 when "10",
						 r3 when others;

END LogicFunc;
