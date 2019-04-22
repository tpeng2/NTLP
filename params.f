
!Time step information
&step_params 
imndbug=0  	!manual debug
iti=0000000         !Time step to begin, 0 or xx9
itmax=000040   !Max number of time steps, ending with 0
imean=100    !Number of time steps between writing mean profiles to output log file
ihst=10     !Number of time steps between writing profiles to history file
itape=0020  !Number of time steps before opening new history file and writing full 3D volumes
itstr=00001      ! ending with 1
it_his=00001     !Time step to begin recording history files, xxxx1
it_viz=00001     !Time step to begin recording viz files ,xxxx1
i_viz=5000   !Time steps between writing to viz file, xxxx0
itn = 00  !Index for "u.le.cou001" files
cfl=0.6
/

!Flags for various features
&flags
noalis=1, ismlt=0, ifree=0, isfc=1, iradup=0
iupwnd=0, ibuoy=0, ifilt=0, itcut=1, isubs=0, ibrcl=0
iocean=0, method=3, idebug=1, iz_space=1
ivis0=0, ifix_dt = 0, new_vis=-1
ispray=1,icouple=0,iTcouple=1
iHcouple=1,ievap=1,iszcls=1,iSSGF=0,ivpran=1,irpsmp=1
iFnumsmp=1,impscl=1,impintv=1,impmnl=1
! isfc = 0 sets surface flux (qstar), isfc = 1 sets surface condition (Dirichlet through tsfcc)
! if set to 1, reads the initial condition from path_ran below; otherwise calls subroutine random
!iHcouple also controls TE couple
/
!c----  ! A. SIZE CLASS      
         !iszcls spray size
         !iszcls = 0, continuous class, mono 
         !iszcls = 1, poly-continuous size, 
         !iszcls = 2, bi-dispersed,
         !iszcls = 3, tri-dispersed (radius average),
                !itriavg=0, radius average
                !itriavg=1, area average
                !itriavg=2, geometric average
                !impmnl=0, automatic generate intermediate size
                !impmnl=1, manual input intermediate size
         !iszcls = 4, hexa-dispersed size (maunal input)
                !impmnl=0, automatic generate intermediate size
                !impmnl=1, manual input intermediate size
         !iszcls = 5, 35 sizes, size range embedded in the code  
!c---- ! B. SSGF (shape)
        ! iSSGF=0 (uniform),1(A98),2(MV14),3(binary equal)
!c---- ! C. Scale the mass
        !impscl=0, follow SSGF, =1, SSGF scaled again by mass
!c------- !iHcouple also controls TEcouple

!Grid and domain parameters
&grid_params
ncpu_s=4
Uo = 0.0  !Sets the magnitude of the top and bottom plate velocities (Couette flow -- assumes equal and opposite)
TtopC = 25  !Currently this should be (temperature, relative humidity) (used in DNS)
TbotC = 28  !Currently this should be (temperature, relative humidity) (used in DNS)
RHT=0.90
RHB=1.00
!wtsfc=0.0,0.0
zi=0.040 
zl=0.040 !always same as zl
zw1=0.00013333 !first grid
U10=40.0
/

&BCsICs
grav=9.81 !check if it is turned off in DNS
t00=273.15 !K=0C
fcor=0.0
dtdzf=0.003,0.003 
zo=0.1
ugcont = 0.01   !The initial u-velocity in the field
vgcont = 0.0   !The initial v-velocity
tnumpart=424643 !particle count, integer
massfrac=0.01 !m_water/m_air
part_grav=0.80278 !effective particle gravity
u_geo=0.332208140625000
v_geo=0.0
Vpmax=0.0895935
/

!Set the paths for code I/O. Must be on the scratch directory, not AFS!
&path_names
path_seed="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_part="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8/part.le.cou000"
path_res="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8/u.le.cou000"
path_sav="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_his="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_viz_xy="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_viz_xz="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_viz_yz="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_stuf="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_hist="/home/tpeng2/scratch365/tpeng2/NTLP/polytest8"
path_ran="/home/tpeng2/scratch365/tpeng2/NTLP/initfile/u.le.cou000"
/


!Material and particle properties and other constants
&constants
!iszcls 0
radius_init=200.00e-6
!iszcls 1-2
rpmin=25.0e-06
rpmax=350.0e-06
rp_inc=1.0e-6 !incremental values
!iszcls 3
!if impmnl=1
phmt1=0.25,phmt2=0.50,phmt3=0.25
!iszcls 4
rp1=20e-6,rp2=35e-6,rp3=45e-6
phm1=0.2,phm2=0.2,phm3=0.2
rp4=60e-6,rp5=100e-6,rp6=200e-6
phm4=0.4,phm5=0.5,phm6=0.5
rhow=1000.0 !kg/m^3
nuf=1.537e-05 !m^2/s
Cpp=4179.0 !J/kg-K
Cpa=1006.0 !J/kg-K
Pra=0.715  
Sc=0.615
Mw=0.018015 !kg/mol
Ru=8.3144
rhoa= 1.1 !kg/m^3
Lv=2427876.0 !for Tref=26C !2433424.0, 2430650.0,2427876.0,2425102.0, for 24-27C
Gam=7.28e-2
Ion=2.0
Os=1.093
Sal=34.0 !Salinity
Ms=0.05844
delta_vis=0.000163 !Bounce at viscous length
!Nrp=20
/

& PDF
tL1=0.0
tL2=35.0
dTp1=-3.00
dTp2=1.25
drp1=-3.75e-06
drp2=0.25e-06
dup1=-0.5
dup2=2.0
dvp1=-0.75
dvp2=0.75
dwp1=-0.5
dwp2=0.25
dTfp1=-0.5
dTfp2=1.8
dqfp1=-0.1e-4
dqfp2=2.0e-3
Tp1=297.0
Tp2=302.5
Tf1=297.5
Tf2=301.3
qstr1=0.02
qstr2=0.025
qinf1=0.02
qinf2=0.025
hmax1=0.0
/
