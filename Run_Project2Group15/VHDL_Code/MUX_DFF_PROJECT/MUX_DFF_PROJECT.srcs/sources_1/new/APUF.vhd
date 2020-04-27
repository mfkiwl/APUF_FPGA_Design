library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity APUF is
    Port ( Q : inout STD_LOGIC;
           Clk: out STD_LOGIC;
           din : out STD_LOGIC);
end APUF;

architecture Behavioral of APUF is
component MyMUX2
Port (   A : in STD_LOGIC;
         B : in STD_LOGIC;
         S : in STD_LOGIC;
         Y : out STD_LOGIC);
end component;

component DDF
Port(
         Q : out std_logic;    
         Clk :in std_logic;   
         D :in  std_logic);
end component;

component BRAM_wrapper
Port (
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_we : in STD_LOGIC;
    BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_clk : in STD_LOGIC;
    BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_we : in STD_LOGIC);
end component;
signal A: std_logic := '1';
signal B: std_logic := '1';
signal C: STD_LOGIC_VECTOR(63 downto 0) := B"1101010001111110111111111101111111001001001111110100111111110011";
signal above_vector:  std_logic_vector(63 downto 0) := (others => '0');
signal below_vector:  std_logic_vector(63 downto 0) := (others => '0');
signal BRAM_PORTA_0_addr : STD_LOGIC_VECTOR ( 5 downto 0 ) := B"000000";
signal BRAM_PORTA_0_clk : STD_LOGIC := '0';
signal BRAM_PORTA_0_din : STD_LOGIC_VECTOR ( 63 downto 0 ) := B"1101010001111110111111111101111111001001001111110100111111110011";
signal BRAM_PORTA_0_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
signal BRAM_PORTA_0_we : STD_LOGIC := '0';
signal BRAM_PORTB_0_addr : STD_LOGIC_VECTOR ( 5 downto 0 ) := B"000000";
signal BRAM_PORTB_0_clk : STD_LOGIC := '0';
signal BRAM_PORTB_0_din : STD_LOGIC_VECTOR ( 63 downto 0 );
signal BRAM_PORTB_0_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
signal BRAM_PORTB_0_we : STD_LOGIC := '1';

begin    
    BRAM_i: component BRAM_wrapper
     port map (
      BRAM_PORTA_0_addr(63 downto 0) => BRAM_PORTA_0_addr(5 downto 0),
      BRAM_PORTA_0_clk => BRAM_PORTA_0_clk,
      BRAM_PORTA_0_din(63 downto 0) => BRAM_PORTA_0_din(63 downto 0),
      BRAM_PORTA_0_dout(63 downto 0) => BRAM_PORTA_0_dout(63 downto 0),
      BRAM_PORTA_0_we => BRAM_PORTA_0_we,
      BRAM_PORTB_0_addr(63 downto 0) => BRAM_PORTB_0_addr(5 downto 0),
      BRAM_PORTB_0_clk => BRAM_PORTB_0_clk,
      BRAM_PORTB_0_din(63 downto 0) => BRAM_PORTB_0_din(63 downto 0),
      BRAM_PORTB_0_dout(63 downto 0) => BRAM_PORTB_0_dout(63 downto 0),
      BRAM_PORTB_0_we => BRAM_PORTB_0_we
    );
    U1: myMUX2 port map (A, B, C(0), above_vector(0));
    U2: myMUX2 port map (B, A, C(0), below_vector(0));
    U3: myMUX2 port map (above_vector(0), below_vector(0), C(1), above_vector(1));
    U4: myMUX2 port map (below_vector(0), above_vector(0), C(1), below_vector(1));
    U5: myMUX2 port map (above_vector(1), below_vector(1), C(2), above_vector(2));
    U6: myMUX2 port map (below_vector(1), above_vector(1), C(2), below_vector(2));
    U7: myMUX2 port map (above_vector(2), below_vector(2), C(3), above_vector(3));
    U8: myMUX2 port map (below_vector(2), above_vector(2), C(3), below_vector(3));
    U9: myMUX2 port map (above_vector(3), below_vector(3), C(4), above_vector(4));
    U10: myMUX2 port map (below_vector(3), above_vector(3), C(4), below_vector(4));
    U11: myMUX2 port map (above_vector(4), below_vector(4), C(5), above_vector(5));
    U12: myMUX2 port map (below_vector(4), above_vector(4), C(5), below_vector(5));
    U13: myMUX2 port map (above_vector(5), below_vector(5), C(6), above_vector(6));
    U14: myMUX2 port map (below_vector(5), above_vector(5), C(6), below_vector(6));
    U15: myMUX2 port map (above_vector(6), below_vector(6), C(7), above_vector(7));
    U16: myMUX2 port map (below_vector(6), above_vector(6), C(7), below_vector(7));
    U17: myMUX2 port map (above_vector(7), below_vector(7), C(8), above_vector(8));
    U18: myMUX2 port map (below_vector(7), above_vector(7), C(8), below_vector(8));
    U19: myMUX2 port map (above_vector(8), below_vector(8), C(9), above_vector(9));
    U20: myMUX2 port map (below_vector(8), above_vector(8), C(9), below_vector(9));
    U21: myMUX2 port map (above_vector(9), below_vector(9), C(10), above_vector(10));
    U22: myMUX2 port map (below_vector(9), above_vector(9), C(10), below_vector(10));
    U23: myMUX2 port map (above_vector(10), below_vector(10), C(11), above_vector(11));
    U24: myMUX2 port map (below_vector(10), above_vector(10), C(11), below_vector(11));
    U25: myMUX2 port map (above_vector(11), below_vector(11), C(12), above_vector(12));
    U26: myMUX2 port map (below_vector(11), above_vector(11), C(12), below_vector(12));
    U27: myMUX2 port map (above_vector(12), below_vector(12), C(13), above_vector(13));
    U28: myMUX2 port map (below_vector(12), above_vector(12), C(13), below_vector(13));
    U29: myMUX2 port map (above_vector(13), below_vector(13), C(14), above_vector(14));
    U30: myMUX2 port map (below_vector(13), above_vector(13), C(14), below_vector(14));
    U31: myMUX2 port map (above_vector(14), below_vector(14), C(15), above_vector(15));
    U32: myMUX2 port map (below_vector(14), above_vector(14), C(15), below_vector(15));
    U33: myMUX2 port map (above_vector(15), below_vector(15), C(16), above_vector(16));
    U34: myMUX2 port map (below_vector(15), above_vector(15), C(16), below_vector(16));
    U35: myMUX2 port map (above_vector(16), below_vector(16), C(17), above_vector(17));
    U36: myMUX2 port map (below_vector(16), above_vector(16), C(17), below_vector(17));
    U37: myMUX2 port map (above_vector(17), below_vector(17), C(18), above_vector(18));
    U38: myMUX2 port map (below_vector(17), above_vector(17), C(18), below_vector(18));
    U39: myMUX2 port map (above_vector(18), below_vector(18), C(19), above_vector(19));
    U40: myMUX2 port map (below_vector(18), above_vector(18), C(19), below_vector(19));
    U41: myMUX2 port map (above_vector(19), below_vector(19), C(20), above_vector(20));
    U42: myMUX2 port map (below_vector(19), above_vector(19), C(20), below_vector(20));
    U43: myMUX2 port map (above_vector(20), below_vector(20), C(21), above_vector(21));
    U44: myMUX2 port map (below_vector(20), above_vector(20), C(21), below_vector(21));
    U45: myMUX2 port map (above_vector(21), below_vector(21), C(22), above_vector(22));
    U46: myMUX2 port map (below_vector(21), above_vector(21), C(22), below_vector(22));
    U47: myMUX2 port map (above_vector(22), below_vector(22), C(23), above_vector(23));
    U48: myMUX2 port map (below_vector(22), above_vector(22), C(23), below_vector(23));
    U49: myMUX2 port map (above_vector(23), below_vector(23), C(24), above_vector(24));
    U50: myMUX2 port map (below_vector(23), above_vector(23), C(24), below_vector(24));
    U51: myMUX2 port map (above_vector(24), below_vector(24), C(25), above_vector(25));
    U52: myMUX2 port map (below_vector(24), above_vector(24), C(25), below_vector(25));
    U53: myMUX2 port map (above_vector(25), below_vector(25), C(26), above_vector(26));
    U54: myMUX2 port map (below_vector(25), above_vector(25), C(26), below_vector(26));
    U55: myMUX2 port map (above_vector(26), below_vector(26), C(27), above_vector(27));
    U56: myMUX2 port map (below_vector(26), above_vector(26), C(27), below_vector(27));
    U57: myMUX2 port map (above_vector(27), below_vector(27), C(28), above_vector(28));
    U58: myMUX2 port map (below_vector(27), above_vector(27), C(28), below_vector(28));
    U59: myMUX2 port map (above_vector(28), below_vector(28), C(29), above_vector(29));
    U60: myMUX2 port map (below_vector(28), above_vector(28), C(29), below_vector(29));
    U61: myMUX2 port map (above_vector(29), below_vector(29), C(30), above_vector(30));
    U62: myMUX2 port map (below_vector(29), above_vector(29), C(30), below_vector(30));
    U63: myMUX2 port map (above_vector(30), below_vector(30), C(31), above_vector(31));
    U64: myMUX2 port map (below_vector(30), above_vector(30), C(31), below_vector(31));
    U65: myMUX2 port map (above_vector(31), below_vector(31), C(32), above_vector(32));
    U66: myMUX2 port map (below_vector(31), above_vector(31), C(32), below_vector(32));
    U67: myMUX2 port map (above_vector(32), below_vector(32), C(33), above_vector(33));
    U68: myMUX2 port map (below_vector(32), above_vector(32), C(33), below_vector(33));
    U69: myMUX2 port map (above_vector(33), below_vector(33), C(34), above_vector(34));
    U70: myMUX2 port map (below_vector(33), above_vector(33), C(34), below_vector(34));
    U71: myMUX2 port map (above_vector(34), below_vector(34), C(35), above_vector(35));
    U72: myMUX2 port map (below_vector(34), above_vector(34), C(35), below_vector(35));
    U73: myMUX2 port map (above_vector(35), below_vector(35), C(36), above_vector(36));
    U74: myMUX2 port map (below_vector(35), above_vector(35), C(36), below_vector(36));
    U75: myMUX2 port map (above_vector(36), below_vector(36), C(37), above_vector(37));
    U76: myMUX2 port map (below_vector(36), above_vector(36), C(37), below_vector(37));
    U77: myMUX2 port map (above_vector(37), below_vector(37), C(38), above_vector(38));
    U78: myMUX2 port map (below_vector(37), above_vector(37), C(38), below_vector(38));
    U79: myMUX2 port map (above_vector(38), below_vector(38), C(39), above_vector(39));
    U80: myMUX2 port map (below_vector(38), above_vector(38), C(39), below_vector(39));
    U81: myMUX2 port map (above_vector(39), below_vector(39), C(40), above_vector(40));
    U82: myMUX2 port map (below_vector(39), above_vector(39), C(40), below_vector(40));
    U83: myMUX2 port map (above_vector(40), below_vector(40), C(41), above_vector(41));
    U84: myMUX2 port map (below_vector(40), above_vector(40), C(41), below_vector(41));
    U85: myMUX2 port map (above_vector(41), below_vector(41), C(42), above_vector(42));
    U86: myMUX2 port map (below_vector(41), above_vector(41), C(42), below_vector(42));
    U87: myMUX2 port map (above_vector(42), below_vector(42), C(43), above_vector(43));
    U88: myMUX2 port map (below_vector(42), above_vector(42), C(43), below_vector(43));
    U89: myMUX2 port map (above_vector(43), below_vector(43), C(44), above_vector(44));
    U90: myMUX2 port map (below_vector(43), above_vector(43), C(44), below_vector(44));
    U91: myMUX2 port map (above_vector(44), below_vector(44), C(45), above_vector(45));
    U92: myMUX2 port map (below_vector(44), above_vector(44), C(45), below_vector(45));
    U93: myMUX2 port map (above_vector(45), below_vector(45), C(46), above_vector(46));
    U94: myMUX2 port map (below_vector(45), above_vector(45), C(46), below_vector(46));
    U95: myMUX2 port map (above_vector(46), below_vector(46), C(47), above_vector(47));
    U96: myMUX2 port map (below_vector(46), above_vector(46), C(47), below_vector(47));
    U97: myMUX2 port map (above_vector(47), below_vector(47), C(48), above_vector(48));
    U98: myMUX2 port map (below_vector(47), above_vector(47), C(48), below_vector(48));
    U99: myMUX2 port map (above_vector(48), below_vector(48), C(49), above_vector(49));
    U100: myMUX2 port map (below_vector(48), above_vector(48), C(49), below_vector(49));
    U101: myMUX2 port map (above_vector(49), below_vector(49), C(50), above_vector(50));
    U102: myMUX2 port map (below_vector(49), above_vector(49), C(50), below_vector(50));
    U103: myMUX2 port map (above_vector(50), below_vector(50), C(51), above_vector(51));
    U104: myMUX2 port map (below_vector(50), above_vector(50), C(51), below_vector(51));
    U105: myMUX2 port map (above_vector(51), below_vector(51), C(52), above_vector(52));
    U106: myMUX2 port map (below_vector(51), above_vector(51), C(52), below_vector(52));
    U107: myMUX2 port map (above_vector(52), below_vector(52), C(53), above_vector(53));
    U108: myMUX2 port map (below_vector(52), above_vector(52), C(53), below_vector(53));
    U109: myMUX2 port map (above_vector(53), below_vector(53), C(54), above_vector(54));
    U110: myMUX2 port map (below_vector(53), above_vector(53), C(54), below_vector(54));
    U111: myMUX2 port map (above_vector(54), below_vector(54), C(55), above_vector(55));
    U112: myMUX2 port map (below_vector(54), above_vector(54), C(55), below_vector(55));
    U113: myMUX2 port map (above_vector(55), below_vector(55), C(56), above_vector(56));
    U114: myMUX2 port map (below_vector(55), above_vector(55), C(56), below_vector(56));
    U115: myMUX2 port map (above_vector(56), below_vector(56), C(57), above_vector(57));
    U116: myMUX2 port map (below_vector(56), above_vector(56), C(57), below_vector(57));
    U117: myMUX2 port map (above_vector(57), below_vector(57), C(58), above_vector(58));
    U118: myMUX2 port map (below_vector(57), above_vector(57), C(58), below_vector(58));
    U119: myMUX2 port map (above_vector(58), below_vector(58), C(59), above_vector(59));
    U120: myMUX2 port map (below_vector(58), above_vector(58), C(59), below_vector(59));
    U121: myMUX2 port map (above_vector(59), below_vector(59), C(60), above_vector(60));
    U122: myMUX2 port map (below_vector(59), above_vector(59), C(60), below_vector(60));
    U123: myMUX2 port map (above_vector(60), below_vector(60), C(61), above_vector(61));
    U124: myMUX2 port map (below_vector(60), above_vector(60), C(61), below_vector(61));
    U125: myMUX2 port map (above_vector(61), below_vector(61), C(62), above_vector(62));
    U126: myMUX2 port map (below_vector(61), above_vector(61), C(62), below_vector(62));
    U127: myMUX2 port map (above_vector(62), below_vector(62), C(63), above_vector(63));
    U128: myMUX2 port map (below_vector(62), above_vector(62), C(63), below_vector(63));
    U129: DDF    port map (Q, below_vector(63), above_vector(63));
    BRAM_PORTA_0_clk <=  '1' after 100 ns when BRAM_PORTA_0_clk = '0' else
                         '0' after 100 ns when BRAM_PORTA_0_clk = '1';
    BRAM_PORTB_0_clk <=  '1' after 100 ns when BRAM_PORTB_0_clk = '0' else
                         '0' after 100 ns when BRAM_PORTB_0_clk = '1';                 
    Clk <= below_vector(63);
    din <= above_vector(63);
    BRAM_PORTB_0_din(0) <= Q;
end Behavioral;
