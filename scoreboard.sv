

class scoreboard extends uvm_scoreboard;
  
  //------------------------------------------------
  // Factory Registration
  //------------------------------------------------
  `uvm_component_utils(scoreboard)
  
  //------------------------------------------------
  // new() Method
  //------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  
  
endclass:scoreboard