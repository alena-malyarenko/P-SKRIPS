C $Header: /u/gcmpack/MITgcm/pkg/exf/exf_diagnostics_fill.F,v 1.20 2017/05/11 20:57:50 jmc Exp $
C $Name: checkpoint66h $

#include "EXF_OPTIONS.h"

      SUBROUTINE GET_FIELD_PARAMETERS(
     I  lwnet_ESMF, swnet_ESMF,
     I   hl_ESMF, hs_ESMF,
     I  lwnet_si_ESMF, swnet_si_ESMF, 
     I  hl_si_ESMF, hs_si_ESMF,
     I  uwind_ESMF, 
     I  vwind_ESMF, atemp_ESMF, aqh_ESMF, evap_ESMF,
     I  evap0_ESMF, precip_ESMF, snowh_ESMF,
     I  runoff_ESMF, 
     I  land_runoff_ESMF, 
     I  myThid )

      IMPLICIT NONE

C     == global variables ==
#include "EEPARAMS.h"
#include "SIZE.h"
#include "PARAMS.h"
#include "GRID.h"
#include "EXF_PARAM.h"
#include "EXF_FIELDS.h"
#include "EXF_CONSTANTS.h"

      INTEGER myThid
      INTEGER i,j,bi,bj
      REAL*8 lwnet_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 swnet_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)      
      REAL*8 hl_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 hs_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)      
      REAL*8 lwnet_si_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 swnet_si_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 hl_si_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 hs_si_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 uwind_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 vwind_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 atemp_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 aqh_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 evap_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 evap0_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 precip_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 snowh_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 runoff_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      REAL*8 land_runoff_ESMF(1-OLx:sNx+OLx,1-OLy:sNy+OLy,nSx,nSy)
      
      REAL*8 land_runoff_int(1-OLx:sNx+OLx,nSx)

      DO bi = myBxLo(myThid), myBxHi(myThid)
       DO i=1-OLx,sNx+OLx      
        land_runoff_int(i,bi)=0
        DO j=1-OLy,sNy+OLy
         DO bj = myByLo(myThid), myByHi(myThid)
          land_runoff_int(i,bi)=land_runoff_int(i,bi)
     &     +land_runoff_ESMF(i,j,bi,bj)*rA(i,j,bi,bj)
         ENDDO
        ENDDO
       ENDDO
      ENDDO




      DO bj = myByLo(myThid), myByHi(myThid)
       DO bi = myBxLo(myThid), myBxHi(myThid)
         DO j=1-OLy,sNy+OLy
          DO i=1-OLx,sNx+OLx
            lwflux(i,j,bi,bj) = lwnet_ESMF(i,j,bi,bj)
            swflux(i,j,bi,bj) = swnet_ESMF(i,j,bi,bj)            
            hl(i,j,bi,bj) = hl_ESMF(i,j,bi,bj)
            hs(i,j,bi,bj) = hs_ESMF(i,j,bi,bj)
            lwflux_ice(i,j,bi,bj) = lwnet_si_ESMF(i,j,bi,bj)
            swflux_ice(i,j,bi,bj) = swnet_si_ESMF(i,j,bi,bj)
            hl_ice(i,j,bi,bj) = hl_si_ESMF(i,j,bi,bj)
            hs_ice(i,j,bi,bj) = hs_si_ESMF(i,j,bi,bj)
            uwind(i,j,bi,bj) = uwind_ESMF(i,j,bi,bj)
            vwind(i,j,bi,bj) = vwind_ESMF(i,j,bi,bj)
            atemp(i,j,bi,bj) = atemp_ESMF(i,j,bi,bj)
            aqh(i,j,bi,bj) = aqh_ESMF(i,j,bi,bj)
            evap(i,j,bi,bj) = evap_ESMF(i,j,bi,bj)
            precip(i,j,bi,bj) = precip_ESMF(i,j,bi,bj)
            snowh(i,j,bi,bj) = snowh_ESMF(i,j,bi,bj)
            runoff(i,j,bi,bj) = runoff_ESMF(i,j,bi,bj)
            land_runoff(i,j,bi,bj) = land_runoff_int(i,bi) 
          ENDDO
         ENDDO
       ENDDO
      ENDDO

      RETURN
      END
