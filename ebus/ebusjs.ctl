:LOGFILE EBUSJS.LOG
;  This CTL file creates EBUS 02.01 listings and binaries
;          Output files:
;    EBUSJS.NIB = Engine object code, slot 1
;    EBUSJS.LST = Engine cross reference listing
;    EBUSJS.SRE = 68000 object code stored in slot 2
;    EBUSJS.LIS = 68000 cross reference listing
;    EBUSJS.BND = Bound file to be loaded into node
WATCH ALL

;Create EBUSJS.SRE and EBUSJS.LIS
RUN (MPL)ASM68K
EBUSJS.LIS/X=EBUS02.JMS
RUN (SYS)TYPE
EBUSJS.LIS=EBUSJS.LIS/FORTRAN/EXIT

;Create EBUSJS.NIB and EBUSJS.LST
R NAD
LIST -X,-R
4,EBUSJS;(
 TITLE ISIS 7.01 interface to intelligent peripheral processor--EBUS
;@EBUS02.I01
;@EBUS02.T01
;@EBUS02.R01
;)
1;FEBUSJS.NIB
CTA,CTASIZ;PSEG0,S0SIZE;PSEG1,S1SIZE;PSEG2,S2SIZE;P%P
%Q
CROSS

;Load new slot 1 and slot 2 into existing kernel and slot 0
R MERLIN
EBUSJS.BND=NW2100.BND,,EBUSJS.NIB,EBUSJS.SRE/S

DIRECT EBUSJS.*
;End of EBUSJS.CTL
 