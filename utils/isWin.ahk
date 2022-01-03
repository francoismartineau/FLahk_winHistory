isFLWindow(winId := "")
{
    if (winId == "")
        WinGet, winId, ID, A
    WinGet, program, ProcessName, ahk_id %winId%
    return program == "FL64.exe"
}

isPlugin(id := "", underMouse := False)
{
    if (id == "")
    {
        if (underMouse)
            MouseGetPos,,, id
        else
            WinGet, id, ID, A
    }
    WinGetClass, class, ahk_id %id%
    return class == "TPluginForm" or isWrapperPlugin(id, underMouse)
}

global yOffsetWrapperPlugin := 46
isWrapperPlugin(id := "", underMouse := False)
{
    if (id == "")
    {
        if (underMouse)
            MouseGetPos,,, id
        else
            WinGet, id, ID, A
    }
    WinGetClass, class, ahk_id %id%
    return class == "TWrapperPluginForm"    
}

isOneOfMainWindows(winId := "")
{
    if (!winId)
        WinGet, winId, ID, A
    return isMixer(winId) or isMainFlWindow(winId) or isPlaylist(winId)
}

isWindowHistoryExclude(winId := "")
{
    if (!winId)
        WinGet, winId, ID, A
    return isMainFlWindow(winId)

}

isMixer(winId := "", underMouse := False)
{
    if (!winId)
    {
        if (underMouse)
            MouseGetPos,,, winId
        else
            WinGet, winId, ID, A
    }
    WinGetClass, class, ahk_id %winId%
    return class == "TFXForm"
}


isStepSeq(winId := "", underMouse := False)
{
    if (!winId)
    {
        if (underMouse)
            MouseGetPos,,, winId
        else
            WinGet, winId, ID, A
    }
    WinGetClass, class, ahk_id %winId%
    return class == "TStepSeqForm"
}

isMainFlWindow(winId := "", underMouse := False)
{
    if (!winId)
    {
        if (underMouse)
            MouseGetPos,,, winId
        else
            WinGet, winId, ID, A
    }
    WinGetClass, class, ahk_id %winId%
    return class == "TFruityLoopsMainForm"
}

isTouchKeyboard(winId := "")
{
    if (!winId)
        WinGetClass, class, A
    WinGetClass, class, ahk_id %winId%
    return class == "TTouchKeybForm"    
}

isAudacity(winId := "")
{
    if (winId == "")
        WinGet, winId, ID, A
    WinGet, exe, ProcessName, ahk_id %winId%
    WinGetClass, class, ahk_id %winId%
    return exe == "audacity.exe" and class == "wxWindowNR"
}

isMelodyne(winId := "")
{
    if (winId == "")
        WinGet, exe, ProcessName, A
    else
        WinGet, exe, ProcessName, ahk_id %winId%
    return exe == "Melodyne singletrack.exe"
}

isControlSurface(winId := "")
{
    if (!winId)
        WinGetTitle, title, A    
    else
        WinGetTitle, title, ahk_id %winId%
    return InStr(title, "Control Surface")
}

isAhkGui()
{
    WinGetClass, class, A
    return class == "AutoHotkeyGUI"
}
; -- EventEditForms ---------------
isPianoRoll(winId := "")
{
    res := False
    if (!winId)
        WinGet, winId, ID, A
    WinGetClass, class, ahk_id %winId%
    if (class == "TEventEditForm")
    {
        WinGetTitle, title, ahk_id %winId%
        res := InStr(title, "Piano roll -")
    }
    return res or winId == PianoRollMenu1Id or winId == PianoRollMenu2Id
}

isPlaylist(winId := "")
{
    res := False
    if (!winId)
        WinGet, winId, ID, A
    WinGetClass, class, ahk_id %winId%
    if (class == "TEventEditForm")
    {
        WinGetTitle, title, ahk_id %winId%
        res := InStr(title, "Playlist -")
    }
    return res
}

isEventEditForm(winId := "")
{
    if (!winId)
        WinGetClass, class, A
    else 
        WinGetClass, class, ahk_id %winId%
    return class == "TEventEditForm"
}

isEventEditor(winId := "")
{
    if (!winId)
        WinGet, winId, ID, A
    WinGetClass, class, ahk_id %winId%
    WinGetTitle, title, ahk_id %winId%
    return class == "TEventEditForm" and InStr(title, "Events -")
}

; -- PianoRoll Tool Windows ------
isPianoRollTool(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return InStr(class, "TPR")
}

isPianorollLen(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRLegatoForm"    
}

isPianorollArp(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRArpForm"    
}

isPianorollRand(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRRandomForm"    
}

isPianorollGen(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRScoreCreatorForm"    
}

isPianorollQuantize(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRQuantizeForm"    
}

isPianoRollLfo(id := "")
{
    if (id == "")
        WinGet, id, ID, A
    WinGetClass, class, ahk_id %id%
    return class == "TPRLFOForm" 
}