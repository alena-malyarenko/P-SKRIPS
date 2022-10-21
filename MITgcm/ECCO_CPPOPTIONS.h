C 
C
#ifndef ECCO_CPPOPTIONS_H
#define ECCO_CPPOPTIONS_H
C
C CPP flags controlling which code is included in the files that
C will be compiled.
C ********************************************************************
C ***             External forcing Package                         ***
C ********************************************************************
C 
C o Include/exclude the external forcing package. To use this package,
C   you have to include the calendar tool as well. KPP can be switched
C   on or off. The implementation automatically takes care of this.
#define INCLUDE_EXTERNAL_FORCING_PACKAGE

C   Do more printout for the protocol file than usual.
#undef EXF_VERBOSE

C   Bulk formulae related flags.
#define ALLOW_ATM_TEMP
#define ALLOW_ATM_WIND

CC For coupled WRF-MITgcm
#define	ALLOW_FLUXES_COUPLED

#if (defined (ALLOW_FLUXES_COUPLED))
#define ALLOW_READ_TURBFLUXES
#define EXF_READ_EVAP
#define WIND
#define ALLOW_ATM_TEMP
#define SHORTWAVE_HEATING
C will need these later:
# undef USE_EXF_INTERPOLATION
#define  ALLOW_RUNOFF
# undef  ALLOW_RUNOFTEMP
C never use these:
CC#define ALLOW_DOWNWARD_RADIATION
# undef ALLOW_ZENITHANGLE
# undef ALLOW_BULKFORMULAE
# undef SEAICE_CAP_SUBLIM
#endif
 
#define SI_FLUX_DEBUG

CC   For uncoupled model
CC#define ALLOW_DOWNWARD_RADIATION
CC #if (defined (ALLOW_ATM_TEMP) || \
CC     defined (ALLOW_ATM_WIND))
CC # define ALLOW_BULKFORMULAE
CC #endif

CC   For coupled model
CC#define ALLOW_READ_TURBFLUXES
CC#define EXF_READ_EVAP

C   Relaxation to monthly climatologies.
#undef ALLOW_CLIMTEMP_RELAXATION
#undef ALLOW_CLIMSALT_RELAXATION
#undef ALLOW_CLIMSST_RELAXATION
#undef ALLOW_CLIMSSS_RELAXATION

#define EXF_INTERP_USE_DYNALLOC
#define USE_EXF_INTERPOLATION


#endif /* ECCO_CPPOPTIONS_H */

