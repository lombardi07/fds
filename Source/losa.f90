!
! This module contains the input and output variables definition implemented by 
! Lombardi Sa to integrate following features:
! 1) Purser thermal dose concept (FTD);
! 2) Normative incapacitation limits (temperature, substances, radiation).
! Other than this module, source code changes have been made to the following
! files: evac.f90, type.f90, read.f90.
! For further detail search keyword "losa" in the respective files.
!
! Author: J. Maier, G. Perugini. Lombardi SA, Minusio, 2018.
!

MODULE LOSA_PARAMETERS

IMPLICIT NONE

! input variables definition
REAL(EB) :: INC_LIM_TMP,INC_LIM_CO,INC_LIM_CO2,INC_LIM_O2,INC_LIM_HCN,INC_LIM_VIS,INC_LIM_RAD
! input variables definition
TYPE N_INC ! number of incapacitated agents
INTEGER :: TMP,CO,CO2,O2,HCN,VIS,RAD
END TYPE N_INC

END MODULE LOSA_PARAMETERS
