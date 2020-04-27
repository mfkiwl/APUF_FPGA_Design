library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity XOR_GATE is
    Port ( a : in std_logic;
           b : in std_logic;
           y : out std_logic);
end XOR_GATE;

architecture XOR_GATE of XOR_GATE is

begin
  y<= a xor b;

end XOR_GATE;