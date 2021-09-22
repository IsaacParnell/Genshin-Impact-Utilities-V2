; here is where you can add attack macros if you want.
; I have some examples on how to do so. 
; I use RandSleep so it feels a bit more organic but Sleep works

attackMacro:
    characterNum := currentData["characterNum"]
    Switch currentData["character", "codeName"] {
        Case "Klee":
            while getkeystate(attackMacroKey, "P") {
                MouseClick,left
                RandSleep(450, 490)
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                MouseClick,left
                RandSleep(700, 750)
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                MouseClick,left
                RandSleep(200, 250)
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                Click down
                RandSleep(700, 750)
                Click up
                RandSleep(1000, 1030)
            }
        Case "Ningguang":
            while getkeystate(attackMacroKey, "P") {
                MouseClick,left
                RandSleep(1050, 1150)
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                MouseClick,left
                RandSleep(1050, 1150)
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                Click down
                RandSleep(500, 600)
                Click up
                if not getkeystate(attackMacroKey, "P") {
                    return
                }
                RandSleep(800, 900)
            }
        case "Raiden":
            ; You can even do cool stuff like different combo when in burst
            while getkeystate(attackMacroKey, "P") {
                If (timestamps["burst", "up", characterNum]>A_TickCount) {
                    ; I'm too lazy to actually get this working ********
                    ; I might try later
                    ; refreshTime:=1000/60
                    ; Loop, 3 {
                    ;     ; N3
                    ;     MouseClick,left
                    ;     RandSleep(13*refreshTime, 13*refreshTime)
                    ;     MouseClick,left
                    ;     RandSleep(21*refreshTime, 21*refreshTime)
                    ;     MouseClick,left
                    ;     RandSleep(23*refreshTime, 23*refreshTime)

                    ;     ; C
                    ;     Click down
                    ;     RandSleep(500, 600)
                    ;     Click up
                    ;     RandSleep(60*refreshTime, 60*refreshTime)
                    ;     ; RandSleep(refreshTime, refreshTime+1)

                    ;     ; D
                    ;     Sendinput,{Shift Down}
                    ;     RandSleep(10,20)
                    ;     Sendinput,{Shift Up}

                    ; }

                    ; ; N1
                    ; MouseClick,left
                    ; RandSleep(13*refreshTime, 13*refreshTime)

                    ; ; C
                    ; Click down
                    ; RandSleep(500, 600)
                    ; Click up
                    ; RandSleep(60*refreshTime, 60*refreshTime)
                    ; **************************************************
                    ; unga bunga
                    MouseClick,left
                    RandSleep(100, 130)
                } else {
                    MouseClick,left
                    RandSleep(100, 200)
                }
            }
        Default:
            while getkeystate(attackMacroKey, "P") {
                MouseClick,left
                RandSleep(100, 200)
            }
    }
Return
