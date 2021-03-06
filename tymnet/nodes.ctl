;This CTL file make sure that NODES.MAP is up to date.
;Whenever (TYMNET:34)NODES.MAP has changed, PJ notifies  all PDP-10
;systems.  They in turn run a job under SSPAMBIN to update NODES.MAP
;on their system.  Note that the SYSTAT program requires that
;NODES.MAP exist in directory TYMNET on all systems, and that it be
;protected with ALL RD RD.  Please notify the TYMCOM-X support group
;(408)922-6220 before changing this CTL file.  "Joe Smith"<JMS@F33>

R TELECOPY
REPLACE
UPDATE
(TYMNET:33)NODES.MAP,(TYMNET:*)NODES.MAP
QUIT
DECLAR ALL RD RD NODES.MAP
  