
//----------------------------------------------------------
// Class Name : pxl_sequencer 
// Type       : uvm_component type class
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------

class pxl_sequencer extends uvm_sequencer#(pxl_sequ_item);

//----------------------------------------------------------
//Factory Registration : pxl_sequencer
// Type                : It is component class So uvm_component_utils
//----------------------------------------------------------
  `uvm_component_utils(pxl_sequencer);

//----------------------------------------------------------
//Function Name : new();
//----------------------------------------------------------
  function new(string name = get_type_name(),uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
endclass:pxl_sequencer

//=========================================================================================================