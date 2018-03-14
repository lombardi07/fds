!
! This module contains the input and output variables definition implemented by 
! Lombardi Sa to integrate following features:
! 1) Purser thermal dose concept (FTD);
! 2) Normative incapacitation limits (temperature, substances, radiation).
! Other than this module, source code changes have been made to the following
! files: cons.f90, type.f90, read.f90, evac.f90.
! To identify insertions and changes search with keyword "losa" in the respective files.
!
! Author: J. Maier, G. Perugini. Lombardi SA, Minusio, 2018.
!

! cons.f90
! input variables are defined to let the user set the incapacitative limits:
! "LIM_INC_TMP,LIM_INC_RAD,LIM_INC_CO,LIM_INC_CO2,LIM_INC_O2,LIM_INC_HCN,LIM_INC_VIS"
! variables are defined to store the maximum alive values of each quantity of interest:
! "LIM_TMP,LIM_RAD,LIM_CO,LIM_CO2,LIM_O2,LIM_HCN,LIM_VIS"
! the number of deaths caused by the limit concept is stored in the variable:
! "LIM_N_DEAD"

! type.f90
! under type definitions we define fields that store the actual value of incapacitating 
! quantities for all agents (later recalled with HR). without alive agents, values will
! fall to the following default values:
! "LimTmp=0._EB,LimRad=0._EB,LimCO=0._EB,LimCO2=0._EB,LimO2=100._EB,LimHCN=0._EB,LimVis=30._EB"
! concentration of substances are extracted by the "GET_FIRE_CONDITIONS" function (defined in 
! func.f90) called from evac.f90 and stored in the following "HUMAN_GRID" field variables:
! "LIM_C_CO,LIM_C_CO2,LIM_C_O2,LIM_C_HCN"
! agents are not killed or stopped from moving through the concept of limits, dead agents are
! only flagged in the following field:
! "LimFallenDown"
! initially assigned as ".FALSE."
! under the concept of doses, thermal effects are stored in a new field variable:
! "TmpDose"

! read.f90
! input variables defined in cons.f90 are assigned to the "MISC" namelist. default values
! are assigned to the variables if not defined by the user.

! evac.f90
! thermal fractional effective doses are implemented using Purser's concept of convective and
! radiative effects. these variables are stored in the "TmpDose" field of each agent (see
! type.f90). the "max_alive" and "max" values are calculated and stored in variables containing
! the word "TED". as with the narcotic dose "FED" a value >=1 will kill the agent and stop him
! from exerting any forces with the surrounding. the two quantities, FED and TED, are not
! cumulable.
! in the concept of limits the first incapacitating quantity that reaches its limit flags the
! corresponding agent as dead. this concept is implemented without altering the behaviour of
! agents in EVAC. concentrations of narcotic substances (CO, CO2, O2, HCN) are extracted from
! the fire calculation through the function "GET_FIRE_CONDITIONS". data of the "HUMAN_GRID" is
! saved on the disk, while concentrations from "EVAC_CORRS" are dumped.
! outputs are written in the *evac.csv file.
