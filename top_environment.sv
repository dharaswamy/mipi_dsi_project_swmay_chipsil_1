//------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------
// Class Name : top_environment 
// Class type : uvm component 
// 
// 1.dc_env
// 2.disp_ahb_env
// 3.
//--------------------------------------------------
class top_environment extends uvm_env;
 
  //------------------------------------------------
  // Factory Registration
  //------------------------------------------------
  `uvm_component_utils(top_environment)
  
  //------------------------------------------------
  // en_config class handle declaration
  //------------------------------------------------
   env_config cfg;
  
  //------------------------------------------------
  // dc_environment handle declaration
  //------------------------------------------------
    dc_environment dc_env_h;
  
  //------------------------------------------------
  // disp_ahb_top it is a env class  
  //------------------------------------------------
  disp_ahb_top disp_ahb_top_h;
  
  //------------------------------------------------
  // scoreboard class declaration
  //------------------------------------------------
    scoreboard  scb_h;
  
  //------------------------------------------------
  // functional coverage  class handle declaration
  //------------------------------------------------
   fun_cov  fun_cov_h;
  
  //------------------------------------------------
  // virtaul sequencer  class handle declaration 
  //------------------------------------------------
   virtual_sequencer vir_seqr_h;
  
  
  //------------------------------------------------
  // 
  //------------------------------------------------
  int has_disp_cnt=1;
  int has_disp_md=1;
  int has_disp_ahb=1;
  int has_sb=1;
  
  //------------------------------------------------
  // 
  //------------------------------------------------
  int no_of_disp_cnt=1;
  int no_of_disp_md=1;
  int no_of_disp_ahb=1;
  
  //------------------------------------------------
  // new() Method
  //------------------------------------------------
  function new(string name = get_type_name() , uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  
  //------------------------------------------------
  // Function Name : build_phase()
  //
  //------------------------------------------------
  
  virtual function void build_phase(uvm_phase phase);
    
    super.build_phase(phase); 
    // 
    dc_env_h = dc_environment::type_id::create("dc_env_h",this);
    // 
    disp_ahb_top_h = disp_ahb_top::type_id::create("disp_ahb_top_h",this);
    
    //
    scb_h = scoreboard::type_id::create("scb_h",this);
    //
    fun_cov_h = fun_cov ::type_id::create("fun_cov_h",this);
    //
    vir_seqr_h = virtual_sequencer::type_id::create("vir_seqr_h",this);
    
 endfunction:build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Handle assignment 
     vir_seqr_h.pxl_seqr_h = dc_env_h.pxl_agt_h.pxl_seqr_h;
    foreach(disp_ahb_top_h.disp_ahb_agt[i]) begin
      vir_seqr_h.ahb_seqr_h = disp_ahb_top_h.disp_ahb_agt[i].ahb_seqrh;
    end
  endfunction:connect_phase
  
endclass:top_environment 


//=========================================================================================================================