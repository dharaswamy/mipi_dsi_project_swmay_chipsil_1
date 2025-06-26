

constraint pxl_hactive_consrt_h{if( resolution == VGA ) 
                                   pxl_hactive == 640;
                                  else if( resolution == SD )
                                    pxl_hactive == 720 ;
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
                                  
                                 }
  