burst:
    burstFunction(burstKey)
    While getkeystate(burstKey, "P") {
    }
return

burstFunction(burstKey) {
    characterNum := currentData["characterNum"]
    burstCD:=0
    burstUP:=0
    castTime:=1
    skillCD:=-1
    skillUP:=-1
    Switch currentData["character", "codeName"] {
        Case "Albedo":
            castTime:=1
            burstCD:=12
            burstUP:=0
        Case "Aloy":
            castTime:=1
            burstCD:=12
            burstUP:=0
        Case "Amber":
            castTime:=1
            burstCD:=12
            burstUP:=2
        Case "Ayaka":
            castTime:=1.5
            burstCD:=20
            burstUP:=5
        Case "Barbara":
            castTime:=1
            burstCD:=20
            burstUP:=0
        Case "Beidou":
            castTime:=1
            burstCD:=20
            burstUP:=15
            If (currentData["character", "constellation"]>=1) { 
                ; Sea Beast's Scourge
                timestamps["shield", "biedou"] := A_TickCount+15000
            }
        Case "Bennett":
            castTime:=1
            burstCD:=15
            burstUP:=12
        Case "Chongyun":
            castTime:=1
            burstCD:=12
            burstUP:=0
        Case "Diluc":
            castTime:=1
            burstCD:=12
            burstUP:=8
        Case "Diona":
            castTime:=1
            burstCD:=20
            burstUP:=12
        Case "Eula":
            castTime:=1
            burstCD:=20
            burstUP:=7
            If (currentData["character", "ascension"]>=4) {
                skillCD:=0
            }
        Case "Fischl":
            castTime:=1
            ; TODO not sure on skillUP
            burstCD:=15
            burstUP:=2
            skillUP:=10
        Case "Ganyu":
            castTime:=1
            ; TODO not sure on uptime
            burstCD:=15
            burstUP:=15
        Case "Hu_Tao":
            castTime:=1
            ; TODO not sure on uptime
            burstCD:=15
            burstUP:=15
        Case "Jean":
            castTime:=1
            burstCD:=20
            burstUP:=10
        Case "Kaeya":
            castTime:=1
            burstCD:=15
            burstUP:=8
        Case "Kazuha":
            castTime:=1.5
            burstCD:=15
            burstUP:=8
            If (currentData["character", "constellation"]>=1) {
                skillCD:=0
            }
        Case "Keqing":
            castTime:=1
            burstCD:=12
            burstUP:=0
        Case "Klee":
            castTime:=1
            burstCD:=15
            burstUP:=10
        Case "Kokomi":
            castTime:=1
            burstCD:=18
            burstUP:=10
            If (currentData["character", "ascension"]>=1) {
                ; Tamanooya's Casket
                If (timestamps["skill", "up", characterNum]-(castTime*1000)>A_TickCount && timestamps["skill", "up", characterNum]>0) {
                    skillUP:=12+castTime
                }
            }
        Case "Lisa":
            castTime:=1
            burstCD:=20
            burstUP:=15
        Case "Mona":
            castTime:=1
            burstCD:=15
            burstUP:=8
        Case "Ningguang":
            castTime:=1
            burstCD:=12
            burstUP:=0
        Case "Noelle":
            castTime:=1
            burstCD:=15
            burstUP:=15
        Case "Qiqi":
            castTime:=1
            burstCD:=20
            burstUP:=15
        Case "Raiden":
            castTime:=2
            burstCD:=18
            burstUP:=7
        Case "Razor":
            castTime:=1
            burstCD:=20
            burstUP:=15
            If (currentData["character", "constellation"]>=1) { 
                ;Awakening
                skillCD:=0
            }
        Case "Rosaria":
            castTime:=1
            burstCD:=15
            burstUP:=8
            If (currentData["character", "constellation"]>=2) {
                burstUP+=4
            }
        Case "Sara":
            castTime:=1
            burstCD:=20
            burstUP:=0
        Case "Sayu":
            castTime:=1
            burstCD:=20
            burstUP:=12
        Case "Sucrose":
            castTime:=1
            burstCD:=20
            burstUP:=6
            If (currentData["character", "constellation"]>=2) { 
                ;Beth: Unbound Form
                burstUP:=burstUP+2
            }
        Case "Tartaglia":
            castTime:=1
            burstCD:=15
            burstUP:=0
            If (currentData["character", "constellation"]>=6) {
                If (A_TickCount-timestamps["tartaglia", "up"]>0 && timestamps["tartaglia", "up"]>0) {
                    currentData["conditions" , "tartagliaHavoc_Annihilation"] := True
                }
            }
        Case "Thoma":
            castTime:=1
            burstCD:=20
            burstUP:=15
            timestamps["shield", "thoma"] := A_TickCount+8000+15000+1000
        Case "Traveler_Anemo":
            castTime:=1
            burstCD:=15
            burstUP:=6
        Case "Traveler_Electro":
            castTime:=1
            burstCD:=20
            burstUP:=12
        Case "Traveler_Geo":
            castTime:=1
            burstCD:=15
            burstUP:=15
            If (currentData["character", "constellation"]>=6) { 
                ;Everlasting Boulder
                burstUP:=burstUP+5
            }
        Case "Venti":
            castTime:=1
            burstCD:=15
            burstUP:=8
        Case "Xiangling":
            castTime:=1
            burstCD:=20
            burstUP:=10
            If (currentData["character", "constellation"]>=4) { 
                ;Slowbake
                burstUP:=burstUP*1.4
            }
        Case "Xiao":
            castTime:=1
            burstCD:=18
            burstUP:=15
        Case "Xingqiu":
            castTime:=1
            burstCD:=20
            burstUP:=15
            If (currentData["character", "constellation"]>=2) { 
                ;Rainbow Upon the Azure Sky
                burstUP:=burstUP+3
            }
        Case "Xinyan":
            castTime:=1
            burstCD:=15
            burstUP:=2
            If (currentData["character", "constellation"]>=2) { 
                ;Impromptu Opening
                timestamps["shield", "xinyan"] := A_TickCount+13000
            }
        Case "Yanfei":
            castTime:=1
            burstCD:=20
            burstUP:=15
        Case "Yoimiya":
            castTime:=1
            burstCD:=15
            burstUP:=10
        Case "Zhongli":
            castTime:=1
            burstCD:=12
            burstUP:=3.1
            If (currentData["character", "ascension"]>=2) {
                burstUP=burstUP+0.1
            }
            If (currentData["character", "ascension"]>=3) {
                burstUP=burstUP+0.2
            }
            If (currentData["character", "ascension"]>=4) {
                burstUP=burstUP+0.2
            }
            If (currentData["character", "ascension"]>=5) {
                burstUP=burstUP+0.2
            }
            If (currentData["character", "ascension"]>=6) {
                burstUP=burstUP+0.2
            }
            If (currentData["character", "constellation"]>=5) { 
                ;Lazuli, Herald of the Order
                burstUP:=burstUP+0.2
            }
            If (burstUP>4) {
                burstUP=4
            }
            If (currentData["character", "constellation"]>=4) { 
                ;Topaz, Unbreakable and Fearless
                burstUP:=burstUP+2
            }
            If (currentData["character", "constellation"]>=2) { 
                ;Stone, the Cradle of Jade
                timestamps["shield", "zhongli"] := A_TickCount+20000
            }
        Default:
            skillCD:=10
    }
    If (timestamps["atmosphericRevolution"]-A_TickCount>0) {
        burstCD*=0.85
    }
    ; // TODO proper
    burstCD:=burstCD+castTime
    burstUP:=burstUP+castTime

    timestamps["burst", "delay", characterNum]:=A_TickCount+castTime*1000
    timestamps["burst", "up", characterNum]:=A_TickCount+burstUP*1000
    timestamps["burst", "down", characterNum]:=A_TickCount+burstCD*1000
    If (skillCD>-1) {
        timestamps["skill", "down", characterNum]:=A_TickCount+skillCD*1000
    }
    If (skillUP>-1) {
        timestamps["skill", "up", characterNum]:=A_TickCount+skillUP*1000
    }

    artifact := currentData["character", "artifactSet"]
    switch artifact {
        case "Noblesse Oblige":
            timestamps["artifact", "up", characterNum] := A_TickCount+12000+castTime*1000
        Default:
            timestamps["artifact", "up", characterNum] := 0
    }
}