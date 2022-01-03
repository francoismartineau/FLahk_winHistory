mouseGetPos(ByRef mX, ByRef mY,  mode := "Client")
{
    prevMode := setMouseCoordMode(mode)
    MouseGetPos, mX, mY, winId
    setMouseCoordMode(prevMode)
    return winId
}

CoordMode, Mouse, Client
global mouseCoordMode := "Client"
global prevMouseCoordMode :=
setMouseCoordMode(mode)
{
    prevMode := mouseCoordMode
    mouseCoordMode := mode
    CoordMode, Mouse, %mode%
    return prevMode
}
moveMouse(x := "", y := "", mode := "Client", speed := 0)
{
    CoordMode, Mouse, Screen
    static := betweenScreensX := 0
    static := betweenScreensY := 870

    if (x == "")
        MouseGetPos, x
    else if (y == "")
        MouseGetPos,, y

    if (mode == "Client")
    {
        WinGetPos, winX, winY,,, A
        x := winX + x
        y := winY + y
    }

    MouseGetPos, mx
    crossScreen := (mx < 0 and x > 0) or (x < 0 and mx > 0)
    if (crossScreen)
    {
        MouseMove, %betweenScreensX%, %betweenScreensY%, %speed%
        MouseMove, %x%, %betweenScreensY%, %speed%
    }

    MouseMove, %x%, %y%, %speed%

    CoordMode, Mouse, Client
}

CoordMode, ToolTip, Client
global toolTipCoordMode := "Client"
global prevToolTipCoordMode :=
setToolTipCoordMode(mode)
{
    prevMode := toolTipCoordMode
    toolTipCoordMode := mode
    CoordMode, ToolTip, %mode%
    return prevMode
}
toolTip(msg := "", n := 1, x := "", y := "", coordMode := "Client")
{
    prevMode := setToolTipCoordMode(coordMode)
    msg := objToString(msg)
    if (x != "" and y != "")
        ToolTip, %msg%, %x%, %y%, %n%
    else
        ToolTip, %msg%,,, %n%
    setToolTipCoordMode(prevMode)
}

objToString(obj, tabs := 0)
{
    if (IsObject(obj))
    {
        str := ""
        if (tabs > 0)
            str := str "`r`n"
        for key, val in obj
        {
            Loop, %tabs%            
                str := str "  "
            str := str "" objToString(key, tabs+1) " : " objToString(val, tabs+1) "`r`n"
        }
    }
    else
        str := obj
    return str
}

hasVal(haystack, needle)
{
	if !(IsObject(haystack)) || (haystack.Length() == 0)
		return 0
	for index, value in haystack
		if (value == needle)
			return index
	return 0
}

execFunc(f, params*)
{
    res := 
    if (params.Length())
        res := %f%(params*)
    else 
        res := %f%()
    return res
}

; ---- Mouse ---------------------------------------
global savedMouseX
global savedMouseY
saveMousePos()
{
    CoordMode, Mouse, Screen
    MouseGetPos, savedMouseX, savedMouseY
    CoordMode, Mouse, Client
}

retrieveMousePos()
{
    global savedMouseX, savedMouseY
    CoordMode, Mouse, Screen
    MouseMove, savedMouseX, savedMouseY, 0
    CoordMode, Mouse, Client
}

unfreezeMouse()
{
    BlockInput, MouseMoveOff
}

freezeMouse()
{
    BlockInput, MouseMove
}
; ----