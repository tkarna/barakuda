#!/bin/bash

#==========================================================
#
#         Configuration file for
#
# OCEAN MONITORING for NEMO-ORCA2 v3.6 of EC-Earth 3.2 beta tunning on 31 levels
#
#            Machine: MareNostrum@BSC
#
#        L. Brodeau, January 2017
#
#===========================================================
#export PROJ_LIB=${WRKDIR}"/miniconda2/share/proj"

export PATH=${PATH}:/wrk/puotila/DONOTREMOVE/taito/bin

export HCONF=ORCA2
export CONF=${HCONF}.L31 ; # horizontal global ORCA configuration
export NBL=31         ; # number of levels

export MASTERMIND="UH / "${USER} ; # same here, who's the person who designed/ran this simulation?
export HOST=taito.csc.fi; # this has no importance at all, it will just become an "info" on the web-page!
export EXTRA_CONF="SI3, NEMO 4.0" ;   #  // same here ...

export STORE_DIR=${WRKDIR}"/DONOTREMOVE/sig2019/nemo4.0/cfgs/MY_ORCA2_ICE"

export CONF_INI_DIR=${WRKDIR}"/DONOTREMOVE/NEMO/"${HCONF}

export DIAG_DIR=/wrk/puotila/DONOTREMOVE/NEMO/barakuda_diags/${CONF}"

export PYTHON_HOME=${WRKDIR}"miniconda2/bin/python2.7" ; # HOME to python distribution with matplotlib and basemap !

export DIR_NCVIEW_CMAP="${BARAKUDA_ROOT}/src/ncview_colormaps"

# Is it an ec-earth run?
export ece_exp=0 ; # 0 => not an EC-Earth run, it's a "pure" ocean-only NEMO run done from traditional NEMO setup
#                  # 1 => it's an OCEAN-ONLY EC-Earth run done from a EC-Earth setup
#                  # 2 => it's a  COUPLED  EC-Earth run
#
export Y_INI_EC=0001 ;    # initial year if ec-earth run...

# List of suffixed of files that have been saved by NEMO and that are needed for the diags:
export NEMO_SAVED_FILES="grid_T grid_U grid_V icemod SBC"

# Directory structure in which to find NEMO output file (use <ORCA> and <RUN>):
export NEMO_OUT_STRCT=${STORE_DIR}"/"${EXP}

export TSTAMP="1m"   ; # output time-frequency stamp as in NEMO output files...

# In case 3D fields have been saved on an annual mean basis rather than montly:
export ANNUAL_3D="" ;   # leave blanck "" if 3D fields are in monthly files...
export NEMO_SAVED_FILES_3D="" ; #     ''

# How does the nemo files prefix looks like
# Everything before "<year_related_info>_grid_<X>" or "<year_related_info>_icemod"
# use <ORCA>, <RUN> and <TSTAMP>=>  Ex: export NEMO_FILE_PREFIX="<ORCA>-<RUN>_<TSTAMP>_"
export NEMO_FILE_PREFIX="<ORCA>_<TSTAMP>_"
# => should get rid of TSTAMP actually...

# Temporary file system (scratch) on which to perform the job you can use <JOB_ID> if scracth depends on JOB ID:
export SCRATCH=${HOME}"/tmp"


####### NEMO => what fields in what files ??? ############
#       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   => depends on the XIOS *.xml setup you used...
#   => always specify a string for the NN_* variables
#      even when missing from your files (ex: NN_MLD="xx")
#
# State variables and others in grid_T files:
export NN_SST="tos"
export NN_SSS="sos"
export NN_SSH="zos"
export NN_T="thetao"
export NN_S="so"
export NN_MLD="mldr10_1"
#
# State variables and others in grid_U files:
export NN_U="uo"
export NN_TAUX="tauuo"
export NN_U_EIV="0" ; # 0 => ignore
# State variables and others in grid_V files:
export NN_V="vo"
export NN_TAUY="tauvo"
export NN_V_EIV="0" ; # 0 => ignore
#
# Sea-ice fields:
export FILE_ICE_SUFFIX="icemod" ; # in what file type extension to find ice fields
export NN_ICEF="siconc" ; # name of ice fraction in "FILE_ICE_SUFFIX" file...
export NN_ICET="sivolu" ; # ice thickness or rather volume...
#
# Surface fluxes:
export FILE_FLX_SUFFIX="SBC" ; # in what file type extension to find surface fluxes
export NN_FWF="empmr"        ; # name of net freshwater flux (E-P-R) in "FILE_FLX_SUFFIX" file...
export NN_EMP="emp_oce"      ; # name of E-P in "FILE_FLX_SUFFIX" file...
export NN_P="precip"         ; # name of total precipitation (solid+liquid) in "FILE_FLX_SUFFIX" file...
export NN_RNF="runoffs"      ; # name of continental runoffs in "FILE_FLX_SUFFIX" file...
export NN_CLV="calving_cea"  ; # calving from icebergs in "FILE_FLX_SUFFIX" file...
export NN_E="evap_ao_cea"    ; # name of total evaporation in "FILE_FLX_SUFFIX" file...
export NN_QNET="qt_oce"      ; # name of total net surface heat flux in "FILE_FLX_SUFFIX" file...
export NN_QSOL="qsr_oce"     ; # name of net surface solar flux in "FILE_FLX_SUFFIX" file...
export NN_TAUM="taum"        ; # name of Wind-stress module in "FILE_FLX_SUFFIX" file...
export NN_WNDM="wspd"        ; # name of surface wind  speed module in "FILE_FLX_SUFFIX" file...
#
################################################################################################

# Land-sea mask and basins files:
export MM_FILE=${CONF_INI_DIR}/mesh_mask_ORCA2.L31.nc
export BM_FILE=${CONF_INI_DIR}/basin_mask_ORCA2.L31.nc

# OBSERVATIONS / REFERENCES
# 3D monthly climatologies of potential temperature and salinity (can be those you used for the NEMO run):
export NM_TS_OBS="EN4.2.0 [1990-2010]"
export F_T_OBS_3D_12=${CONF_INI_DIR}/data_1m_potential_temperature_nomask_${HCONF}.nc
export F_S_OBS_3D_12=${CONF_INI_DIR}/data_1m_salinity_nomask_${HCONF}.nc
export F_SST_OBS_12=${CONF_INI_DIR}/sst_data_${HCONF}.nc
export NN_T_OBS="votemper"
export NN_S_OBS="vosaline"
export NN_SST_OBS="sst"
#
# Sea-ice:
export NM_IC_OBS="HadISST [1980-1999]"
export F_ICE_OBS_12=${CONF_INI_DIR}/sic_360x180-ORCA2_HadISST_sosie_bilin.nc
export NN_ICEF_OBS="sic"
#
# Surface Heat fluxes:
export NM_QSOL_OBS="NOCS 2.0 [1980-2005]"
export F_QSOL_OBS_12=${BARAKUDA_ROOT}/data/obs/radsw_monthly_clim_1980-2005_NOCS2.nc4
export NN_QSOL_OBS="radsw"

# A text file where the vertical hydraugraphical sections of interest are defined :
#export TRANSPORT_SECTION_FILE="${BARAKUDA_ROOT}/data/transportiz_${HCONF}_all.dat"
export TRANSPORT_SECTION_FILE="${BARAKUDA_ROOT}/data/transportiz_${HCONF}.dat"
export TRANSPORT_SECTION_FILE_ICE="${BARAKUDA_ROOT}/data/transport_ice_${HCONF}.dat"  ; # set i_do_trsp_ice=1 !

# For transport by sigma-class:
export DENSITY_SECTION_FILE="${BARAKUDA_ROOT}/data/dens_section_${HCONF}.dat"

# Files with the list of rectangular domains to "analyze" more closely:
export FILE_DEF_BOXES="${BARAKUDA_ROOT}/data/def_boxes_convection_${HCONF}.txt"
export FILE_DMV_BOXES="${BARAKUDA_ROOT}/data/def_boxes_convection_${HCONF}.txt"

# In what format should figures be produced ('png' recommanded, 'svg' works):
export FIG_FORM="png"

# About remote HOST to send/install HTML pages to:
export ihttp=0                  ; # do we export on a remote http server (1) or keep on the local machine (0)
export RHOST=whitehouse.gov.org ; # remote host to send diagnostic page to///
export RUSER=donald             ; # username associated to remote host (for file export)
export RWWWD=/data/www/barakuda/ec-earth_3.2b ; # directory of the local or remote host to send the diagnostic page to



#########################
# Diags to be performed #
#########################

# Movies of SST and SSS compared to OBS:
export i_do_movi=1

# Basic 3D and surface averages:
export i_do_mean=1

# IFS surface fluxes of heat and freshwater
export i_do_ifs_flx=0 ; # only relevant when ece_run=2...

# AMOC:
export i_do_amoc=1
export LMOCLAT="20-23 30-33 40-43 45-48 50-53" ; # List of latitude bands to look in for max of AMOC

# Transport of mass, heat and salt through specified sections (into TRANSPORT_SECTION_FILE):
export i_do_trsp=1  ; # transport of mass, heat and salt through specified sections
#              # i_do_trsp=2 => treat also different depths range!
z1_trsp=100  ; # first  depth: i_do_trsp must be set to 2
z2_trsp=1000 ; # second depth: i_do_trsp must be set to 2

# Solid freshwater transport through sections due to sea-ice drift
export i_do_trsp_ice=0 ; # must have i_do_ice=1

# Meridional heat/salt transport (advective)
export i_do_mht=1

# Transport by sigma class
export i_do_sigt=1

# Sea-ice diags
export i_do_ice=1  ; # Sea-ice diags

# Budget on pre-defined (FILE_DEF_BOXES) rectangular domains:
export i_do_bb=1   ; # Budget and other stuffs on a given rectangular box!
#             # => needs file FILE_DEF_BOXES !!!
# => produces time-series f(t)  (mean of 2D fields)

# Vertical profiles on of box-averaged as a function of time...
export i_do_box_TS_z=1 ; # do sigma vert. profiles on given boxes... # 1 => no figures, 2 => figures
#                 # => needs file FILE_DEF_BOXES !!!
# => produces time-series f(t,z)

# Deep Mixed volume in prescribed boxes:
export i_do_dmv=1
export MLD_CRIT="1000,725,500"

# User-defined meridional or zonal cross sections (for temperature and salinity)
# => TS_SECTION_FILE must be defined!
export i_do_sect=1
export TS_SECTION_FILE="${BARAKUDA_ROOT}/data/TS_sections.dat"



# BETA / TESTING / NERDY (at your own risks...):
#
export i_do_ssx_box=0 ; # zoom on given boxes (+spatially-averaged values) for surface properties
#                     # boxes defined into barakuda_orca.py ...

# Some nerdy stuffs about the critical depth in prescribed boxes:
export i_do_zcrit=0

# Fresh-water transport associated to sea-ice transport
#  => must compile cdficeflux.x but depends on more recent CDFTOOLS module...
export i_do_icet=0 ; # treat sea-ice volume transport!
export TRANSPORT_ICE_SECTION_FILE="${BARAKUDA_ROOT}/data/transportiz_${HCONF}_ARCTIC.dat"

export i_do_amo=0 ;  # buit a SST time serie usable to build Atlantic Multidecadal Oscilation index




# Place for potential specific host-related survival tricks:

