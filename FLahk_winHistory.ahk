; Author: François Martineau
; Date: January 2022
; This script is a small portion of FLahk https://github.com/francoismartineau/FLahk
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
#KeyHistory
#MaxHotkeysPerInterval 150

; -- lib
#Include lib/maLib.ahk

; -- utils
#Include utils/isWin.ahk
#Include utils/toolTipChoice.ahk
#Include utils/utils.ahk
#Include utils/wait.ahk
#Include utils/windows.ahk
#Include utils/winHistory.ahk


; -- program start -------------------------
#Include run/clock.ahk
#Include run/run.ahk
Menu, Tray, Icon, fl.ico,,1


; -- hotkeys -------------------------------
#Include hotkeys/hotkeys.ahk

; -- goto ----------------------------------
#Include run/goto.ahk
