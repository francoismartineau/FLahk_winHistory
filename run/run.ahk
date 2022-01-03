global toolTipIndex := {}
toolTipIndex["toolTipChoice"] := 10
toolTipIndex["pianoRollTempMsg"] := 11
toolTipIndex["acceptAbort"] := 12
toolTipIndex["debug"] := 13
toolTipIndex["pianoRollChordMsg"] := 14
toolTipIndex["pianoRollModeMsg"] := 15

global retrieveMouse
global freezeExecuting

freezeExecute(f, retrPos := True, retrWin := False, params*)  ; Change the signature: f, [params], pos, win)
{
    res := 
    if (!freezeExecuting)
    {
        freezeExecuting := True
        retrieveMouse := retrPos
        retrieveWin := retrWin

        Send {LWinUp}

        stopWinHistoryClock()
        freezeMouse()

        if (retrieveMouse)
            saveMousePos()
        if (retrieveWin)
            WinGet, id, ID, A

        CoordMode, Mouse, Client    
        res := execFunc(f, params*)
        
        if (retrieveMouse)  ; can be switched off by f
            retrieveMousePos() 
        if (retrieveWin)
            WinActivate, ahk_id %id%

        unfreezeMouse()
        startWinHistoryClock()
        toolTip()
        freezeExecuting := False
        stopExec := False
    }
    return res
}