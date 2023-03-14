#SingleInstance Force
#UseHook
SendMode "Input"

^-::ExitApp
^+-::Reload ; Ctr-Shift--

; disable default function of CapsLock, toggle it with Ctrl-Alt-CapsLock instead
SetCapsLockState("AlwaysOff")
^!CapsLock::SetCapsLockState(GetKeyState("CapsLock", "T") = 1 ? "AlwaysOff" : "AlwaysOn")

#Include gui.ahk

navMode := false
SwitchMode(shouldActivateNavMode) {
	global navMode := shouldActivateNavMode
	UpdateGuiModeIndicator
}


`::F13 ; hotkey for macro in other programs
RAlt::AppsKey ; like rightclick
/::!Space ; open/close Flow launcher

#HotIf navMode
	#Include browser.ahk
#HotIf

#HotIf !navMode
	'::SwitchMode(true)
	; CapsLock & Escape::SwitchMode(true)
	; `; & q::SwitchMode(true)

	#Include special_chars.ahk
#HotIf

czechMode := false
#HotIf !czechMode
	[::{
		global czechMode := true
	}
	#Include navigation.ahk
#HotIf

#HotIf czechMode
	[::{
		global czechMode := false
	}
	#Include czech_chars.ahk
#HotIf



