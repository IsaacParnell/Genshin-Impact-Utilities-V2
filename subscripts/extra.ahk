RandSleep(x, y) {
    Random,rand,%x% ,%y%
    Sleep %rand%
}

interactMacro:
    If (pauseScript) {
        while getkeystate(interactKey, "P") {
            Sendinput,{%interactKey%}
            RandSleep(100, 150)
        }
    } Else {
        SendInput, {%interactKey%}
    }
Return

sprintMacro: 
    If (pauseScript) {
        while getkeystate("LShift", "P") {
            Sendinput,{Shift Down}
            RandSleep(50,80)
            Sendinput,{Shift Up}
            RandSleep(790, 820)
        }
    } else {
        while getkeystate("LShift", "P") {
            SendInput, {Shift Down}
        }
        Sendinput,{Shift Up}
    }
Return

jumpMacro:
    If (pauseScript) {
        while getkeystate(jumpMacroKey, "P") {
            Sendinput,{space}
            RandSleep(100, 150)
        }
    } Else {
        SendInput, {%jumpMacroKey%}
    }
Return
