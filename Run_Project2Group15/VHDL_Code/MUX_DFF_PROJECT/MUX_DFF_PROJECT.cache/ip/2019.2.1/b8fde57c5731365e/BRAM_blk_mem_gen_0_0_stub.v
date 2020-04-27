// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Mon Apr 20 20:15:29 2020
// Host        : LAPTOP-FPGCF403 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ BRAM_blk_mem_gen_0_0_stub.v
// Design      : BRAM_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[7:0],addra[5:0],dina[63:0],douta[63:0],clkb,web[7:0],addrb[5:0],dinb[63:0],doutb[63:0]" */;
  input clka;
  input [7:0]wea;
  input [5:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input [7:0]web;
  input [5:0]addrb;
  input [63:0]dinb;
  output [63:0]doutb;
endmodule
