RandSleep(x, y) {
    Random,rand,%x% ,%y%
    Sleep %rand%
}

interactMacro:
    while getkeystate(interactKey, "P") {
        Sendinput,{%interactKey%}
        RandSleep(100, 150)
    }
Return

sprintMacro: 
    If (sprintScript) {
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
    while getkeystate(jumpMacroKey, "P") {
        Sendinput,{space}
        RandSleep(100, 150)
    }
Return

toggleSprintMacro:
    If (sprintScript) {
        sprintScript:=False
    } else {
        sprintScript:=True
    }
Return