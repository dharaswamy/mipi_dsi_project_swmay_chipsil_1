
//----------------------------------------------------------
// Class Name    : pxl_sequence
//  Type         : Object class
// Usage/purpose : Generating the basic sequence items
//
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------
/*
class pxl_sequence extends uvm_sequence#(pxl_sequ_item);

//----------------------------------------------------------
// Factory Registeration
// This is a Object class so uvm_object_utils
//----------------------------------------------------------
  `uvm_object_utils(pxl_sequence)  

   bit temp=0;
//----------------------------------------------------------
// Function Name : new();
// Arguments     :
//----------------------------------------------------------
  function new(string name = get_type_name());
    super.new(name);
  endfunction:new
  
//----------------------------------------------------------
// Task Name : body()
// Arguments :
// Usage/purpose : Generating the sequence items .
//----------------------------------------------------------

  virtual task body();
    // Creating the pxl_sequ_item object
    req = pxl_sequ_item::type_id::create("req");
    repeat(req.frame_rows) begin:repeat_end
 
    // Wait for grant from the sequencer 
     start_item(req);
    // Randomization of object 
      assert(req.randomize()with{pxl_vsync == ~temp;}) 
      `uvm_info(get_full_name ,$sformatf("Randomization_Sucess\n%0s",req.sprint()),UVM_NONE)
    else `uvm_error(get_full_name,"\n----====Randomization_Failed Check Constriants====------\n");
    finish_item(req);
      temp=1;
    end:repeat_end
  endtask:body
  
endclass:pxl_sequence
*/
//=========================================================================================================

//----------------------------------------------------------------------------------------------------------

/*
class video_send_frame_10_10_size_sequ extends pxl_sequence;
  
 //----------------------------------------------------
 //  Factory Registration 
 //
 //---------------------------------------------------
  `uvm_object_utils(video_send_frame_10_10_size_sequ)
  
  //----------------------------------------------------
  //  Function Name : new()
 //---------------------------------------------------
  function new(string name = get_type_name())
    super.new(name);  
  endfunction:new
   
  //----------------------------------------------------
  //  Task Name : body()
  // Usage/purpose : It generates the sequence items and send to the driver via sequencer .
 //-----------------------------------------------------
  
  virtual task body();
    
    req = pxl_sequ_item::type_id::create("req");
    repeat(24) begin:repeat_1
      repeat(req.fram_rows) begin:repeat_2
       // Wait for grant from the sequencer
       start_item(req);
       // Randomization of req object
        assert(req.randomize()with{pxl_vsync== ~temp;})
      else `uvm_error("FATAL ERROR"," RANDOMIZATION IF FAILED CHECK CONSTRAINTS " );
      finish_item(req);
        temp = 1;
       end:repeat_2
       temp=0;
    end:repeat_1
    
  endtask:body
  
endclass:video_send_frame_10_10_size_sequ

*/
//========================================================================================================

//---------------------------------------------------------------------------------------------------------

class pxl_sequence extends uvm_sequence#(pxl_sequ_item);

//----------------------------------------------------------
// Factory Registeration
// This is a Object class so uvm_object_utils
//----------------------------------------------------------
  `uvm_object_utils(pxl_sequence)  

  
//----------------------------------------------------------
// Function Name : new();
// Arguments     :
//----------------------------------------------------------
  function new(string name = get_type_name());
    super.new(name);
  endfunction:new
  
//----------------------------------------------------------
// Task Name : body()
// Arguments :
// Usage/purpose : Generating the sequence items .
//----------------------------------------------------------

  virtual task body();
    // Creating the pxl_sequ_item object
    req = pxl_sequ_item::type_id::create("req");
   // repeat(24) begin:repeat_end
 
    // Wait for grant from the sequencer 
     start_item(req);
    // Randomization of object 
    assert(req.randomize() with{ resolution == SAMPLE; no_frames == 1;})
      `uvm_info(get_full_name ,$sformatf("Randomization_Sucess\n%0s",req.sprint()),UVM_NONE)
    else `uvm_error(get_full_name,"\n----====Randomization_Failed Check Constriants====------\n");
    finish_item(req);
   // end:repeat_end
  endtask:body
  
endclass:pxl_sequence

//=============================================================================================================================