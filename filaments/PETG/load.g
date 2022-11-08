
;T0		; Select tool
M291 P"Nozzle is being heated up" R"Loading PETG" T5 ; Display message
G10 S230 ; Set current tool temperature to 200C

M116 ; Wait for the temperatures to be reached
M291 P"Feeding filament..." R"Loading PETG" T5 ; Display new message

M140 S80

M300 S2000 P50
G4 P100
M300 S2500 P50
G4 P100
M300 S3000 P50
G4 P300

M300 S2000 P50
G4 P100
M300 S2500 P50
G4 P100
M300 S3000 P50
G4 P300
;M83 ; Extruder to relative mode
;G1 E50 F1200 ; Feed 60mm of filament at 3000mm/min
;G1 E50 F200 ; Feed 4mm of filament at 300mm/min
;G4 P1000 ; Wait one second
;G1 E-2 F1800 ; Retract 10mm of filament at 1800mm/min
;M400 ; Wait for moves to complete
;M292 ; Hide the message
;M84 E0
;M291 P"Done!" R"Loading PETG" T5 ; Display new message