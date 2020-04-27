library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity APUF_tb is
    Port   ( Output : out STD_LOGIC;
             Clock  : out STD_LOGIC;
             D : out STD_LOGIC);
end;

architecture bench of APUF_tb is

  component APUF
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             C : in STD_LOGIC_VECTOR(63 downto 0);
             Q : out STD_LOGIC;
             Clk: out STD_LOGIC;
             din : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal C: STD_LOGIC_VECTOR(63 downto 0);
  --signal Q: STD_LOGIC;
  --signal Clk:  STD_LOGIC;
  --signal din : STD_LOGIC;
  signal enable: STD_LOGIC := '0';
begin
  uut: APUF port map ( A => A,
                       B => B,
                       C => C,
                       Q => Output,
                       Clk =>Clock,
                       din => D);

  stimulus: process
  begin
  enable <= '1';
  C <= B"1101010001000010100011000101000001001001001000010100100001110011";
    wait for 5ns;
    if(enable = '1') then
     A <= '1';
     B <= '1';
    else
     A <= '0';
     B <='0';
    end if;
    wait;
    end process;
 end;
