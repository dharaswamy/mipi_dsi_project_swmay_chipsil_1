
//----------------------------------------------------------
//
//----------------------------------------------------------


//---------------------------------------------------------------------------------------------------------
class test_base extends uvm_test;

//----------------------------------------------------------
//
//----------------------------------------------------------
  `uvm_component_utils(test_base)
  
  //------------------------------------------------
  // 
  //------------------------------------------------
   env_config cfg;
  
 //------------------------------------------------
 // top_environment class handle instantiation
 //------------------------------------------------
   top_environment top_env_h;
  
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
  
  // Factory class object getting ( uvm_factory class is a virtaul class so we can't create object directly ) .
  uvm_factory factory = uvm_factory::get();
  
//----------------------------------------------------------
//
//----------------------------------------------------------
  function new(string name = get_type_name(), uvm_component parent);
    super.new(name,parent);
  endfunction:new
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // cfg object is creating ;
    cfg  = env_config::type_id::create("cfg",this);
    // 
    top_env_h = top_environment::type_id::create("top_env_h",this);
    
    //configuration of agents 
    cfg.disp_ahb_cfg=new[no_of_disp_ahb];
    cfg.disp_cnt_cfg=new[no_of_disp_cnt];
    cfg.disp_md_cfg=new[no_of_disp_md];
    
//      foreach(cfg.disp_cnt_cfg[i])
//       begin
//         cfg.disp_cnt_cfg[i]=disp_cnt_config::type_id::create($sformatf("disp_cnt_cfg[%0d]",i));
        
//         if(!uvm_config_db #(virtual disp_cnt_if)::get(this,"",$sformatf("dcif[%0d]",i),cfg.disp_cnt_cfg[i].dcif))
//           `uvm_fatal("disp_cnt_config","not getting")
//            //cfg.disp_cnt_cfg[i].is_active=UVM_ACTIVE;
//       end
    
    //cfg.disp_cnt_cfg[0].is_active=UVM_ACTIVE;

    foreach(cfg.disp_md_cfg[i])
      begin
        cfg.disp_md_cfg[i]=disp_md_config::type_id::create($sformatf("disp_md_cfg[%0d]",i));
        
        if(!uvm_config_db #(virtual disp_md_if)::get(this,"",$sformatf("dmif[%0d]",i),cfg.disp_md_cfg[i].dmif))
          `uvm_fatal("disp_md_config","not getting")
    
      end
          
    foreach(cfg.disp_ahb_cfg[i])
      begin
        cfg.disp_ahb_cfg[i]=disp_ahb_config::type_id::create($sformatf("disp_ahb_cfg[%0d]",i));
        
        if(!uvm_config_db #(virtual disp_ahb_if)::get(this,"",$sformatf("daif[%0d]",i),cfg.disp_ahb_cfg[i].daif))
          `uvm_fatal("disp_ahb_config","not getting")
    
      end
      
        
  cfg.has_sb=has_sb;
  cfg.has_disp_cnt=has_disp_cnt;
  cfg.has_disp_md=has_disp_md;
  cfg.has_disp_ahb=has_disp_ahb;
  
  cfg.no_of_disp_cnt=no_of_disp_cnt;
  cfg.no_of_disp_md=no_of_disp_md;
  cfg.no_of_disp_ahb=no_of_disp_ahb;
        
       // cfg.disp_cnt_cfg[0].is_active=UVM_ACTIVE;
        cfg.disp_md_cfg[0].is_active=UVM_PASSIVE;
        cfg.disp_ahb_cfg[0].is_active=UVM_ACTIVE;
 
    uvm_config_db#(env_config)::set(this,"*","env_cfg",cfg);
    
    
  endfunction:build_phase
  
  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_top.print_topology();
    factory.print();
    
  endfunction:start_of_simulation_phase
  
endclass:test_base

//=========================================================================================================

//------------------------------------------------------------------------------------------------------------------

// 10*10 image    


//=========================================================================================================================================

//---------------------------------------------------------------------------------------------------------------------------
/*
class frame_1080_720_size_test extends test_base;
  
  `uvm_component_utils(frame_1080_720_size_test)
  
  pxl_sequence pxl_sequ_h;
  
  function new(string name = get_type_name(), uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    factory.set_type_override_by_type(pxl_sequ_item::get_type(),frame_1080_720_size_seq_item::get_type());
    //
    pxl_sequ_h = pxl_sequence::type_id::create("pxl_sequ_h");
    
  endfunction:build_phase
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    pxl_sequ_h.start(dc_env_h.pxl_agt_h.pxl_seqr_h);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,200);
  endtask:run_phase
  
endclass:frame_1080_720_size_test
*/
//=============================================================================================================================