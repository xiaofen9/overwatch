; <COMPILER: v1.1.24.01>
Box_Init(C="00FF00") {
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
Gui Add, Text, x220 y25 w130 h30, 1280x720 Mode [F1]
Gui Add, Text, x220 y45 w110 h30, 1920x1080 Mode [F2]
Gui Add, Text, x220 y65 w160 h30, Restart Program [F3]
Gui Add, Text, x220 y85 w110 h30, Pause/Resume [ALT]


Gui Add, GroupBox, x10 y120 w160 h45, Speed
Gui Add, GroupBox, x10 y10 w180 h100, Intro
Gui Add, Text, x20 y30 w165 h25, Overkill aimming assitant
Gui Add, Text, x20 y55 w165 h25, Active when fire


Gui Add, Text, x40 y144 w35 h20, rx:
Gui Add, Edit, x80 y140 w50 h20 vrx, 5
Gui Add, Button, x230 y210 w100 h20 gsub1, How-to
Gui Add, Button, x230 y240 w100 h20 gsub2, Get lastest ver
Gui Add, GroupBox, x8 y265 w187 h210, Misc
Gui Add, CheckBox, x16 y288 w160 h20 voverlayActive, Overlay
;Gui Add, CheckBox, x16 y288 w160 h20 vmccree, Mccree Right Click No Recoil
;Gui Add, CheckBox, x16 y308 w160 h20 vtorbjorn, Torbjorn Fast Reload
;Gui Add, CheckBox, x16 y328 w160 h20 vpharah, Pharah Fast Reload
Gui Add, CheckBox, x16 y328 w160 h20 vreaper, Reaper Fast Reload
Gui Add, Text, x16 y428 w160 h20, LtoRaddendOffset:
Gui Add, Edit, x16 y448 w160 h20 vLtoRaddendOffset, 1.2
;Gui Add, CheckBox, x16 y368 w160 h20 vroadhog, RoadHog Fast Reload
;Gui Add, CheckBox, x16 y388 w160 h20 vroadhog1, RoadHog Combo
;Gui Add, CheckBox, x16 y408 w160 h20 vgenji, Genji combo
;Gui Add, CheckBox, x16 y288 w160 h20 vbunny, Bunnyhop
Gui Add, Text, x16 y200 w33 h20, x-axis:
Gui Add, Slider,x48 y200 w130 h25 vxrange Invert Tickinterval1 range1-4, 4
Gui Add, Text, x16 y224 w35 h19, y-axis:
Gui Add, Slider,x48 y224 w130 h25 vyrange Invert Tickinterval1 range1-4, 4
Gui Add, Edit, x315 y140 w30 h20 vya, 0
Gui Add, Text, x280 y140 w35 h20, Y:
Gui Add, Text, x208 y140 w35 h20, X:
Gui Add, Edit, x240 y140 w35 h20 vxa, 0
Gui Add, GroupBox, x205 y120 w160 h45, Shoot 
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
msgbox, How-to:`n`nLaunch Game. Set display mode to Borderless Windowed mode in Settings.`nResolution has to be 720p or 1080p. As precaution, set your quality settings to Low.`n`nTo-use:`nPress F1 or F2 depending on your resolution.`nShoot an Enemy. When the Health Bar is visible, overkill will start to auto-aimming.`n`n Speed: represent the moving speed of auto-aimming. If your mouse shakes badly, you should turn it down, otherwise you should turn it up.`n`n Shoot: represent the offset of the final aimming point. If you think this point on the left of the adversaries' head, increase X. If you think this point is higher than the adversaries' head, increase Y. `n`n Misc: Just explore it.
}
return

sub2:
{
Run, https://github.com/xiaofen9/overwatch
}

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
GuiControlget, rx
GuiControlget, xa
GuiControlget, ya
GuiControlget, xrange
GuiControlget, yrange

;detection box
LargeX1 := 0 + (A_Screenwidth * (xrange/10))
LargeY1 := 0 + (A_Screenheight * (yrange/10))-40
LargeX2 := A_Screenwidth - (A_Screenwidth * (xrange/10))
LargeY2 := A_Screenheight - (A_Screenheight * (yrange / 10))-75
SmallX1 := LargeX1 + 40
SmallY1 := LargeY1 
SmallX2 := LargeX2 - 40
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
headX :=1+xa
headY := 19+ya*5
AimX := AimPixelX - ZeroX +headX
AimY := AimPixelY - ZeroY +headY
If ( AimX+5 > 0) {
DirX := rx / 10
}
If ( AimX+5 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rx /10
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10
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
BodyVariation := 60
BodyCol := 0xFF0013
FoundFlag :=false

if(overlayActive=1){
Box_Init("00FF00")
Box_Draw(LargeX1, LargeY1 , LargeX2-LargeX1, LargeY2-LargeY1)
}

Loop, {
Gui,Submit, Nohide

GoSub SearchBot
GetKeyState, Mouse2, LButton, P
if ( Mouse2 == "D" ) {
if (FoundBody = true)
{
	GoSub GetAimOffsetBody
	GoSub GetAimMovesBody
	GoSub MouseMoves1
}
else
{
	GoSub GetAimOffset1
	GoSub GetAimMoves1
	GoSub MouseMoves1
}



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
ToolTip, %FoundFlag% | %FoundBody% | %AimPixelY% | %AimPixelYBody% 
;MouseGetPos, MX, MY
;ToolTip, %LargeX1% | %LargeY1% | %LargeX2% | %LargeY2% | %MX% | %MY%
FoundBody := false
;if ( not FoundFlag ) {
	PixelSearch, AimPixelX, AimPixelY, LargeX1, LargeY1, LargeX2, LargeY2, EMCol, ColVn, Fast RGB
	if (ErrorLevel = 0) 
	{
		FoundFlag := true
		;tmpAimPixelX = AimPixelX 
		;tmpAimPixelY = AimPixelY+20
		PixelSearch, AimPixelXBody, AimPixelYBody, AimPixelX, AimPixelY+30, LargeX2, LargeY2, BodyCol, BodyVariation, Fast RGB
		if ErrorLevel = 0
			FoundBody := true
		else
			FoundBody := false
	}
	else 
	{
		FoundFlag := false
	}
;}
;else {
;	PixelSearch, AimPixelX, AimPixelY, SmallX1, SmallY1, SmallX2, SmallY2, EMCol, ColVn, Fast RGB
;	if (ErrorLevel = 0)
;	{
;		;tmpAimPixelX = AimPixelX 
;		;tmpAimPixelY = AimPixelY+20
;		PixelSearch, AimPixelXBody, AimPixelYBody, AimPixelX, AimPixelY+35, SmallX2, SmallY2, BodyCol, BodyVariation, Fast RGB
;		if ErrorLevel = 0
;		{
;			FoundBody := true
;		}
;		else
;		{
;			FoundBody := false
;		}
;	}
;	else
;	{
;		FoundFlag := false
;	}
;}
Return



GetAimOffset1:
Gui,Submit, Nohide
moveToRight := 0
headX := 42+xa*3
headY := 85+ya*5
AimX := AimPixelX - ZeroX +headX
AimY := AimPixelY - ZeroY +headY
If ( AimX+4 > 0) {
DirX := rx / 10
moveToRight := 1
}
If ( AimX+4 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rX /10 
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10 
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return


GetAimOffsetBody:
Gui,Submit, Nohide

AimX := AimPixelXBody - ZeroX
AimY := AimPixelYBody - ZeroY + 5 
If ( AimX+4 > 0) {
DirX := rx / 10
}
If ( AimX+4 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rX /10 
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10 
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return



GetAimMoves1:
;RootX := Ceil(AimOffsetX)
;RootY := Ceil(AimOffsetY)
RootX := AimOffsetX
RootY := AimOffsetY
if (moveToRight)
{
	MoveX := RootX * DirX + LtoRaddendOffset ;tested with 15 sensitivity, the addend should be larger than 1.3 when sensitivity is smaller than 15
	;MoveX := RootX * (DirX + 0.5) 
}
else
{
	MoveX := RootX * DirX
}
;MoveX := RootX * DirX
MoveY := RootY * DirY
;GoSub DebugTool1
Return

GetAimMovesBody:
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
