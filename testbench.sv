
// Eda link : https://www.edaplayground.com/x/DmaN  ( it have some errors -> it is not working so that i killed at $500ns ) .

// ( swamy ) please copy the code but don't change/modify the code here.


//Project Name : mipi dsi . 
`timescale 1ns/1ns

`include "uvm_macros.svh"

import uvm_pkg::*;


`include "pxl_intf.sv"

`include "dsp_ahb_if.sv"

`include "disp_md_interface.sv"

// Configuration classes files include 
 
 `include "disp_cnt_config.sv"
 
 `include "disp_md_config.sv" 

 `include "disp_ahb_config.sv" 

 `include "env_config.sv"


`include "pxl_sequ_item.sv"

`include "pxl_sequence.sv"

`include "pxl_sequencer.sv"

`include "pxl_driver.sv"

`include "pxl_config_agent.sv"

`include "pxl_agent.sv"

`include "dc_environment.sv"



// ahb vip files 
`include "ahb_transaction.sv"

`include "ahb_sequence.sv"

`include "ahb_sequencer.sv"

`include "ahb_driver.sv"

`include "ahb_monitor.sv"

`include "disp_ahb_agent.sv"

`include "disp_ahb_env.sv" 


`include "scoreboard.sv"

`include "fun_cov.sv"

`include "virtual_sequencer.sv"

`include "top_environment.sv"

`include "test_base.sv"  



module tb_top_for_display_controller;
  
  //
  bit clk =0;
  //
  bit rst_n=1;
  bit dsi_rst ;
 
  
  //pixel interface instantiation
  pxl_intf pxl_vintf(clk,rst_n);//,rst_n);
  
   //   interface instantiation 
//  disp_md_if dmif(dsi_clk);
  
  //ahb interface instantiation 
  disp_ahb_if daif(clk);
  
  
  assign hready = 1;
  
  reg [7:0]  ecc;
  
 
  
  // clock generation with timpe periode of 10ns ,frequncy = 100 mhz. 
  initial begin
    forever #5 clk = ~clk ;
   end
  
  initial begin
   #10 dsi_rst = 0;
    dsi_rst = 1;
    
  end
  
  //
  initial begin
    
    // 
    uvm_config_db#(virtual pxl_intf)::set(null,"*","pxl_vintf",pxl_vintf);
    // 
    uvm_config_db#(virtual disp_ahb_if)::set(null,"*","daif[0]",daif); 
    //
  //  uvm_config_db#(virtual disp_md_if)::set(null,"*","dmif[0]",dmif);
    //
    
    
  end
  
  //For wave generatin 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #500 $finish;
  end
  
  
  
  
endmodule:tb_top_for_display_controller