:LOGFILE EBUS21.LOG
;  This CTL file creates EBUS 02.01 listings and binaries
;          Output files:
;    EBUS21.NIB = Engine object code, slot 1
;    EBUS21.LST = Engine cross reference listing
;    EBUS21.SRE = 68000 object code stored in slot 2
;    EBUS21.LIS = 68000 cross reference listing
;    EBUS21.BND = Bound file to be loaded into node
WATCH ALL

;Create EBUS21.SRE and EBUS21.LIS
RUN (MPL)ASM68K
EBUS21.LIS/X=EBUS02.J01
RUN (SYS)TYPE
EBUS21.LIS=EBUS21.LIS/FORTRAN/EXIT

;Create EBUS21.NIB and EBUS21.LST
R NAD
LIST -X,-R
4,EBUS21;(
 TITLE ISIS 7.01 interface to intelligent peripheral processor--EBUS
;@EBUS02.I01
;@EBUS02.T01
;@EBUS02.R01
;)
1;FEBUS21.NIB
CTA,CTASIZ;PSEG0,S0SIZE;PSEG1,S1SIZE;PSEG2,S2SIZE;P%P
%Q
CROSS

;Load new slot 1 and slot 2 into existing kernel and slot 0
R MERLIN
EBUS21.BND=ND2100.BND,,EBUS21.NIB,EBUS21.SRE/S

DIRECT EBUS21.*
;End of EBUS21.CTL
 