changeCurrentPartyLabel:
    StringRight, newNum, A_ThisHotkey, 1
    changeCurrentParty(newNum)
Return

burstCharacterLabel:
    StringRight, newNum, A_ThisHotkey, 1
    burstCharacter(newNum)
Return

changeCharacterLabel:
    StringRight, newNum, A_ThisHotkey, 1
    changeCharacter(newNum)
Return

toggleCoopLabel:
    coopMode()
return

changeCurrentParty(newNum) {
    timestamps := getDefaultTimestamp()
    If (newNum == 0) {
        addParty()
    } else {
        If (partyData["party", newNum, 1] == "") {
            MsgBox, 4,, Party doesnt exist. Do you want make a new party? (press Yes or No)
            IfMsgBox No
                Return 
            currentData["partyNum"] := newNum
            addParty()
        } else {
            currentData["partyNum"] := newNum
            updateCurrentParty()
        }
    }
}

burstCharacter(characterNum) {
    changeCharacter(characterNum)
    burstFunction(burstKey)
}

changeCharacter(newNum) {
    If (currentData["character", "codeName"] == "Tartaglia") {
        tartagliaOff()
    }
    characterNum:=currentData["characterNum"]
    weapon:=currentData["character", "weapon"]
    switch weapon {
        case "Thrilling Tales of Dragon Slayers":
            If (newNum != characterNum && A_TickCount > timestamps["weapon", "down", characterNum]) {
                timestamps["weapon", "up", characterNum] := A_TickCount+11000
                timestamps["weapon", "down", characterNum] := A_TickCount+21000
            }
    }
    currentData["characterNum"] := newNum
    updateCurrentCharacter()
    weapon:=currentData["character", "weapon"]
    switch weapon {
        case "The Widsith":
            timestamps["weapon", "up", newNum] := A_TickCount+10000
            timestamps["weapon", "down", newNum] := A_TickCount+30000
    }
}



