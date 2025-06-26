

//---------------------------------------------------------------------------
// Interface Name : pixel_intf 
// Signals List   : pxl_clk ,pxl_rst_n,pxl_vsync ,pxl_hsync,pxl_data,pxl_valid.
// p data width   : 3 bytes .
//---------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------

interface pxl_intf(input logic pxl_clk,pxl_rst);
  
  //----------------------------------------------------
  // pixel interface signals 
  //----------------------------------------------------
   logic           pxl_vsync ;
   logic           pxl_hsync ;
   logic [23:0]    pxl_data ;
   logic           pxl_valid ;
   logic [63:0]    temp;
   logic [15:0]    no_pixels;
   
  
endinterface:pxl_intf

//=================================================================================================================