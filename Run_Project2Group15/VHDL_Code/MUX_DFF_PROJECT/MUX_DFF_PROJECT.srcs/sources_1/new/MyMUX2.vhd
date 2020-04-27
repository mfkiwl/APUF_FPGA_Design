library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MyMUX2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end MyMUX2;

architecture Behavioral of MyMUX2 is
    
begin
    Y <= ((not S) and A) or (S and B);

end Behavioral;
