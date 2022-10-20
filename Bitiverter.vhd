library ieee ;
use ieee.std_logic_1164.all ;

entity Bitinverter is --Ουσιαστικά συνάρτηση η οποία δέχεται τη τιμή ενός bit και μια άλλη τιμή και επιστρέφει είτε αυτούσια την τιμή του bit είτε την αντίθετή της 
	port(bit1, Invert: IN STD_LOGIC ;
		  result : OUT STD_LOGIC) ;
end Bitinverter;

architecture Logicfunc of Bitinverter is
	signal c : STD_LOGIC ;
begin
	process(c, Invert) --Χρήση του process ώστε να χρησιμοποιηθεί το if statement
	begin
		c <= bit1;
		if Invert = '1' then 
			result <= not c;
		else
			result <= c;
		end if;
	end process;
end LogicFunc;