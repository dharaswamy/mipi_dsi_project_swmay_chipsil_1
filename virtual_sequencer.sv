

//------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------
// Class Name : virtual sequencer 
// Class type : uvm component 
// 
// 1.pxl_sequencer
// 2.ahb_sequencer
// 3.
//--------------------------------------------------


class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  
  
  //------------------------------------------------
  // Factory Registration
  //------------------------------------------------
  `uvm_component_utils(virtual_sequencer)
  
  //-----------------------------------------------------------
  // Declaring the sequencers in tb hierarchy 
  //-----------------------------------------------------------
  
  //-----------------------------------------------
  // approach 1 : 
  // I am learing this approach
  //-----------------------------------------------
  
   // pxl_sequencer handle declaration
    uvm_sequencer#(pxl_sequ_item) pxl_seqr_h;
   // ahb_sequencer handle declaration
   uvm_sequencer#(ahb_transaction) ahb_seqr_h ;
   // pipelined_sequencer handle declaration
  // uvm_sequencer#() ; 
  
  
  //-------------------------------------------------
  // Approach 2 : 
  // I know this approaching
  //-------------------------------------------------
  
     // pxl_sequencer handle declaration
    //   pxl_sequencer pxl_seqr_h;
    //  ahb_sequencer handle declaration
    //   ahb_sequencer ahb_seqr_h;
    //   // 
  
  
  //------------------------------------------------
  // new() Method
  //------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
endclass:virtual_sequencer


//=======================================================================================================================