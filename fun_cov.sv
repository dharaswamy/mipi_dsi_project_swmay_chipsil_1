

class fun_cov extends uvm_subscriber#(pxl_sequ_item);
  
   //------------------------------------------------
  // Factory Registration
  //------------------------------------------------
  `uvm_component_utils(fun_cov)
  
  //------------------------------------------------
  // new() Method
  //------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  
  function void write(pxl_sequ_item t);
    
  endfunction:write
  
endclass:fun_cov