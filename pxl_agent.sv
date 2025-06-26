
//----------------------------------------------------------
//
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------

class pxl_agent extends uvm_agent ;

//----------------------------------------------------------
// Factory registration
//----------------------------------------------------------
  `uvm_component_utils(pxl_agent)
  
// pxl sequencer class handle declaration
  pxl_sequencer pxl_seqr_h;
  
  // pxl driver class handle declaration
   pxl_driver pxl_driv_h;
  
  // pxl monitor clas handle declaratin
 // pxl_monitor pxl_mntr_h;
  
  // pxl_config_agent class handle declartion
  pxl_config_agent pxl_cfg_agt_h;
  
  

//----------------------------------------------------------
//
//----------------------------------------------------------
  function new(string name = get_type_name(), uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(! uvm_config_db#(pxl_config_agent)::get(this,"","pxl_cfg_agt_h",pxl_cfg_agt_h))
      `uvm_fatal(get_full_name, " Fatal error \" First set the pxl_cfg_agt_h in Config db \" ");
    // For Active agent
    if(pxl_cfg_agt_h.is_active == UVM_ACTIVE) begin
      //Creating object for the pxl sequencer
      pxl_seqr_h = pxl_sequencer::type_id::create("pxl_seqr_h",this);
      pxl_driv_h = pxl_driver::type_id::create("pxl_driv_h",this);
    end
    else `uvm_info(get_full_name()," pxl_agent IS CONFIGURED AS A PASSIVE AGENT",UVM_NONE);
  endfunction:build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(pxl_cfg_agt_h.is_active == UVM_ACTIVE) begin
      pxl_driv_h.seq_item_port.connect(pxl_seqr_h.seq_item_export);
    end
  endfunction:connect_phase
  
endclass:pxl_agent
//=========================================================================================================