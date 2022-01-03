isVisible(winId)
{
    WinGet, Style, Style, ahk_id %winId%
    Transform, res, BitAnd, %Style%, 0x10000000
    return res <> 0
}