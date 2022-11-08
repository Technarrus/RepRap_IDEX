;M561 ;clear all autocalibration or G92 settings
;G29 S1 P"PLA_70c.csv"
M572 D0:1 S0.05	;Set extruder pressure advance
M207 S0.7 F2400	;Set retract length
;M290 S-0.1; Babystep