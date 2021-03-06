:PARAMETERS NODE=ND2100,CMD=DIRECT
; ** This uses PKRUMV's new EBUS code. **
SYSNO
DAYTIME
; This CTL file rebuilds the BND file for an EBUS base from scratch.
; The following files must exist:
DIRECT \NODE\.TYM,\NODE\.T01,\NODE\.CMD,\NODE\.C00,\NODE\.C01
DIRECT ISXRAY.GGY,GOODGY.NQA

; Create the ISIS Kernel from NDxxxx.TYM
R (SYS)NAD
;X\NODE\.CMD

; Create the node code for slot 0 from NDxxxx.TYM
R (SYS)NAD
;X\NODE\.C00

; Create the Engine code that runs in Slot 1 from NDxxxx.T01
R (SYS)NAD
;X\NODE\.C01

; Build BND file.  Note that the 68K code is the same in all bases.
R (SYS)MERLIN
\NODE\.BND=\NODE\.NIB,\NODE\.N00,\NODE\.N01,(EBUS)EBUS02.O02/S

;The NIB files are not needed and can be deleted.
\CMD\ \NODE\.NIB,\NODE\.N00,\NODE\.N01
DIRECT \NODE\.BND
 