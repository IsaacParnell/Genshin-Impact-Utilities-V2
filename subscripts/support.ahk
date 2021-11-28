global characterCodeNameArray := ["Albedo","Aloy","Amber","Ayaka","Barbara","Beidou","Bennett","Chongyun","Diluc","Diona","Eula","Fischl","Ganyu","Hu_Tao","Jean","Kaeya","Kazuha","Keqing","Klee","Kokomi","Lisa","Mona","Ningguang","Noelle","Qiqi","Raiden","Razor","Rosaria","Sara","Sayu","Sucrose","Tartaglia","Thoma","Traveler_Anemo","Traveler_Electro","Traveler_Geo","Venti","Xiangling","Xiao","Xingqiu","Xinyan","Yanfei","Yoimiya","Zhongli"]

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
                    "burst": "q",
                    "interact": "f",
                    "jump": "space",
                    "sprint": "LShift",
                    "pause": "LCtrl",
                    "jumpMacro": "XButton1",
                    "attackMacro": "XButton2"
                },
                "color" : {
                    "Anemo": "80FFD7",
                    "Cryo": "99FFFF",
                    "Electro": "FFACFF",
                    "Dendro": "B1E92A",
                    "Geo": "FFE699",
                    "Hydro": "80DFFF",
                    "Pyro": "FF9999"
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
                    "4": "FFFFFF"
                },
                "coop": {
                    "inCoop": "False",
                    "numOfPlayer": "2",
                    "playerNum": "1"
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
                    "thoma": 0,
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
    Loop, 4 {
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
    characterNames:=""
    for index, element in characterCodeNameArray {
        characterNames:=characterNames . element . ": "
    }
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

updateTeamColors() {
    Loop, 4 {
        codeName := currentData["party", A_Index]
        element := configData["character", codeName, "element"]
        elementColor := configData["color", element]
        guiColor(elementColor, "p" . A_Index . "skillCDGUI")
        guiColor(elementColor, "p" . A_Index . "skillUPGUI")
        guiColor(elementColor, "p" . A_Index . "weaponUPGUI")
        guiColor(elementColor, "p" . A_Index . "weaponCDGUI")
        guiColor(elementColor, "p" . A_Index . "artifactUPGUI")
        guiColor(elementColor, "p" . A_Index . "burstUPGUI")
        currentData["color", A_Index] := elementColor
    }
}

global runForABit:=A_TickCount+3000
global runOnce:=True
updateGUI() {
    If (runForABit>A_TickCount) {
        updateTeamColors()
        updateCurrentCharacter()
    }
    If (runOnce==True) {
        runOnce:=False
        runForABit:=A_TickCount+3000
    }

    timestampTartaglia:=timestamps["tartaglia", "up"]
    Loop, 4 {
        ; Skill
        If (currentData["party", A_Index]=="Tartaglia" && timestampTartaglia>0) {
            timestampTartaglia := timeToText(A_TickCount-timestampTartaglia)
            updateText("p" . A_Index . "skillCDGUI", timestampTartaglia)
        } else {
            If (timestamps["skill", "delay", A_Index]<A_TickCount) {
                timestampCD:= timeToText(timestamps["skill", "down", A_Index]-A_TickCount)
                timestampUP:= timeToText(timestamps["skill", "up", A_Index]-A_TickCount)
            } else {
                timestampCD:= timeToText(-1)
                timestampUP:= timeToText(-1)
            }
            updateText("p" . A_Index . "skillCDGUI", timestampCD)
            updateText("p" . A_Index . "skillUPGUI", timestampUP)
        }
        ; Burst
        If (timestamps["burst", "delay", A_Index]<A_TickCount) {
            timestampBurstUP := timeToText(timestamps["burst", "up", A_Index]-A_TickCount)
        } else {
            timestampBurstUP:= timeToText(-1)
        }
        updateText("p" . A_Index . "burstUPGUI", timestampBurstUP)
        ; Weapon
        timestampCD:= timeToText(timestamps["weapon", "down", A_Index]-A_TickCount)
        timestampUP:= timeToText(timestamps["weapon", "up", A_Index]-A_TickCount)
        updateText("p" . A_Index . "weaponCDGUI", timestampCD)
        updateText("p" . A_Index . "weaponUPGUI", timestampUP)
        ; Artifact
        timestampUP:= timeToText(timestamps["artifact", "up", A_Index]-A_TickCount)
        updateText("p" . A_Index . "artifactUPGUI", timestampUP)
        }


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
    characterShield2 := "thoma"
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
    elementColor := configData["color", element]
    GuiControl, +c%elementColor%, sheildGUI

    timestampShield:= timeToText(timestampShield1-A_TickCount)

    updateText("sheildGUI", timestampShield)

}

coopMode() {
    If (currentData["coop", "inCoop"] == "False") {
        MsgBox, 4,, would you like to enter coop mode
        IfMsgBox Yes 
            enterCoop()
    } else {
        MsgBox, 4,, would you like to leave coop mode
        IfMsgBox Yes 
            leaveCoop()
    }
}

enterCoop() {
    currentData["coop", "inCoop"] := "True"
    invalidInput:=True
    While, invalidInput {
        InputBox, result , Number of players total?
        If (result<1 && result>4) {
            MsgBox, Invalid Number
        } else {
            invalidInput := False
        }
    }
    currentData["coop", "numOfPlayers"] := result
    invalidInput:=True
    While, invalidInput {
        InputBox, result , Player number?
        If (result<1 && result>4) {
            MsgBox, Invalid Number
        } else {
            invalidInput := False
        }
    }
    currentData["coop", "playerNumber"] := result
    If (result==1 && currentData["coop", "numOfPlayers"] == 3) {
        GuiControl move, p1skillCDGUI, x1517 y455
        GuiControl move, p2skillCDGUI, x1517 y551
    } else {
        If (currentData["coop", "numOfPlayers"] == 2) {
            GuiControl move, p1skillCDGUI, x1517 y410
            GuiControl move, p2skillCDGUI, x1517 y505
        } else {
            GuiControl move, p1skillCDGUI, x1517 y550
        }
    }
}

leaveCoop() {
    currentData["coop", "inCoop"] := "False"
    GuiControl move, p1skillCDGUI, x1517 y253
    GuiControl move, p2skillCDGUI, x1517 y348
}

guiColor(color, ControlID) {
    GuiControl, +c%color%, %ControlID%
}

guiShow(ControlID) {
    GuiControl Show, %ControlID%
}

guiHide(ControlID) {
    GuiControl Hide, %ControlID%
}

updateText(ControlID, text) {
    If (text=="0") {
        GuiControl Hide, %ControlID%
    } else {
        GuiControl Show, %ControlID%
        GuiControl Text, %ControlID%, %text%
    }
}

timeToText(timeStamp) {
    timeTempValue:=Round(timeStamp/1000, 1)
    textOut:="" timeTempValue
    If (timeTempValue<10) {
        textOut:=A_Space . textOut
    }
    If (timeTempValue<=0) {
        textOut:="0"
    }
    Return textOut
}

pauseInput:
    If (pauseScript) {
        pauseScript:=False
    } else {
        pauseScript:=True
    }
Return