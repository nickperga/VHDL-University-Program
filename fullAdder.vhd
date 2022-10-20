LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY fullAdder IS
PORT ( Cin, x, y : IN STD_LOGIC ;
		 s, Cout : OUT STD_LOGIC ) ;
END fullAdder ;

ARCHITECTURE LogicFunc OF fullAdder IS
BEGIN
s <= x XOR y XOR Cin ; --αποτέλεσμα αθροίσματος (ή διαφορετικά (x and  not y and not Cin) or (not x and y and not Cin) or not x and not y and Cin) or (x and y and Cin)
Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y) ; --κρατούμενο αθροίσματος
END LogicFunc ;