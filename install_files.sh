#!/bin/bash

WRFDIR= # insert here your WRF directory path
MITDIR= # insert here your mitCode path in your simulation directory (e.g. in L3C1/mitCode/ )
COUPLERDIR= # insert here your coupleCode directory path (e.g. in L3C1/coupledCode)
RUNDIR = # insert here yourrunCase directory path (e.g. L3C1/runcase )
# link MIT files

ln -sf MITgcm/CPP_OPTIONS.h /$MITDIR/
ln -sf MITgcm/EXF_FIELDS.h $MITDIR/
ln -sf MITgcm/KPP_OPTIONS.h $MITDIR/   
ln -sf MITgcm/SHELFICE.h $MITDIR/          
ln -sf MITgcm/exf_check.F $MITDIR/             
ln -sf MITgcm/exf_getforcing.F $MITDIR/        
ln -sf MITgcm/get_seaice.F $MITDIR/    
ln -sf MITgcm/mon_solution.F $MITDIR/       
ln -sf MITgcm/seaice_check.F $MITDIR/             
ln -sf MITgcm/seaice_model.F $MITDIR/       
ln -sf MITgcm/shelfice_output.F $MITDIR/
ln -sf MITgcm/DIAGNOSTICS_SIZE.h $MITDIR/
ln -sf MITgcm/FFIELDS.h $MITDIR/         
ln -sf MITgcm/OBCS_OPTIONS.h $MITDIR/    
ln -sf MITgcm/SHELFICE_OPTIONS.h $MITDIR/  
ln -sf MITgcm/exf_diagnostics_init.F $MITDIR/
ln -sf MITgcm/exf_init_varia.F $MITDIR/       
ln -sf MITgcm/ini_ffields.F $MITDIR/  
ln -sf MITgcm/packages.conf $MITDIR/       
ln -sf MITgcm/seaice_diagnostics_init.F $MITDIR/ 
ln -sf MITgcm/seaice_solve4temp.F $MITDIR/  
ln -sf MITgcm/shelfice_thermodynamics.F $MITDIR/
ln -sf MITgcm/ECCO_CPPOPTIONS.h $MITDIR/   
ln -sf MITgcm/GMREDI_OPTIONS.h $MITDIR/  
ln -sf MITgcm/SEAICE_OPTIONS.h $MITDIR/ 
ln -sf MITgcm/SHELFICE_TAVE.h $MITDIR/     
ln -sf MITgcm/exf_getffields.F $MITDIR/        
ln -sf MITgcm/get_field_parameters.F $MITDIR/  
ln -sf MITgcm/ini_forcing.F $MITDIR/  
ln -sf MITgcm/seaice_advection.F $MITDIR/
ln -sf MITgcm/seaice_growth.F $MITDIR/            
ln -sf MITgcm/shelfice_forcing.F $MITDIR/

# link coupled model files

ln -sf coupler/mod_esmf_ocn.F90 $COUPLERDIR/
ln -sf coupler/mod_types.F90 $COUPLERDIR/
ln -sf coupler/namelist.WRF_IO $RUNDIR/

# link WRF files  

ln -sf PWRF/Registry.EM_COMMON $WRFDIR/Registry/  
ln -sf PWRF/ext_esmf_read_field.F90 $WRFDIR/external/io_esmf/
ln -sf PWRF/io_esmf.F90 $WRFDIR/external/io_esmf/
ln -sf PWRF/module_sf_noah_seaice.F $WRFDIR/phys/
ln -sf PWRF/module_sf_noahdrv.F $WRFDIR/phys/
ln -sf PWRF/module_sf_noahlsm_glacial_only.F $WRFDIR/phys/
ln -sf PWRF/module_surface_driver.F $WRFDIR/phys/
ln -sf PWRF/ext_esmf_write_field.F90 $WRFDIR/external/io_esmf/
ln -sf PWRF/module_first_rk_step_part1.F $WRFDIR/dyn_em/
ln -sf PWRF/module_sf_noah_seaice_drv.F $WRFDIR/phys/
ln -sf PWRF/module_sf_noahlsm.F $WRFDIR/phys/
ln -sf PWRF/module_state_description.F $WRFDIR/frame/

