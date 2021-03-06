:LOGFILE EBUS20.LOG
;  This CTL file creates EBUS 02.00 listings and binaries
;          Output files:
;    EBUS20.NIB = Engine object code, slot 1
;    EBUS20.LST = Engine cross reference listing
;    EBUS20.SRE = 68000 object code stored in slot 2
;    EBUS20.LIS = 68000 cross reference listing
;    EBUS20.BND = Bound file to be loaded into node
WATCH ALL

;Create EBUS20.SRE and EBUS20.LIS
DIR EBUS20.LIS/SIZE
RUN (MPL)ASM68K
EBUS20.LIS=EBUS02.J00/X
RUN (SYS)TYPE
EBUS20.LIS=EBUS20.LIS/FORTRAN/EXIT
DIRECT EBUS20.LIS/SIZE

;Create EBUS20.NIB and EBUS20.LST
R NAD
LIST -X,-R
4,EBUS20;(
 TITLE ISIS 7.01 interface to intelligent peripheral processor--EBUS
;@EBUS02.I00
;@EBUS02.T00
;@EBUS02.R00
;)
1;FEBUS20.NIB
CTA,CTASIZ;PSEG0,S0SIZE;PSEG1,S1SIZE;PSEG2,S2SIZE;P%P
%Q
CROSS

;Load new slot 1 and slot 2 into existing kernel and slot 0
R MERLIN
EBUS20.BND=ND2100.BND,,EBUS20.NIB,EBUS20.SRE/S

DIRECT EBUS21.*
;End of EBUS20.CTL
 