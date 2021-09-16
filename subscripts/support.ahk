global characterCodeNameArray := ["Albedo","Amber","Ayaka","Barbara","Beidou","Bennett","Chongyun","Diluc","Diona","Eula","Fischl","Ganyu","Hu_Tao","Jean","Kaeya","Kazuha","Keqing","Klee","Lisa","Mona","Ningguang","Noelle","Qiqi","Raiden","Razor","Rosaria","Sara","Sayu","Sucrose","Tartaglia","Traveler_Anemo","Traveler_Electro","Traveler_Geo","Venti","Xiangling","Xiao","Xingqiu","Xinyan","Yanfei","Yoimiya","Zhongli"]

invalidCharacter(inputCharacterName) {
    for index, element in characterCodeNameArray {
        if (element == inputCharacterName) {
            return False
        }
    }
    return True
}

getPartyData() {
    Try {
        partyData := JSON_load("config\party.json")
    } Catch e {
        jsonString =
        ( ltrim join 
            {
                "party": {
                    "1": {
                        "1": "Zhongli",
                        "2": "Klee",
                        "3": "Raiden",
                        "4": "Barbara"
                    },
                    "2": {
                        "1": "Traveler_Geo",
                        "2": "Amber",
                        "3": "Kaeya",
                        "4": "Barbara"
                    }
                }
            }
        )
        j := JSON_from(jsonString)
        JSON_save(j, "config\party.json")
    }
    partyData := JSON_load("config\party.json")

    return partyData
}

getConfigData() {
    data := JSON_load("config\data.json")
    Try {
        configData := JSON_load("config\config.json")
    } Catch e {
        jsonString =
        ( ltrim join 
            {
                "character" : {

                },
                "keybind" : {
                    "skill": "e",
                    "burst": "q"
                }
            }
        )
        j := JSON_from(jsonString)
        JSON_save(j, "config\config.json")
    }
    configData := JSON_load("config\config.json")

    for index, element in characterCodeNameArray {
        If (configData["character", element, "codeName"] != element) {
            configData := JSON_load("config\config.json")
            New_Var := ""
            Original_Var := JSON_to(configData["character"])
            StringTrimRight, New_Var, Original_Var, 1
            If (New_Var != "{") {
                New_Var := New_Var ","
            }
            New_Var := New_Var . """" . element . """" . ": {}}"
            configData["character"] := JSON_from(New_Var)
            
            configData["character", element] := data["character", element]
            JSON_save(configData, "config\config.json")
            MsgBox, 4,, Do you own %element%? (press Yes or No)
            IfMsgBox Yes 
                askCharacterQuestions(element)
        }
    }

    return configData
}

askCharacterQuestions(name) {
    configData := JSON_load("config\config.json")
    errorOcc:=False
    result:=0
    invalidInput:=True
    While, invalidInput {
        InputBox, result , What is %name%'s Ascension
        If (result<0 && result>6) {
            MsgBox, Invalid Number
        } else {
            invalidInput := False
        }
    }
    configData["character", name, "ascension"] := result
    result:=0
    invalidInput:=True
    While, invalidInput {
        InputBox, result , What is %name%'s Constellation
        If (result<0 && result>6) {
            MsgBox, Invalid Number
        } else {
            invalidInput := False
        }
    }
    configData["character", name, "constellation"] := result
    JSON_save(configData, "config\config.json")
}

getDefaultCurrentData() {
    jsonString =
        ( ltrim join 
            {
                "partyNum": 1,
                "party": {
                    "1": "Zhongli",
                    "2": "Klee",
                    "3": "Raiden",
                    "4": "Barbara"
                },
                "characterNum": 1,
                "character": {
                    "artifactSet":       "None",
                    "ascension":         6,
                    "characterName":     "Zhongli",
                    "codeName":          "Zhongli",
                    "constellation":     1,
                    "element":           "Geo",
                    "weapon":            "Beginner Protector",
                    "weaponType":        "Polearm"
                },
                "conditions": {
                    "tartagliaHavoc_Annihilation": "False",
                    "impetuousWinds": "False",
                    "hydroCD": "False"
                },
                "color": {
                    "1": "FFFFFF",
                    "2": "FFFFFF",
                    "3": "FFFFFF",
                    "4": "FFFFFF",
                    "Anemo": "80FFD7",
                    "Cryo": "99FFFF",
                    "Electro": "FFACFF",
                    "Dendro": "B1E92A",
                    "Geo": "FFE699",
                    "Hydro": "80C0FF",
                    "Pyro": "FF9999"
                }
                
            }
        )
    return JSON_from(jsonString)
}

getDefaultTimestamp() {
    jsonString =
        ( ltrim join 
            {
                "tartaglia": {
                    "up": 0,
                    "coolOff": 0
                },
                "atmosphericRevolution": 0,
                "shield": {
                    "biedou": 0,
                    "diona": 0,
                    "noelle": 0,
                    "xinyan": 0,
                    "zhongli": 0
                },
                "skill": {
                    "up": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "down": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "delay": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    }
                },
                "burst": {
                    "up": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "down": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "delay": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    }
                },
                "weapon": {
                    "up": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "down": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    }
                },
                "artifact": {
                    "up": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    },
                    "down": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0
                    }
                }
            }
        )
    return JSON_from(jsonString)
}

resetCurrentData() {
    defaultCurrentData := getDefaultCurrentData()
    currentData["timestamps"] := defaultCurrentData["timestamps"]
    currentData["conditions"] := defaultCurrentData["conditions"]
}

updateCurrentCharacter() {
    characterNum := currentData["characterNum"]
    characterCodeName := currentData["party", characterNum]
    currentData["character"] := configData["character", characterCodeName]
}

updateCurrentParty() {
    partyCodeNum := currentData["partyNum"]
    currentData["party"] := partyData["party", partyCodeNum]
    updateCurrentCharacter()
    anemoCount:=0
    Loop, {
        If (A_Index>4) {
            Break
        }
        characterCodeName:=currentData["party", A_index] 
        If (configData["character", characterCodeName, "element"] == "Anemo") {
            anemoCount++
        }
    }
    
    If (anemoCount>=2) {
        currentData["conditions", "impetuousWinds"] := "True"
    } else {
        currentData["conditions", "impetuousWinds"] := "False"
    }
}

addParty() {
    currentPartyPlayer1 := "Albedo"
    currentPartyPlayer2 := "Albedo"
    currentPartyPlayer3 := "Albedo"
    currentPartyPlayer4 := "Albedo"
    invalidInput:=True
    characterNames:="Albedo: Amber: Ayaka: Barbara: Beidou: Bennett: Chongyun: Diluc: Diona: Eula: Fischl: Ganyu: Hu_Tao: Jean: Kaeya: Kazuha: Keqing: Klee: Lisa: Mona: Ningguang: Noelle: Qiqi: Raiden: Razor: Rosaria: Sara: Sayu: Sucrose: Tartaglia: Traveler_Anemo: Traveler_Electro: Traveler_Geo: Venti: Xiangling: Xiao: Xingqiu: Xinyan: Yanfei: Yoimiya: Zhongli"
    errorOcc:=False
    While, invalidInput {
        InputBox, currentPartyPlayer1 , Party Member 1's codeName, % characterNames
        If (ErrorLevel == 1) {
            errorOcc:=True
            Return
        }
        invalidInput := invalidCharacter(currentPartyPlayer1)
        If (invalidInput) {
            MsgBox, Invalid Character
        }
    }
    If (errorOcc) {
        Return
    }
    invalidInput:=True
    While, invalidInput {
        InputBox, currentPartyPlayer2 , Party Member 2's codeName, % characterNames
        If (ErrorLevel == 1) {
            errorOcc:=True
            Return
        }
        invalidInput := invalidCharacter(currentPartyPlayer2)
        If (invalidInput) {
            MsgBox, Invalid Character
        }
    }
    If (errorOcc) {
        Return
    }
    invalidInput:=True
    While, invalidInput {
        InputBox, currentPartyPlayer3 , Party Member 3's codeName, % characterNames
        If (ErrorLevel == 1) {
            errorOcc:=True
            Return
        }
        invalidInput := invalidCharacter(currentPartyPlayer3)
        If (invalidInput) {
            MsgBox, Invalid Character
        }
    }
    If (errorOcc) {
        Return
    }
    invalidInput:=True
    While, invalidInput {
        InputBox, currentPartyPlayer4 , Party Member 4's codeName, % characterNames
        If (ErrorLevel == 1) {
            errorOcc:=True
            Return
        }
        invalidInput := invalidCharacter(currentPartyPlayer4)
        If (invalidInput) {
            MsgBox, Invalid Character
        }
    }
    If (errorOcc) {
        Return
    }
    currentData["party", 1]:=currentPartyPlayer1
    currentData["party", 2]:=currentPartyPlayer2
    currentData["party", 3]:=currentPartyPlayer3
    currentData["party", 4]:=currentPartyPlayer4
    MsgBox, 4,, Do you own want to save party to file? (press Yes or No)
    IfMsgBox Yes 
        savePartyToFile()
    updateCurrentCharacter()
}

tartagliaOff() {
    characterNum := currentData["characterNum"]
    skillCD:=0
    tartagliaUpTimeStamp:=timestamps["tartaglia", "up"]
    If (tartagliaUpTimeStamp>0) {
        TartagliaUpTime:=(A_TickCount-tartagliaUpTimeStamp)/1000
    } else {
        TartagliaUpTime:=0
    }
    timestamps["skill", "down", characterNum] := 0
    if (TartagliaUpTime>0) {
        if (TartagliaUpTime>29) {
            skillCD:= 45
        } else {
            skillCD:= TartagliaUpTime+6
        }
        If (currentData["character", "constellation"]>=1) {
            skillCD:=skillCD*0.8
        }
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
    timestamps["tartaglia", "up"] := 0
    timestamps["tartaglia", "coolOff"] := A_TickCount
    If (skillCD>0) {
        If (currentData["conditions", "tartagliaHavoc_Annihilation"] == "True") {
            currentData["conditions", "tartagliaHavoc_Annihilation"] := "False"
            timestamps["skill", "down", characterNum]:=-1
        } Else {
            timestamps["skill", "down", characterNum]:=A_TickCount+skillCD*1000
        }
    }
}

timeToText(timeStamp) {
    timeTempValue:=Round(timeStamp/1000, 1)
    textOut:="" timeTempValue
    If (timeTempValue<10) {
        textOut:=A_Space . textOut
    }
    If (timeTempValue<0) {
        textOut:=""
    }
    Return textOut
}

updateTeamColors() {
    Loop, {
        If (A_Index>4) {
            Break
        }
        codeName := currentData["party", A_Index]
        element := configData["character", codeName, "element"]
        elementColor := currentData["color", element]
        currentData["color", A_Index] := elementColor
    }
    p1Color := currentData["color", 1]
    p2Color := currentData["color", 2]
    p3Color := currentData["color", 3]
    p4Color := currentData["color", 4]

    GuiControl, +c%p1Color%, p1skillCDGUI
    GuiControl, +c%p1Color%, p1skillUPGUI
    GuiControl, +c%p1Color%, p1weaponUPGUI
    GuiControl, +c%p1Color%, p1weaponCDGUI
    GuiControl, +c%p1Color%, p1artifactUPGUI
    GuiControl, +c%p1Color%, p1burstUPGUI

    GuiControl, +c%p2Color%, p2skillCDGUI
    GuiControl, +c%p2Color%, p2skillUPGUI
    GuiControl, +c%p2Color%, p2weaponUPGUI
    GuiControl, +c%p2Color%, p2weaponCDGUI
    GuiControl, +c%p2Color%, p2artifactUPGUI
    GuiControl, +c%p2Color%, p2burstUPGUI

    GuiControl, +c%p3Color%, p3skillCDGUI
    GuiControl, +c%p3Color%, p3skillUPGUI
    GuiControl, +c%p3Color%, p3weaponUPGUI
    GuiControl, +c%p3Color%, p3weaponCDGUI
    GuiControl, +c%p3Color%, p3artifactUPGUI
    GuiControl, +c%p3Color%, p3burstUPGUI

    GuiControl, +c%p4Color%, p4skillCDGUI
    GuiControl, +c%p4Color%, p4skillUPGUI
    GuiControl, +c%p4Color%, p4weaponUPGUI
    GuiControl, +c%p4Color%, p4weaponCDGUI
    GuiControl, +c%p4Color%, p4artifactUPGUI
    GuiControl, +c%p4Color%, p4burstUPGUI

}

updateGUI() {
    updateTeamColors()

    ; ******************* Skill Display *******************
    ; Player 1
    If (timestamps["skill", "delay", 1]<A_TickCount) {
        timestampCD:= timeToText(timestamps["skill", "down", 1]-A_TickCount)
        timestampUP:= timeToText(timestamps["skill", "up", 1]-A_TickCount)
    } else {
        timestampCD:= timeToText(-1)
        timestampUP:= timeToText(-1)
    }
    GuiControl Text, p1skillCDGUI, %timestampCD%
    GuiControl Text, p1skillUPGUI, %timestampUP%
    ; Player 2
    If (timestamps["skill", "delay", 2]<A_TickCount) {
        timestampCD:= timeToText(timestamps["skill", "down", 2]-A_TickCount)
        timestampUP:= timeToText(timestamps["skill", "up", 2]-A_TickCount)
    } else {
        timestampCD:= timeToText(-1)
        timestampUP:= timeToText(-1)
    }
    GuiControl Text, p2skillCDGUI, %timestampCD%
    GuiControl Text, p2skillUPGUI, %timestampUP%
    ; Player 3
    If (timestamps["skill", "delay", 3]<A_TickCount) {
        timestampCD:= timeToText(timestamps["skill", "down", 3]-A_TickCount)
        timestampUP:= timeToText(timestamps["skill", "up", 3]-A_TickCount)
    } else {
        timestampCD:= timeToText(-1)
        timestampUP:= timeToText(-1)
    }
    GuiControl Text, p3skillCDGUI, %timestampCD%
    GuiControl Text, p3skillUPGUI, %timestampUP%
    ; Player 4
    If (timestamps["skill", "delay", 4]<A_TickCount) {
        timestampCD:= timeToText(timestamps["skill", "down", 4]-A_TickCount)
        timestampUP:= timeToText(timestamps["skill", "up", 4]-A_TickCount)
    } else {
        timestampCD:= timeToText(-1)
        timestampUP:= timeToText(-1)
    }
    GuiControl Text, p4skillCDGUI, %timestampCD%
    GuiControl Text, p4skillUPGUI, %timestampUP%    

    ; ******************* Shield Display *******************
    characterShield1 := "biedou"
    timestampShield1 := timestamps["shield", characterShield1]
    characterShield2 := "diona"
    timestampShield2 := timestamps["shield", characterShield2]
    If (timestampShield2>timestampShield1) {
        timestampShield1 := timestampShield2
        characterShield1 := characterShield2
    }
    characterShield2 := "noelle"
    timestampShield2 := timestamps["shield", characterShield2]
    If (timestampShield2>timestampShield1) {
        timestampShield1 := timestampShield2
        characterShield1 := characterShield2
    }
    characterShield2 := "xinyan"
    timestampShield2 := timestamps["shield", characterShield2]
    If (timestampShield2>timestampShield1) {
        timestampShield1 := timestampShield2
        characterShield1 := characterShield2
    }
    characterShield2 := "zhongli"
    timestampShield2 := timestamps["shield", characterShield2]
    If (timestampShield2>timestampShield1) {
        timestampShield1 := timestampShield2
        characterShield1 := characterShield2
    }

    element := configData["character", characterShield1, "element"]
    elementColor := currentData["color", element]
    GuiControl, +c%elementColor%, sheildGUI

    timestampShield:= timeToText(timestampShield1-A_TickCount)

    GuiControl Text, sheildGUI, %timestampShield%

    ; ******************* Tartaglia Display *******************
    timestampTartaglia := timestamps["tartaglia", "up"]
    If (timestampTartaglia>0) {
        timestampTartaglia := timeToText(A_TickCount-timestampTartaglia)
        switch currentData["characterNum"] {
            case 1:
                GuiControl Text, p1TartagliaGUI, %timestampTartaglia%
            case 2:
                GuiControl Text, p2TartagliaGUI, %timestampTartaglia%
            case 3:
                GuiControl Text, p3TartagliaGUI, %timestampTartaglia%
            case 4:
                GuiControl Text, p4TartagliaGUI, %timestampTartaglia%
        }
    }

    ; ******************* Burst Display *******************
    ; Player 1
    If (timestamps["burst", "delay", 1]<A_TickCount) {
        timestampBurstUP := timeToText(timestamps["burst", "up", 1]-A_TickCount)
    } else {
        timestampBurstUP:= timeToText(-1)
    }
    GuiControl Text, p1burstUPGUI, %timestampBurstUP%
    ; Player 2
    If (timestamps["burst", "delay", 2]<A_TickCount) {
        timestampBurstUP := timeToText(timestamps["burst", "up", 2]-A_TickCount)
    } else {
        timestampBurstUP:= timeToText(-1)
    }
    GuiControl Text, p2burstUPGUI, %timestampBurstUP%
    ; Player 3
    If (timestamps["burst", "delay", 3]<A_TickCount) {
        timestampBurstUP := timeToText(timestamps["burst", "up", 3]-A_TickCount)
    } else {
        timestampBurstUP:= timeToText(-1)
    }
    GuiControl Text, p3burstUPGUI, %timestampBurstUP%
    ; Player 4
    If (timestamps["burst", "delay", 4]<A_TickCount) {
        timestampBurstUP := timeToText(timestamps["burst", "up", 4]-A_TickCount)
    } else {
        timestampBurstUP:= timeToText(-1)
    }
    GuiControl Text, p4burstUPGUI, %timestampBurstUP%

    ; ******************* Weapon Display *******************
    ; Player 1
    timestampCD:= timeToText(timestamps["weapon", "down", 1]-A_TickCount)
    timestampUP:= timeToText(timestamps["weapon", "up", 1]-A_TickCount)
    GuiControl Text, p1weaponCDGUI, %timestampCD%
    GuiControl Text, p1weaponUPGUI, %timestampUP%
    ; Player 2
    timestampCD:= timeToText(timestamps["weapon", "down", 2]-A_TickCount)
    timestampUP:= timeToText(timestamps["weapon", "up", 2]-A_TickCount)
    GuiControl Text, p2weaponCDGUI, %timestampCD%
    GuiControl Text, p2weaponUPGUI, %timestampUP%
    ; Player 3
    timestampCD:= timeToText(timestamps["weapon", "down", 3]-A_TickCount)
    timestampUP:= timeToText(timestamps["weapon", "up", 3]-A_TickCount)
    GuiControl Text, p3weaponCDGUI, %timestampCD%
    GuiControl Text, p3weaponUPGUI, %timestampUP%
    ; Player 4
    timestampCD:= timeToText(timestamps["weapon", "down", 4]-A_TickCount)
    timestampUP:= timeToText(timestamps["weapon", "up", 4]-A_TickCount)
    GuiControl Text, p4weaponCDGUI, %timestampCD%
    GuiControl Text, p4weaponUPGUI, %timestampUP%

    ; ******************* Artifact Display *******************
    ; Player 1
    timestampUP:= timeToText(timestamps["artifact", "up", 1]-A_TickCount)
    GuiControl Text, p1artifactUPGUI, %timestampUP%
    ; Player 2
    timestampUP:= timeToText(timestamps["artifact", "up", 2]-A_TickCount)
    GuiControl Text, p2artifactUPGUI, %timestampUP%
    ; Player 3
    timestampUP:= timeToText(timestamps["artifact", "up", 3]-A_TickCount)
    GuiControl Text, p3artifactUPGUI, %timestampUP%
    ; Player 4
    timestampUP:= timeToText(timestamps["artifact", "up", 4]-A_TickCount)
    GuiControl Text, p4artifactUPGUI, %timestampUP%
}