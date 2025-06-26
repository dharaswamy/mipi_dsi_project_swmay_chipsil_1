
//----------------------------------------------------------
// Class Name : pxl_driver 
// Type       : uvm_component type
// Usage/purpose: It drives pixel interface signals 
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------

class pxl_driver extends uvm_driver#(pxl_sequ_item);

//----------------------------------------------------------
// Factory Registration : pxl_driver
// It is a component class so uvm_component_utils
//----------------------------------------------------------
  `uvm_component_utils(pxl_driver)

//----------------------------------------------------------
// Virtual interface Declaration
//----------------------------------------------------------
virtual pxl_intf pxl_vintf;
  
  // temporary variables 
   longint unsigned hw_many_pxls_line ,recieved_no_lines;
//----------------------------------------------------------
//Function Name : new()
//----------------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
//----------------------------------------------------------
//Function Name : build_phase
//
//----------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual pxl_intf)::get(this,"","pxl_vintf",pxl_vintf))
      `uvm_fatal(get_full_name ," CONFIG DB FATAL ERROR , First Set the \"pxl_vintf\" in Config_db ");
  endfunction:build_phase
  
//----------------------------------------------------------
// Task Name : run_phase();
//----------------------------------------------------------
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    // wait for reset 
    // wait(pxl_vintf.pxl_rst_n);
    forever begin:forever_end
    // getting the sequ_item 
    seq_item_port.get_next_item(req);
   // `uvm_info(get_full_name(),$sformatf(" Got Sequence item %0s ",req.sprint()),UVM_NONE)
    //Calling drive() task
     drive();
    // item done
    seq_item_port.item_done();
      
    end:forever_end
  endtask:run_phase
  
  
//----------------------------------------------------------
// Task Name : drive()
//----------------------------------------------------------
  virtual protected task drive();
    // Calling the write task
    write();
  endtask:drive
  
//----------------------------------------------------------
// Task Name : write();
//----------------------------------------------------------
  virtual protected task write();
    
//     @(posedge pxl_vintf.pxl_clk);
//      pxl_vintf.pxl_vsync <= req.pxl_vsync;
//      pxl_vintf.pxl_hsync <= req.pxl_hsync;

    case (req.resolution) 
      VGA: begin 
           sub_write();
          end
      SD: begin 
           sub_write();
          end
      HD: begin 
           sub_write();
          end
      FHD: begin 
           sub_write();
          end
      UHD: begin 
           sub_write();
          end
      HV_4K: begin 
           sub_write();
          end
      SHV_8K: begin 
           sub_write();
          end
      SAMPLE: begin
              sub_write();
               end
    
    endcase
    
   //`uvm_info(get_full_name(),$sformatf("%0d",hw_many_pxls_line),UVM_NONE);
  endtask:write
  
//----------------------------------------------------------
//
//----------------------------------------------------------
  
  
  
  
   task sub_write();
   longint unsigned temp_pxl_vactive=0 ;
     temp_pxl_vactive = 0;
     
     pxl_vintf.temp <= req.temp;
     pxl_vintf.no_pixels <= req.pxl_hactive;
     
     repeat(req.no_frames) begin:repeats_over_no_frames
       // when new frame starts the vsync and hsync must assert.
        @(posedge pxl_vintf.pxl_clk);
        pxl_vintf.pxl_vsync <= req.pxl_vsync;
        pxl_vintf.pxl_hsync <= req.pxl_hsync;
       // Deasserting the vsync and hsync 
       repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk); // one posedge added above , 
           pxl_vintf.pxl_vsync <= 0;
           pxl_vintf.pxl_hsync <= 0;
       
       
       repeat(req.pxl_vactive) begin:repeats_over_no_lines_in_frame
 
         // delay of horizental back porch hbp
         repeat(req.hbp) @(posedge pxl_vintf.pxl_clk);
         
         repeat(req.pxl_hactive) begin:repeats_over_no_pixels_in_one_line
           pxl_vintf.pxl_valid <= 1;
           pxl_vintf.pxl_data  <= $random;
           @(posedge pxl_vintf.pxl_clk);
         end:repeats_over_no_pixels_in_one_line
         
         temp_pxl_vactive = temp_pxl_vactive + 1;
         pxl_vintf.pxl_valid <= 0;
         
          // delay of horizental front porch hfp
         repeat(req.hfp-1) @(posedge pxl_vintf.pxl_clk); // one posedege added indrectly that why i put hfp-1;
         //
         if( temp_pxl_vactive < req.pxl_hactive )
         clk_delay_for_different_resolutions;
         //
          
         
       end:repeats_over_no_lines_in_frame
        temp_pxl_vactive = 0;
     end:repeats_over_no_frames
     
 
  endtask:sub_write
  
 //----------------------------------------------------------
 // 
 //----------------------------------------------------------
  
  task clk_delay_for_different_resolutions();
    
    case (req.resolution)
      VGA: begin 
           @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
          repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 0;
          end
      SD: begin 
            @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
          repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
         pxl_vintf.pxl_hsync <= 0;
          end
      HD: begin 
          @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
          repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
         pxl_vintf.pxl_hsync <= 0;
          end
      FHD: begin 
            @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
           repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
          pxl_vintf.pxl_hsync <= 0;
          end
      UHD: begin 
           @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
           repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
          pxl_vintf.pxl_hsync <= 0;
          end
      HV_4K: begin 
           @(posedge pxl_vintf.pxl_clk);
           pxl_vintf.pxl_hsync <= 1;
          repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
          pxl_vintf.pxl_hsync <= 0;
          end
      SHV_8K: begin 
             @(posedge pxl_vintf.pxl_clk);
             pxl_vintf.pxl_hsync <= 1;
             repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
            pxl_vintf.pxl_hsync <= 0;
          end
      
      SAMPLE: begin 
             @(posedge pxl_vintf.pxl_clk);
             pxl_vintf.pxl_hsync <= 1;
             repeat(req.pxl_hsync_puls_width) @(posedge pxl_vintf.pxl_clk);
            pxl_vintf.pxl_hsync <= 0;
          end
    endcase
  endtask:clk_delay_for_different_resolutions

endclass:pxl_driver

//=========================================================================================================