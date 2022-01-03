#If WinActive("ahk_exe FL64.exe")
; -- Win History -------------------
Tab::
    freezeExecute("activatePrevPlugin")
    return
^Tab::
    freezeExecute("activateNextPlugin")
    return

CapsLock::
    freezeExecute("activatePrevMainWin")
    return 
^CapsLock::
    freezeExecute("activateNextMainWin")
    return     

+^Tab::
    freezeExecute("toolTipChoiceActivatePlugin")
    return
+^CapsLock::
    freezeExecute("toolTipChoiceActivateMainWin")
    return
#If
#If WinActive("ahk_exe FL64.exe") and whileToolTipChoiceActivateWin and !acceptPressed
~Shift & Ctrl Up::
~Ctrl & Shift Up::
    acceptPressed := True
    return
#If

#If WinActive("ahk_exe FL64.exe") and whileToolTipChoice
+^WheelUp::
    incrToolTipChoiceIndex()
    return

+^WheelDown::
    decrToolTipChoiceIndex()
    return    
#If
; ----