library ieee; 
use ieee.std_logic_1164.all ;

entity ALU_16bit is
	port (a, b: in std_logic_vector(15 downto 0);
			Opcode: in std_logic_vector(2 downto 0);
			Cout: out std_logic ;
			Result: out std_logic_vector(15 downto 0) );
end ALU_16bit;

architecture LogicFunc of ALU_16bit is 
	
	component Alu_1bit is
		PORT (a, b, Ainvert, Binvert, Cin: IN STD_LOGIC ;
				Opcode : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
				Cout, Result : OUT STD_LOGIC )  ;
	end component;
	
	component Control_Circuit is 
		port(opcode: IN STD_LOGIC_VECTOR(2 downto 0);
			  result: OUT STD_LOGIC_VECTOR(4 downto 0));
	end component;
	
	component Bitinverter is
		port(bit1, Invert: IN STD_LOGIC ;
			  result : OUT STD_LOGIC) ;
	end component;
	
	component fullAdder is 
		PORT ( Cin, x, y : IN STD_LOGIC ;
				 s, Cout : OUT STD_LOGIC ) ;
	end component;
	
	signal C: std_logic_vector(14 downto 0);--Το Cin όλων των σταδίων πέραν του 1ου
	signal res: std_logic_vector(4 downto 0);
begin 
	stage0: Control_Circuit port map(Opcode, res);
	stage2: Alu_1bit port map(a(0), b(0), res(2), res(3), res(4), res(1 downto 0), C(0), Result(0));
	stage3: Alu_1bit port map(a(1), b(1), res(2), res(3), C(0), res(1 downto 0), C(1), Result(1));
	stage4: Alu_1bit port map(a(2), b(2), res(2), res(3), C(1), res(1 downto 0), C(2), Result(2));
	stage5: Alu_1bit port map(a(3), b(3), res(2), res(3), C(2), res(1 downto 0), C(3), Result(3));
	stage6: Alu_1bit port map(a(4), b(4), res(2), res(3), C(3), res(1 downto 0), C(4), Result(4));
	stage7: Alu_1bit port map(a(5), b(5), res(2), res(3), C(4), res(1 downto 0), C(5), Result(5));
	stage8: Alu_1bit port map(a(6), b(6), res(2), res(3), C(5), res(1 downto 0), C(6), Result(6));
	stage9: Alu_1bit port map(a(7), b(7), res(2), res(3), C(6), res(1 downto 0), C(7), Result(7));
	stage10: Alu_1bit port map(a(8), b(8), res(2), res(3), C(7), res(1 downto 0), C(8), Result(8));
	stage11: Alu_1bit port map(a(9), b(9), res(2), res(3), C(8), res(1 downto 0), C(9), Result(9));
	stage12: Alu_1bit port map(a(10), b(10), res(2), res(3), C(9), res(1 downto 0), C(10), Result(10));
	stage13: Alu_1bit port map(a(11), b(11), res(2), res(3), C(10), res(1 downto 0), C(11), Result(11));
	stage14: Alu_1bit port map(a(12), b(12), res(2), res(3), C(11), res(1 downto 0), C(12), Result(12));
	stage15: Alu_1bit port map(a(13), b(13), res(2), res(3), C(12), res(1 downto 0), C(13), Result(13));
	stage16: Alu_1bit port map(a(14), b(14), res(2), res(3), C(13), res(1 downto 0), C(14), Result(14));
	stage17: Alu_1bit port map(a(15), b(15), res(2), res(3), C(14), res(1 downto 0), Cout, Result(15));
end LogicFunc;