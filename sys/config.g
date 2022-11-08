; Configuration file for BTT E3 RRF v1.0 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.10+4-LPC on Tue Jan 19 2021 17:25:01 GMT+0800 (中国标准时间)

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"BTT-OctoPus Pro"                           ; set printer name


;Display
M950 P1 C"E.12"
M42 P1 S0
G4 P500
M42 P1 S1
M918 P2 F1000000 C30 E4

Display led
M950 P2 C"E.15"
M42 P2 S1
G4 P100
M42 P2 S0
G4 P100
M42 P2 S1      
G4 P100
M42 P2 S0  
G4 P100
M42 P2 S1      
      
; Network
M552 S1                                      ; enable network
M586 P0 S1                                   ; enable HTTP
M586 P1 S0                                   ; disable FTP
M586 P2 S0                                     ; disable Telnet


; Drives
;M584 X0 Y1 Z3:4 E5:6  ;U2                              ; physical drive 0.3 goes forwards
;X0 Y1 Z3:4 U2 E5:6
;K0 Y1:-1:0:-1  
M669 K0 Y1:1:0:-1                                 ; kinematiks

M569 P0 S1 D2 H25 V25                      ; physical drive 0.0 goes forwards 1
M569 P1 S1 D2 H25 V25                    ; physical drive 0.1 goes forwards 0
M569 P2 S0 D2 H25 V25                     ; physical drive 0.2 goes forwards 1
M569 P3 S0 D3 H25 V25                      ; physical drive 0.3 goes forwards
M569 P4 S0 D3 H25 V25
M569 P5 S0
M569 P6 S0

M584 X0 Y1 U2 Z3:4 E5:6                               ; physical drive 0.3 goes forwards

M350 U16 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation

;M669 K0 Y1:1:0:-1 
M669 K1 X1:0:0:0 Y1:-1:0:1 Z0:0:1:0 U0:0:0:1; Matrix mapping for Axis - X:Y:Z:U


M92 U100.00 X100.00 Y100.00 Z400.00 E418.00        ; set steps per mm
M566 X900.00 U900.00 Y600.00 Z180.00 E600.00 P1    ; set maximum instantaneous speed changes (mm/min)
M203 U6000.00 X6000.00 Y6000.00 Z900.00 E6000.00   ; set maximum speeds (mm/min)
M201 U1500.00 X1500.00 Y1500.00 Z100.00 E1000.00   ; set accelerations (mm/s^2)
M906 U1100 X1100 Y1100 Z800 E800 I30           ; set motor currents (mA) and motor idle factor in per cent
M84 S15                                            ; Set idle timeout
                                      
; Axis Limits
M208 X0 U55.5 Y0 Z0 S1
M208 X215 U269.5 Y300 Z300 S0

; Endstops
M574 X1 S1 P"xstop"                            ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                            ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"e1stop+e0stop"                            ; configure active-high endstop for low end on Z via pin zstop
M574 U2 S1 P"zstop"
;M591 D0 P7 C"e0stop" S1  R50:130 L7.0 E10
;M591 D1 P7 C"e1stop" S1  R50:130 L7.0 E10

; Z-Probe
;M950 S0 C"servo0"                              ; create servo pin 0 for BLTouch
;M558 P9 C"^probe" H5 F120 T6000                ; set Z probe type to bltouch and the dive height + speeds
;G31 P500 X-40 Y-10 Z2.95                      ; set Z probe trigger value, offset and trigger height
;M557 X10:210 Y10:210 S40                       ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 R0.388 C448.3 D0.83 S1.00 V24.0
M140 H0                                        ; map heated bed to heater 0
M143 H0 S100 A3                                  ; set temperature limit for heater 0 to 150C

; T0 = Ext0
M308 S1 P"e0temp" Y"thermistor" T100000 B3950    ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                             ; create nozzle heater output on e0heat and map it to sensor 1
;M307 H1 B0 R2.603 C234.2 D7.11 S1.00 V24.0      ; disable bang-bang mode for heater  and set PWM limit
M307 H1 B0 R2.747 C226.5:181.7 D5.37 S1.00 V24.0
M143 H1 S280 A3                                  ; set temperature limit for heater 1 to 300C

; T1
M308 S2 P"e1temp" Y"thermistor" T100000 B3950
M950 H2 C"e1heat" T2 
;M307 H2 B0 R2.543 C189.1 D8.28 S1.00 V24.0
M307 H2 B0 R2.593 C256.9:190.6 D6.44 S1.00 V24.0
M143 H2 S280 A3

;Driver
M308 S4 P"e2temp" Y"thermistor" A"Drivers" T100000 B3950  ; configure sensor 1 as thermistor on pin temp0
M950 H4

; T2
;M308 S3 P"e2temp" Y"thermistor" T100000 B3950
;M950 H3 C"e2heat" T3
;M307 H3 B0 S1.00
;M143 H3 S300

; T3
;M308 S4 P"e3temp" Y"thermistor" T100000 B3950
;M950 H4 C"e3heat" T4
;M307 H4 B0 S1.00
;M143 H4 S300

; Fans
;Fan model1
M950 F0 C"heat3" Q500                          ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1  C"Model0"                               ; set fan 0 value. Thermostatic control is turned off

;Fan hotend1
M950 F1 C"fan5" Q50                          ; create fan 1 on pin fan1 and set its frequency
M106 P1 X0.6 H1 T50 C"Hotend0"

;Fan model2
M950 F2 C"fan2" Q500
M106 P2 S0 H-1 C"Model1"

;Fan hotend 2
M950 F3 C"fan3" Q500
M106 P3 X0.6 H2 T50 C"Hotend1"

;Fan driver
M950 F4 C"fan4" Q100                           ; create fan 2 on pin out3 and set its frequency
M106 P4 X0.6 H4 T40C"Drivers"

;M950 F4 C"fan4" Q1000
;M106 P4 S0 H-1
;M950 F5 C"fan5" Q1000
;M106 P5 S0 H-1

; Tools
; Create a tool that uses the low end (X) carriage
M563 P0 D0 H1 F0 S"Ext0"                               ; define tool 0
G10 P0 X0 Y0.5 Z0 S0 R0                               ; set tool 0 axis offsets  

; Create a tool that uses the high end (U) carriage
M563 P1 D1 H2 X3 F2 S"Ext1"
G10 P1 Y0 U1.5 Z-0.1 S0 R0

; Create a tool that prints 2 copies of the object using both carriages
;инструмент, который печатает 2 копии объекта с использованием обеих кареток
;M563 P2 D0:1 H1:2 X0:3 F0:2    ; tool 2 uses both extruders and hot end heaters, maps X to both X and U, and uses both print cooling fans 
;G10 P2 X50 Y0 U-50 S0 R0       ; set tool offsets and temperatures for tool 2

;M567 P2 E1:1 ; set mix ratio 100% on both extruders   соотношение смешивания 100% на обоих экструдерах
;M568 P2 R230 S235 ; turn on mixing for tool 2  смешивание для инструмента 2

;M563 P2 D2 H3 F2 S"Ext2"
;G10 P2 X0 Y0 Z0 S0 R0

;M563 P3 D3 H4 F3 S"Ext3"
;G10 P3 X0 Y0 Z0 S0 R0


; Custom settings are not defined
; Miscellaneous
;M575 P1 S1 B57600                              ; enable support for PanelDue
;M575 P1 S2 B57600

;Port for TFT
M575 P1 S1 57600

M150 X2
T0 P0
