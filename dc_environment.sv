
//----------------------------------------------------------
//
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------
class dc_environment extends uvm_env;

//----------------------------------------------------------
//
//----------------------------------------------------------
  `uvm_component_utils(dc_environment)
  
// 
  pxl_agent pxl_agt_h;
// 
  pxl_config_agent pxl_cfg_agt_h;
  

//----------------------------------------------------------
//
//----------------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //
    pxl_cfg_agt_h = pxl_config_agent::type_id::create("pxl_cfg_agt_h");
    //
    uvm_config_db#(pxl_config_agent)::set(this,"*","pxl_cfg_agt_h",pxl_cfg_agt_h);
    //
    pxl_agt_h = pxl_agent::type_id::create("pxl_agt_h",this);
    
  endfunction:build_phase
  
endclass:dc_environment


//=========================================================================================================