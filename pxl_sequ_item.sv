
//---------------------------------------------------------------------------
// Class Name :pxl_sequence_item
//---------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------



// In resolution hactive = 1st one=160 and vactive = second one =120 
  
// QQVGA                       :  160*120 
  
// QCIF                        :  176*144 
  
// QVGA                        :  320*240 
  
// CIF                         :  352*288
  
// VGA                         :  640*480
  
// SD                          :  720*576
  
// WVGA                        :  800*480
  
// XVGA                        :  1024*768
  
// 720P OR HD                  :  1280*720
  
// FULL HD                     :  1920*1080
  
// UHD                         :  3840*2160
  
// 4K(Hi-vision system HV)     :  4096 * 2160
  
// SHV(super hi-vision system) :  7680*4320
  

typedef enum int unsigned {QQVGA , QCIF, QVGA, CIF, VGA , SD , WVGA ,XVGA  , HD , FHD , UHD, HV_4K,SHV_8K ,SAMPLE } resolution_enum;

class pxl_sequ_item extends uvm_sequence_item;
  
  //---------------------------------------------------------------------------
 // 
 //---------------------------------------------------------------------------
  rand bit pxl_vsync;
  rand bit pxl_hsync;
  rand bit [23:0] pxl_data[];
  rand bit pxl_valid;
  rand bit [15:0] pxl_vactive;//no-lines
  rand bit [15:0] pxl_hactive; // no_pixles
  rand bit [4:0] no_frames ;
  rand bit [1:0] hbp; // Horizental back porch
  rand bit [1:0] hfp; // Horizental front porch
  rand bit [3:0] pxl_vsync_puls_width;// the pulse width of the vsync is different for different resolutions
  rand bit [3:0] pxl_hsync_puls_width;// the pulse width of the hsync is different for different resolutions
  rand resolution_enum resolution; //
  rand bit [63:0] temp;
 
  
  constraint pxl_data_consrt_h{ pxl_data.size() == ( pxl_hactive * pxl_vactive * no_frames ) ;}
  
  constraint temp_pxl_data_consrt{ solve pxl_data.size() before temp ;} 
  
  constraint  temp_consrt_h{ temp == pxl_data.size();}
  
  constraint pxl_vsync_hsync_width_consrt_h{if( resolution == QQVGA )
                                              {
                                              pxl_vsync_puls_width  == 1 ;
                                              pxl_hsync_puls_width  == 1 ;
                                              }
                                  
                                           if( resolution == QCIF )
                                             {
                                              pxl_vsync_puls_width  == 1 ;
                                              pxl_hsync_puls_width  == 1 ;
                                              }
                                  
                                          if( resolution == QVGA )
                                             {
                                              pxl_vsync_puls_width  == 2 ;
                                              pxl_hsync_puls_width  == 2 ;
                                              }
                                  
                                         if( resolution == CIF )
                                             {
                                              pxl_vsync_puls_width  == 3 ;
                                              pxl_hsync_puls_width  == 3 ;
                                              }
                                  
                                          else if( resolution == VGA ) 
                                            {
                                              pxl_vsync_puls_width  == 4 ;
                                              pxl_hsync_puls_width  == 4 ;
                                              }
                                  
                                  
                                         else if( resolution == SD )
                                             {
                                              pxl_vsync_puls_width  == 4 ;
                                              pxl_hsync_puls_width  == 4 ;
                                              }
                                  
                                         if( resolution == WVGA )
                                          {
                                              pxl_vsync_puls_width  == 5 ;
                                              pxl_hsync_puls_width  == 5 ;
                                            }
                                  
                                        if( resolution == XVGA )
                                           {
                                              pxl_vsync_puls_width  == 6 ;
                                              pxl_hsync_puls_width  == 6 ;
                                              }
                                  
                                       else if( resolution == HD )
                                          {
                                              pxl_vsync_puls_width  == 6 ;
                                              pxl_hsync_puls_width  == 6 ;
                                              }
                                  
                                       else if( resolution == FHD )
                                             {
                                              pxl_vsync_puls_width  == 7 ;
                                              pxl_hsync_puls_width  == 7 ;
                                              }
                                  
                                      else if( resolution == UHD )
                                             {
                                              pxl_vsync_puls_width  == 7 ;
                                              pxl_hsync_puls_width  == 7 ;
                                              }
                                  
                                     else if( resolution == HV_4K )
                                            {
                                              pxl_vsync_puls_width  == 8 ;
                                              pxl_hsync_puls_width  == 8 ;
                                              }
                                  
                                     else if( resolution == SHV_8K )
                                            {
                                              pxl_vsync_puls_width  == 9 ;
                                              pxl_hsync_puls_width  == 9 ;
                                              }
                                  
                                     else if( resolution == SAMPLE ) 
                                            {
                                              pxl_vsync_puls_width  == 4 ;
                                              pxl_hsync_puls_width  == 4 ;
                                              }
                                  
                                 }
  
  
  constraint pxl_hactive_consrt_h{if( resolution == QQVGA )
                                   pxl_hactive == 160 ;
                                  
                                  if( resolution == QCIF )
                                     pxl_hactive == 176 ;
                                  
                                  if( resolution == QVGA )
                                     pxl_hactive == 320 ;
                                  
                                  if( resolution == CIF )
                                   pxl_hactive == 352 ;
                                  
                                  else if( resolution == VGA ) 
                                   pxl_hactive == 640 ;
                                  
                                  
                                  else if( resolution == SD )
                                    pxl_hactive == 720 ;
                                  
                                  if( resolution == WVGA )
                                   pxl_hactive == 800 ;
                                  
                                  if( resolution == XVGA )
                                   pxl_hactive == 1024 ;
                                  
                                  else if( resolution == HD )
                                    pxl_hactive == 1280 ;
                                  
                                  else if( resolution == FHD )
                                    pxl_hactive == 1920 ;
                                  
                                  else if( resolution == UHD )
                                    pxl_hactive == 3840 ;
                                  
                                  else if( resolution == HV_4K )
                                    pxl_hactive == 4096 ;
                                  
                                  else if( resolution == SHV_8K )
                                    pxl_hactive == 7680 ;
                                  
                                  else if( resolution == SAMPLE ) 
                                    pxl_hactive == 10;
                                  
                                 }
// In resolution hactive = 1st one=160 and vactive = second one =120 
  
// QQVGA                       :  160*120 
  
// QCIF                        :  176*144 
  
// QVGA                        :  320*240 
  
// CIF                         :  352*288
  
// VGA                         :  640*480
  
// SD                          :  720*576
  
// WVGA                        :  800*480
  
// XVGA                        :  1024*768
  
// 720P OR HD                  :  1280*720
  
// FULL HD                     :  1920*1080
                                       
                                       
                                       
                                       
                                       
  
// UHD                         :  3840*2160
  
// 4K(Hi-vision system HV)     :  4096 * 2160
  
// SHV(super hi-vision system) :  7680*4320
  
   constraint hbp_consrt_h{ hbp == 3 ;} // Horizental back porch is always wider width than the hfp 
  
    constraint hfb_consrt_h{ hfp == 2;} // Horizental front porch is lower width compare to the hbp
  

  constraint pxl_vactive_consrt_h{if( resolution == QQVGA )
                                   pxl_vactive == 120 ;
                                  
                                  if( resolution == QCIF )
                                   pxl_vactive == 144 ;
                                  
                                  if( resolution == QVGA )
                                   pxl_vactive == 240 ;
                                  
                                  if( resolution == CIF  )
                                   pxl_vactive == 288 ;
                                  
                                  else if( resolution == VGA ) 
                                   pxl_vactive == 480 ;
                                  
                                  else if( resolution == WVGA ) 
                                   pxl_vactive == 480 ;
                                  
                                  
                                  else if( resolution == SD )
                                    pxl_vactive == 576 ;
                                  
                                  else if( resolution == HD )
                                    pxl_vactive == 720 ;
                                  
                                  else if( resolution == XVGA ) 
                                   pxl_vactive == 768 ;
                                  
                                  else if( resolution == FHD )
                                    pxl_vactive == 1080 ;
                                  
                                  else if( resolution == UHD )
                                    pxl_vactive == 2160 ;
                                  
                                  else if( resolution == HV_4K )
                                    pxl_vactive == 2160 ;
                                  
                                  else if( resolution == SHV_8K )
                                    pxl_vactive == 4320 ;
                                  
                                  else if( resolution == SAMPLE ) 
                                    pxl_vactive == 10;
                                  
                                 }
  
  
  
//  rand bit [12:0] frame_clmns;

  
//  static bit [12:0] frame_rows=10; // by default 
  
  constraint pxl_vsync_consrt_sft{soft pxl_vsync == 1 ;}
  constraint hsync_consrt_h{  pxl_hsync == 1 ;} 
  constraint pxl_valid_consrt_h{ pxl_valid == 1 ;}
  
 // constraint frame_clmns_consrt_sft{ soft frame_clmns == 10; }
  
//  constraint pxl_data_d_arry_size_consrt_sft{ soft pxl_data.size() == frame_clmns ;}
  
 // constraint frame_rows_consrt_sft{ frame_rows == 10 ;}
  
 //---------------------------------------------------------------------------
  // Function Name : new() , Default constructor 
  // Argurments    : name ,
//---------------------------------------------------------------------------
  function new(string name = get_type_name());
    super.new(name);
  endfunction:new
  
  //---------------------------------------------------------------------------
 // Factory Registration of class and fields 
 //---------------------------------------------------------------------------
  `uvm_object_utils_begin(pxl_sequ_item)
  `uvm_field_int(pxl_vsync,UVM_ALL_ON)
  `uvm_field_int(pxl_hsync,UVM_ALL_ON)
  `uvm_field_array_int(pxl_data,UVM_ALL_ON)
  `uvm_field_int(pxl_valid,UVM_ALL_ON)
  `uvm_field_enum(resolution_enum,resolution,UVM_ALL_ON)
  `uvm_field_int(no_frames,UVM_ALL_ON)
  `uvm_field_int(pxl_vactive,UVM_ALL_ON |UVM_DEC)
  `uvm_field_int(pxl_hactive,UVM_ALL_ON |UVM_DEC)
  `uvm_object_utils_end
  
endclass:pxl_sequ_item

//=================================================================================================================

//-----------------------------------------------------------------------------------------------------------------

class frame_1080_720_size_seq_item extends pxl_sequ_item;
  
  `uvm_object_utils(frame_1080_720_size_seq_item)
  
   
  function new(string name = get_type_name());
    super.new(name);
     // Overriding the frame_rws 
     //frame_rows = 720 ;
  endfunction:new
  
  // i am overriding frame_clumn constraint
 // constraint frame_clmns_consrt_sft{ soft frame_clmns == 1080; } 
  
 
 
  
endclass:frame_1080_720_size_seq_item

//===============================================================================================================

//--------------------------------------------------------------------------------------------------------------

//class  extends pxl_sequ_item;
  
  //---------------------------------------------------------------------------
 // Factory Registration of class 
 // Type          : uvm object type class 
 //---------------------------------------------------------------------------
  
  
//endclass:

//===============================================================================================================