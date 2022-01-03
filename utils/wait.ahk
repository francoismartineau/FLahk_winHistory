global acceptPressed := True
global abortPressed := True
global clickAlsoAccepts := False
global acceptAbortSpecialKey := ""
waitAcceptAbort(pressEnterOrEsc := False, hint := False, specialKey := "")
{
    if (!acceptPressed or !abortPressed)
        return
        
    res := ""
   
    if (hint == True)
        hint := "Enter / Esc"

    acceptAbortSpecialKey := specialKey
    
    acceptPressed := False
    abortPressed := False

    while (!(acceptPressed or abortPressed))
    {
        if (hint)
            toolTip(hint, toolTipIndex["acceptAbort"])
        if (acceptAbortSpecialKey != "")
        {
            acceptPressed := acceptPressed or GetKeyState(acceptAbortSpecialKey)
            Sleep, 100
        }
        else
            Sleep, 200
    }

    if (abortPressed)
    {
        res := "abort"
        if (pressEnterOrEsc)
            Send {Esc}
    }
    else if (acceptPressed)
    {
        res := "accept"
        if (pressEnterOrEsc)
            Send {Enter}
    }

    acceptPressed := True
    abortPressed := True
    clickAlsoAccepts := False
    acceptAbortSpecialKey := ""
    if (hint)
        toolTip("", toolTipIndex["acceptAbort"])

    return res
}