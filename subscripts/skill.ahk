skill:
    skillCD:=0
    skillUP:=0
    skillCastDelay:=0
    
    characterNum:=currentData["characterNum"]
    currentPlayerSkillCD:=timestamps["skill","down",characterNum]
    currentPlayerSkillCD:=(currentPlayerSkillCD-A_TickCount)/1000

    eDurationStartTime:=A_TickCount
    Switch currentData["Character", "codeName"] {
        Case "Albedo":
            While getkeystate(skillKey, "P") {
                ; TODO get max time
            }
            skillCD:=4
            skillUP:=30
            ; TODO skillCastDelay
        Case "Aloy":
            skillCD:=20
            skillUP:=10
            skillCastDelay:=0.3
        Case "Amber":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=6800) {
                    Break
                }
            }
            skillCD:=15
            If (currentData["character", "constellation"]>=4) { 
                ;It's Not Just Any Doll...
                skillCD*=0.8
            }
            skillUP:=9
            skillCastDelay:=0.1
        Case "Ayaka":
            skillCD:=10
            skillUP:=7
            skillCastDelay:=0.1
        Case "Barbara":
            skillCD:=32
            If (currentData["character", "constellation"]>=2) { 
                ;Vitality Burst
                skillCD*=0.85
            }
            skillUP:=16
            skillCastDelay:=0.15
        Case "Beidou":
            eDurationStartTime:=A_TickCount
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>3000) {
                    break
                }
            }
            skillCD:=7.5
        Case "Bennett":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=2200) {
                    break
                }
            }
            skillCastDelay:=0.2
            If (A_TickCount-eDurationStartTime>=1700) {
                skillCD:=10
            } else if (A_TickCount-eDurationStartTime>=700) {
                skillCD:=7.5
            } else {
                skillCD:=5
            }
            If (currentData["character", "ascension"]>=1) { 
                ;Rekindle
                skillCD*=0.8
            }
            If (currentData["character", "ascension"]>=4) { 
                ;Fearnaught
                If (timestamps["burst", "up", characterNum]>A_TickCount) {
                    skillCD*=0.5
                }
            }
        Case "Chongyun":
            skillCD:=10
            skillUP:=15
            If (currentData["character", "constellation"]>=2) {
                timestamps["atmosphericRevolution"]:=A_TickCount+15000
            }
            ; TODO skillCastDelay
        Case "Diluc":
            If (currentPlayerSkillCD<0) {
                skillCD:=10
            }
            ; TODO skillCastDelay
        Case "Diona":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=150) {
                    break
                }
            }
            dionaPawDuration:=1.8
            If (currentData["character","ascension"]>2) {
                dionaPawDuration+=0.1
            }
            If (currentData["character","ascension"]>3) {
                dionaPawDuration+=0.2
            }
            If (currentData["character","ascension"]>4) {
                dionaPawDuration+=0.2
            }
            If (currentData["character","ascension"]>5) {
                dionaPawDuration+=0.1
            }
            If (currentData["character","constellation"]>5) {
                dionaPawDuration+=0.3
            }
            If (dionaPawDuration>2.4) {
                dionaPawDuration:=2.4
            }
            If (A_TickCount-eDurationStartTime>=150) {
                skillCD:=15
                skillCastDelay:=0.4
                timestamps["shield", "diona"] := dionaPawDuration*5*1000+A_TickCount+1000
            } else {
                skillCD:=6
                skillCastDelay:=0.05
                timestamps["shield", "diona"] := dionaPawDuration*2*1000+A_TickCount+500
            }
        Case "Eula":
            While getkeystate(skillKey, "P") {
                ; get max time
            }
            If (A_TickCount-eDurationStartTime>2200) and (Characters.Eula.C<2) {
                skillCD:=10
            } else {
                skillCD:=4
            }
            ; TODO skillCastDelay
        Case "Fischl":
            If (currentPlayerSkillCD<0) {
                While getkeystate(skillKey, "P") {
                    If (A_TickCount-eDurationStartTime>=20150) {
                        Break
                    }
                }
                skillCD:=25
                skillUP:=10
                If (currentData["character", "constellation"]>=6) { 
                    ;Evernight Raven
                    skillUP+=2
                }
                skillCastDelay:=0.25
            }
        Case "Ganyu":
            If (currentData["character", "constellation"]>=2) { 
                ;The Auspicious
                If (currentPlayerSkillCD<0) {
                    skillCD:=10
                } else If (currentPlayerSkillCD<10) {
                    skillCD:=currentPlayerSkillCD+10
                }
            } else {
                skillCD:=10
            }
            skillUP:=6
            ; TODO skillCastDelay
        Case "Hu_Tao":
            skillCD:=16
            skillUP:=9
        Case "Jean":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=5000) {
                    break
                }
            }
            skillCD:=6
            skillCastDelay:=0.3
        Case "Kaeya":
            skillCD:=6
            skillCastDelay:=0.5
        Case "Kazuha":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=550) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>=550) {
                skillCD:=9
            } else {
                skillCD:=6
                skillCastDelay:=0.15
            }
            If (currentData["character", "constellation"]>=1) {
                skillCD*=0.9
            }
        Case "Keqing":
            If (currentPlayerSkillCD<0) {
                While getkeystate(skillKey, "P") {
                    If (A_TickCount-eDurationStartTime>=10000) {
                        Break
                    }
                }
                skillCD:=7.5
                skillCastDelay:=0.25
            }
        Case "Klee":
            If (currentPlayerSkillCD<0) {
                skillCD:=20
            } else If (currentPlayerSkillCD<19) {
                skillCD:=currentPlayerSkillCD+20
            }
            skillCastDelay:=0.5
        Case "Kokomi":
            skillCD:=20
            skillUP:=12
            skillCastDelay:=0.4
        Case "Lisa":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=4300) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>=2000) {
                skillCD:=16
            } else {
                skillCD:=1
                skillCastDelay:=0.3
            }
        Case "Mona":
            skillCD:=12
            skillUP:=5.5
            skillCastDelay:=0.4
        Case "Ningguang":
            skillCD:=12
            skillUP:=30
        Case "Noelle":
            skillCD:=24
            timestamps["shield", "noelle"] := A_TickCount+12000
            skillCastDelay:= 0.2
        Case "Qiqi":
            skillCD:=30
            skillUP:=15
            ; TODO skillCastDelay
        Case "Raiden":
            skillCD:=10
            skillUP:=25
            skillCastDelay:=0.15
        Case "Razor":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=1000) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>=1000) {
                skillCD:=10
            } else {
                skillCastDelay:=0.5
                skillCD:=6
            }
            If (currentData["character", "ascension"]>=1) { ;Awakening
                skillCD*=0.82
            }
        Case "Rosaria":
            skillCD:=6
            skillCastDelay:=0.45
        Case "Sara":
            skillCD:=10
            skillUP:=6
            If (Characters.Sara.C>=1) {
                skillCD-=1
            }
            skillCastDelay:=0.2
        Case "Sayu":
            initalPressTimestamp:=A_TickCount
            hold:=false
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=300) {
                    hold:=True
                }
                If (A_TickCount-eDurationStartTime>=11000) {
                    break
                }
            }
            While (!getkeystate(skillKey, "P") && !getkeystate(jumpKey, "P")) {
                If (hold==false || initalPressTimestamp+11000<A_TickCount) {
                    skillCastDelay:=0.5
                    break
                }
            }
            skillCD:=6+5*((A_TickCount-eDurationStartTime)/10000)
        Case "Sucrose":
            If (currentData["character", "constellation"]>=1) { 
                ;Clustered Vacuum Field
                If (currentPlayerSkillCD<0) {
                    skillCD:=15
                } else If (currentPlayerSkillCD<14.5) {
                    skillCD:=currentPlayerSkillCD+15
                }
            } else {
                skillCD:=15
            }
            skillCastDelay:=0.1
        Case "Tartaglia":
            If (timestamps["tartaglia", "up"]>0 && A_TickCount-timestamps["tartaglia", "up"]>1000) {
                tartagliaOff()
            } else {
                timestamps["tartaglia", "up"]:=A_TickCount
                skillCD:=0.1
            }
        Case "Traveler_Anemo":
            ; TODO
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=2000) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>=1000) {
                skillCD:=8
            } else {
                skillCD:=5
            }
            skillCastDelay:=0.5-(A_TickCount-eDurationStartTime)/1000
            If (skillCastDelay<0) {
                skillCastDelay:=0
            }
        Case "Traveler_Electro":
            skillCD:=13.5
            skillUP:=6
            skillCastDelay:=0.4
            ; TODO Thunderflash. A1. reduce cooldown if character has something from skill
        Case "Traveler_Geo":
            While getkeystate(skillKey, "P") {
                If (A_TickCount-eDurationStartTime>=10000) {
                    Break
                }
            }
            skillCD:=8
            If (currentData["character", "ascension"]>=1) { 
                ;Shattered Darkrock
                skillCD-=2
            }
            skillUP:=30
            If (currentData["character", "constellation"]>=6) { 
                ;Everlasting Boulder
                skillUP+=10
            }
            skillCastDelay:=0.3
        Case "Venti":
            While getkeystate(skillKey, "P") {
                ; TODO get max time
                If (A_TickCount-eDurationStartTime>=2000) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>=1000) {
                skillCD:=15
                skillUP:=20
            } else {
                skillCD:=6
            }
            ; TODO skillCastDelay
        Case "Xiangling":
            skillCD:=12
            skillUP:=7
            skillCastDelay:=0.25
        Case "Xiao":
            ;// TODO UGH CHARGES
            skillCD:=10
        Case "Xingqiu":
            skillCD:=21
            skillUP:=15
            ; TODO skillCastDelay
        Case "Xinyan":
            skillCD:=18
            timestamps["shield", "xinyan"] := A_TickCount+13000
            skillCastDelay:=0.25
        Case "Yoimiya":
            skillCD:=18
            skillUP:=10
            skillCastDelay:=0.5
        Case "Yanfei":
            skillCD:=9
            ; TODO skillCastDelay
        Case "Zhongli":
            While getkeystate(skillKey, "P") {
            ; // TODO get proper time
                If (A_TickCount-eDurationStartTime>800) {
                    break
                }
            }
            If (A_TickCount-eDurationStartTime>800) {
                skillCD:=12
                skillUP:=30
                timestamps["shield", "zhongli"] := A_TickCount+20000
                skillCastDelay:=0.1
            } else {
                skillCD:=4
                skillUP:=30
                skillCastDelay:=0.35
            }
        Default:
            MsgBox, % currentData["character", "codeName"]
            skillCD:=10
    }
    If (timestamps["atmosphericRevolution"]-A_TickCount>0) {
        skillCD*=0.85
    }
    If (currentData["conditions", "impetuousWinds"] == "True") {
        skillCD*=0.95
    }
    If (currentData["conditions", "hydroCD"] == "True") {
        skillCD*=2.5
    }

    If (skillCD>0) {
        skillCD+=skillCastDelay
        timestamps["skill", "down", characterNum]:=A_TickCount+skillCD*1000
        If (skillCastDelay>0) {
            timestamps["skill", "delay", characterNum]:=A_TickCount+skillCastDelay*1000
        }
    }
    If (skillUP>0) {
        skillUP+=skillCastDelay
        timestamps["skill", "up", characterNum]:=A_TickCount+skillUP*1000
    }
    
    ; Switch currentCharacter.4P {
    ;     Case "Martial Artist":
    ;         MartialArtistTimeStamp:=A_TickCount+8000
    ;     Case "Maiden Beloved":
    ;         MaidenBelovedTimeStamp:=A_TickCount+10000
    ;     Case "Crimson Witch of Flames":
    ;         CrimsonWitchofFlamesTimeStamp:=A_TickCount+10000
    ;     Case "Heart of Depth":
    ;         HeartofDepthTimeStamp:=A_TickCount+15000
    ;     Case "Tenacity of the Millelith": ; TODO maybe
    ;         TenacityoftheMillelithTimeStamp:=A_TickCount+3000
    ;     Case "Pale Flame": ; TODO maybe
    ;         PaleFlameTimeStamp:=A_TickCount+7000
    ; }
    While getkeystate(skillKey, "P") {
    }
return
