--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
--Date        : Mon Apr 20 20:14:15 2020
--Host        : LAPTOP-FPGCF403 running 64-bit major release  (build 9200)
--Command     : generate_target BRAM_wrapper.bd
--Design      : BRAM_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_wrapper is
  port (
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 7 downto 0 );
    BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BRAM_PORTB_0_clk : in STD_LOGIC;
    BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end BRAM_wrapper;

architecture STRUCTURE of BRAM_wrapper is
  component BRAM is
  port (
    BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BRAM_PORTB_0_clk : in STD_LOGIC;
    BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 7 downto 0 );
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component BRAM;
begin
BRAM_i: component BRAM
     port map (
      BRAM_PORTA_0_addr(5 downto 0) => BRAM_PORTA_0_addr(5 downto 0),
      BRAM_PORTA_0_clk => BRAM_PORTA_0_clk,
      BRAM_PORTA_0_din(63 downto 0) => BRAM_PORTA_0_din(63 downto 0),
      BRAM_PORTA_0_dout(63 downto 0) => BRAM_PORTA_0_dout(63 downto 0),
      BRAM_PORTA_0_we(7 downto 0) => BRAM_PORTA_0_we(7 downto 0),
      BRAM_PORTB_0_addr(5 downto 0) => BRAM_PORTB_0_addr(5 downto 0),
      BRAM_PORTB_0_clk => BRAM_PORTB_0_clk,
      BRAM_PORTB_0_din(63 downto 0) => BRAM_PORTB_0_din(63 downto 0),
      BRAM_PORTB_0_dout(63 downto 0) => BRAM_PORTB_0_dout(63 downto 0),
      BRAM_PORTB_0_we(7 downto 0) => BRAM_PORTB_0_we(7 downto 0)
    );
end STRUCTURE;
