
M106 R2           ; restore print cooling fan speed
M116 P2 ; wait for tool 2 heaters to reach operating temperature
M83 ; relative extruder movement
M567 P2 E1:1 ; set tool mix ratio
M568 P2 R230 S235 ; turn on mixing for tool 2  смешивание для инструмента 2
G1 E2 F3600 ; extrude 2mm from both extruders
;M703