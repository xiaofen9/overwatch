; <COMPILER: v1.1.24.01>
Box_Init(C="FF0000") {
Gui, 96: -Caption +ToolWindow +E0x20
Gui, 96: Color, % C
Gui, 97: -Caption +ToolWindow +E0x20
Gui, 97: Color, % C
Gui, 98: -Caption +ToolWindow +E0x20
Gui, 98: Color, % C
Gui, 99: -Caption +ToolWindow +E0x20
Gui, 99: Color, % C
}
Box_Draw(X, Y, W, H, T="1", O="I") {
If(W < 0)
X += W, W *= -1
If(H < 0)
Y += H, H *= -1
If(T >= 2)
{
If(O == "O")
X -= T, Y -= T, W += T, H += T
If(O == "C")
X -= T / 2, Y -= T / 2
If(O == "I")
W -= T, H -= T
}
Gui, 96: Show, % "x" X " y" Y " w" W " h" T " NA", Horizontal 1
Gui, 96:+AlwaysOnTop
Gui, 98: Show, % "x" X " y" Y + H " w" W " h" T " NA", Horizontal 2
Gui, 98:+AlwaysOnTop
Gui, 97: Show, % "x" X " y" Y " w" T " h" H " NA", Vertical 1
Gui, 97:+AlwaysOnTop
Gui, 99: Show, % "x" X + W " y" Y " w" T " h" H " NA", Vertical 2
Gui, 99:+AlwaysOnTop
}
Box_Destroy() {
Loop, 4
Gui, % A_Index + 95 ":  Destroy"
}
Box_Hide() {
Loop, 4
Gui, % A_Index + 95 ":  Hide"
}
guif:
#NoEnv
#SingleInstance force
SkinForm(Apply, A_ScriptDir . "\USkin.dll", A_ScriptDir . "\Milikymac.msstyles")
Firing := 0
Gui Add, Text, x220 y25 w130 h30, Run 1920x1080 Mode [F2]
Gui Add, Text, x220 y45 w110 h30, Restart Program [F3]
Gui Add, Text, x220 y65 w160 h30, Performance Statistics [F4]
Gui Add, Text, x220 y85 w110 h30, Pause/Resume [ALT]


Gui Add, GroupBox, x10 y120 w160 h45, Aim Speed Control
Gui Add, GroupBox, x10 y10 w160 h100, Intro
Gui Add, Text, x20 y30 w65 h25, active when fire


Gui Add, Text, x40 y144 w35 h20, rx:
Gui Add, Edit, x80 y140 w50 h20 vrx, 4
Gui Add, Button, x230 y210 w100 h20 gsub4, About Aim Speed
Gui Add, Button, x240 y230 w80 h20 gsub1, Issue
Gui Add, GroupBox, x8 y265 w187 h210, Misc
Gui Add, CheckBox, x16 y288 w160 h20 voverlayActive, Overlay
;Gui Add, CheckBox, x16 y288 w160 h20 vmccree, Mccree Right Click No Recoil
;Gui Add, CheckBox, x16 y308 w160 h20 vtorbjorn, Torbjorn Fast Reload
;Gui Add, CheckBox, x16 y328 w160 h20 vpharah, Pharah Fast Reload
Gui Add, CheckBox, x16 y328 w160 h20 vreaper, Reaper Fast Reload
;Gui Add, CheckBox, x16 y368 w160 h20 vroadhog, RoadHog Fast Reload
;Gui Add, CheckBox, x16 y388 w160 h20 vroadhog1, RoadHog Combo
;Gui Add, CheckBox, x16 y408 w160 h20 vgenji, Genji combo
;Gui Add, CheckBox, x16 y288 w160 h20 vbunny, Bunnyhop

Gui Add, Text, x16 y200 w33 h20, x-axis:
Gui Add, Slider,x48 y200 w130 h25 vxrange Invert Tickinterval1 range1-4, 4
Gui Add, Text, x16 y224 w35 h19, y-axis:
Gui Add, Slider,x48 y224 w130 h25 vyrange Invert Tickinterval1 range1-4, 4
Gui Add, Button, x240 y250 w80 h20 gsub2, How-to
Gui Add, Button, x240 y270 w80 h20 gsub3, Best
Gui Add, GroupBox, x8 y176 w185 h80, Range
Gui Add, Edit, x315 y140 w30 h20 vxy, 85
Gui Add, Text, x280 y140 w35 h20, y-axis:
Gui Add, Text, x208 y140 w35 h20, x-axis:
Gui Add, Edit, x240 y140 w35 h20 vxa, 58
Gui Add, GroupBox, x205 y120 w160 h45, Aim Settings
Gui Add, Button, x230 y170 w100 h20 gsub5, About Range
Gui Add, Button, x230 y190 w100 h20 gsub6, About Aim
Gui Add, Text, x220 y300 w130 h150, `n`nThe software is just for fun`n`nYou should only use it for legal propose`n`n
Gui Show, w372 h480, Overkill
Loop {
Gui, Submit, NoHide
Sleep -1
}
Return

F4::
Send {Ctrl Down}{Shift Down}{R Down}{Ctrl Up}{Shift Up}{R Up}
Return
#If bunny=1
*~$Space::
sleep 20
loop
{
GetKeyState, SpaceState, Space, P
if SpaceState = U
break
Sleep 1
Send, {Blind}{Space}
}
Return
#If
Return
Return


sub1:
{
msgbox, Having issues?`n`nMccree Right Click No Recoil Does NOT!!! work with right click aimlock`nHOLD DOWN RIGHT CLICK FOR IT TO WORK DONT JUST PRESS BUTTON`n`nAll Combos are middle mouse button`n`nCheat is CPU intensive and only uses math.`n`nLowFPS: Lower Aim speed to 1.`nLowFPS: Lower resolution to 720p and play on low.`nLowFPS: If you get low fps after a playthrough, press F3 to restart the cheat.`n`nCursor jumping left or right when using Aim key?`n`nJumpBug:Your PC is lagging out when using Aimkey. Check LowFPS solution.`nJumpBug: Switch your resolution to 720p but use F2(1080p) with Aim Speed 1.`n`nAlways try the cheat out in Practice Range to find your best settings.
}
return
sub2:
{
msgbox, How-to:`n`nLaunch Game. Switch to Borderless Windowed mode.`nResolution has to be 720p or 1080p. As precaution, set your quality settings to Low.`n`nTo-use:`nPress F1 or F2 depending on your resolution.`nShoot an Enemy. When the Health Bar is visible press the aimkey to snap onto the target.`n`nIf nothing is happening make sure you are not using any desktop applications that alter your color settings or are recording your gameplay such as W10 DVR or Fraps.
}
return
sub3:
{
msgbox, Best Settings for the cheat (Legit):`n`nResolution: 1920x1080`nAim Speed: 1
}
return
sub4:
{
msgbox, Higher the number, Faster the it locks on. `n`Lower the number, The slower it locks on.
}
return
sub5:
{
msgbox, Has 4 settings. `n`nStarts on its Lowest FoV. `n`nThe higher the fov the more the bot can see. `n`nX-Axis is side ways Y-Axis is up and down
}
return
sub6:
{
msgbox, This is where it aims. `n`nThe default settings is what is in all my previous verions. `n`nAs always X-Axis is side ways Y-Axis is up and down
}
return
GuiClose:
ExitApp
return
SkinForm(Param1 = "Apply", DLL = "", SkinName = ""){
if(Param1 = Apply){
DllCall("LoadLibrary", str, DLL)
DllCall(DLL . "\USkinInit", Int,0, Int,0, AStr, SkinName)
}else  if(Param1 = 0) {
DllCall(DLL . "\USkinExit")
}}
Change1:
MsgBox,  Applied
Gui,Submit, Nohide
return

F1::
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
#InstallKeybdHook
#UseHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Mouse, Screen
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Normal
ZeroX := 640
ZeroY := 360
CFovX := 320
CFovY := 200
ScanL := 500
ScanR := 800
ScanT := 180
ScanB := 400

;UI parameters
GuiControlget, rX
GuiControlget, xa
GuiControlget, ya
GuiControlget, xrange
GuiControlget, yrange

;detection box
LargeX1 := 0 + (A_Screenwidth * (xrange/10))
LargeY1 := 0 + (A_Screenheight * (yrange/10))-40
LargeX2 := A_Screenwidth - (A_Screenwidth * (xrange/10))
LargeY2 := A_Screenheight - (A_Screenheight * (yrange / 10))-75
SmallX1 := LargeX1 + 60
SmallY1 := LargeY1 
SmallX2 := LargeX2 - 60
SmallY2 := LargeY2 - 55

;parameters used for pixel search, ideal ColVn should be 0, meaning that EMCol is the exact color of health bar
EMCol := 0xFF0013
ColVn := 2
FoundFlag :=false

if(overlayActive=1){
Box_Init("FF0000")
Box_Draw(LargeX1, LargeY1 , LargeX2-LargeX1, LargeY2-LargeY1)
}

Loop, {
Gui,Submit, Nohide

GoSub SearchBot
GetKeyState, Mouse2, LButton, P
if ( Mouse2 == "D" ) {

GoSub GetAimOffset
GoSub GetAimMoves
GoSub MouseMoves

}




}

MouseMoves:
If ( Mouse2 == "D" ) {
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
}
Return

;MouseMoves1:
;If ( Mouse2 == "U" ) {
;DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
;}
;Return

GetAimOffset:
Gui,Submit, Nohide
AimX := AimPixelX - ZeroX +30
AimY := AimPixelY - ZeroY +50
If ( AimX+5 > 0) {
DirX := rx / 8
}
If ( AimX+5 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rX /10 *0.5
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10 *0.5
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return



GetAimMoves:
RootX :=  AimOffsetX 
RootY :=  AimOffsetY 
MoveX := RootX * DirX
MoveY := RootY * DirY
Return

SleepF:
SleepDuration = 1
TimePeriod = 1
DllCall("Winmm\timeBeginPeriod", uint, TimePeriod)
Iterations = 1
StartTime := A_TickCount
Loop, %Iterations% {
DllCall("Sleep", UInt, TimePeriod)
}
DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)
Return

DebugTool:
MouseGetPos, MX, MY
ToolTip, %AimOffsetX% | %AimOffsetY%
ToolTip, %AimX% | %AimY%
ToolTip, %IntAimX% | %IntAimY%
ToolTip, %RootX% | %RootY%
ToolTip, %MoveX% | %MoveY% || %MX% %MY%
Return

F2::
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 2000
#InstallKeybdHook
#UseHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Mouse, client
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Normal
ZeroX := 960
ZeroY := 540
CFovX := 80
CFovY := 200
ScanL := 660
ScanR := 1250
ScanT := 280
ScanB := 610

;UI parameters
GuiControlget, rX
GuiControlget, xa
GuiControlget, ya
GuiControlget, xrange
GuiControlget, yrange

;detection box
LargeX1 := 0 + (A_Screenwidth * (xrange/10))
LargeY1 := 0 + (A_Screenheight * (yrange/10))-40
LargeX2 := A_Screenwidth - (A_Screenwidth * (xrange/10))
LargeY2 := A_Screenheight - (A_Screenheight * (yrange / 10))-75
SmallX1 := LargeX1 + 60
SmallY1 := LargeY1 
SmallX2 := LargeX2 - 60
SmallY2 := LargeY2 - 55


;parameters used for pixel search, ideal ColVn should be 0, meaning that EMCol is the exact color of health bar
EMCol := 0xFF0013
ColVn := 1
FoundFlag :=false

if(overlayActive=1){
Box_Init("FF0000")
Box_Draw(LargeX1, LargeY1 , LargeX2-LargeX1, LargeY2-LargeY1)
}

Loop, {
Gui,Submit, Nohide

GoSub SearchBot
GetKeyState, Mouse2, LButton, P
if ( Mouse2 == "D" ) {

GoSub GetAimOffset1
GoSub GetAimMoves1
GoSub MouseMoves1

}




}






MouseMoves1:
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
Return

MouseMoves11:
If ( Mouse2 == "U" ) {
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
}



SearchBot:
if ( not FoundFlag ) {
	PixelSearch, AimPixelX, AimPixelY, LargeX1, LargeY1, LargeX2, LargeY2, EMCol, ColVn, Fast RGB
	if ErrorLevel = 1  
		FoundFlag := false
	else 
		FoundFlag := true
}
else {
	PixelSearch, AimPixelX, AimPixelY, SmallX1, SmallY1, SmallX2, SmallY2, EMCol, ColVn, Fast RGB
	if ErrorLevel = 1
		FoundFlag := false		
}
Return



GetAimOffset1:
Gui,Submit, Nohide
AimX := AimPixelX - ZeroX +42
AimY := AimPixelY - ZeroY +90
If ( AimX+4 > 0) {
DirX := rx / 8.5
}
If ( AimX+4 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rX /10 *0.55
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10 *0.5
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return

GetAimMoves1:
;RootX := Ceil(AimOffsetX)
;RootY := Ceil(AimOffsetY)
RootX := AimOffsetX
RootY := AimOffsetY
MoveX := RootX * DirX
MoveY := RootY * DirY
;GoSub DebugTool1
Return




reload:
SleepF1:
SleepDuration = 1
TimePeriod = 1
DllCall("Winmm\timeBeginPeriod", uint, TimePeriod)
Iterations = 1
StartTime := A_TickCount
Loop, %Iterations% {
DllCall("Sleep", UInt, TimePeriod)
}
DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)
Return


DebugTool1:
MouseGetPos, MX, MY
ToolTip, %xa% | %xy%
Return

~capslock::
pause
SoundBEEP
return
F3::
Reload
Return