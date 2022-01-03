centerMouse(winId := "", speed := 1.5)
{
    res := True
    if (winId == "")
        WinGet, winId, ID, A

    if (removeFromHistoryIfInvisible(winId))
    {
        res := False
        return res
    }

    WinGetPos, winX, winY, winW, winH, ahk_id %winId%
    mX := winW/2
    mY := winH/2
    mX := mX + winX
    mY := mY + winY
    moveMouse(mX, mY, "Screen", speed)
    retrieveMouse := False
    return res
}