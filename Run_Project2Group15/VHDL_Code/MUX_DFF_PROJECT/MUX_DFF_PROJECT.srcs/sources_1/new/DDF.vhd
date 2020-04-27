Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DDF is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
end DDF;
architecture Behavioral of DDF is 
begin  
 process(Clk)
 begin 
 if (Clk'event and Clk = '1') then
    if(D='1' or D='0') then
        Q <= D;
    else
        Q <= '0';
    end if;
 end if;  
 end process;  
end Behavioral; 