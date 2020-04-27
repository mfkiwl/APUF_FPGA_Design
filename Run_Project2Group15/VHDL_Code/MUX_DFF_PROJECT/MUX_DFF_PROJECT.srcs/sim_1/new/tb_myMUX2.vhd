library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MyMUX2_tb is
end;

architecture bench of MyMUX2_tb is

  component MyMUX2
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             S : in STD_LOGIC;
             Y : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal S: STD_LOGIC;
  signal Y: STD_LOGIC;
  signal enable: STD_LOGIC;
begin

  uut: MyMUX2 port map ( A => A,
                         B => B,
                         S => S,
                         Y => Y );

  stimulus: process
  begin
    enable <= '1';
    wait for 5ns;
    if(enable = '1') then
    A <= '1';
    B <= '0';
    else 
    A <= '0';
    B<=  '1';
    end if;
    S <= '0';
    wait for 200ns;
    S <= '1';
    wait for 200ns;
  end process;
end;