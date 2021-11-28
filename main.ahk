#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include %A_ScriptDir%\lib\lib_json.ahk
#EscapeChar `
#CommentFlag ;

#Include, %A_ScriptDir%\subscripts\support.ahk

global partyData := getPartyData()
global configData := getConfigData()
global currentData := getDefaultCurrentData()
global timestamps := getDefaultTimestamp()

Loop, 4 {
    characterName := partyData["party", 1, A_Index]
    currentData["party", A_Index] := configData["character", characterName, "codeName"]
}

global skillKey := configData["keybind", "skill"]
global burstKey := configData["keybind", "burst"]
global pauseKey := configData["keybind", "pause"]
global pauseScript := True

HotKey, IfWinActive, ahk_exe GenshinImpact.exe

HotKey ~$*%skillKey%,skill
HotKey ~$*%burstKey%,burst

Loop, 4 {
    HotKey ~$!$%A_Index%, burstCharacterLabel
    HotKey ~$%A_Index%, changeCharacterLabel
}
HotKey ~$5, changeCharacterLabel

Loop, 8 {
    HotKey ~$*Numpad%A_Index%, changeCurrentPartyLabel
}
HotKey ~$*Numpad0,changeCurrentPartyLabel
HotKey ~$*Numpad9,toggleCoopLabel

HotKey $%pauseKey%,pauseInput

Return

pauseInput:
    pauseScript := !pauseScript
Return

#Include, %A_ScriptDir%\subscripts\burst.ahk
#Include, %A_ScriptDir%\subscripts\skill.ahk
#Include, %A_ScriptDir%\subscripts\change.ahk

savePartyToFile() {
    partyNum := currentData["partyNum"]
    partyData["party", partyNum, 1] := currentData["party", 1]
    partyData["party", partyNum, 2] := currentData["party", 2]
    partyData["party", partyNum, 3] := currentData["party", 3]
    partyData["party", partyNum, 4] := currentData["party", 4]
    JSON_save(partyData, "config\party.json")
}

global p1skillCDGUI:=0
global p2skillCDGUI:=0
global p3skillCDGUI:=0
global p4skillCDGUI:=0

global p1skillUPGUI:=0
global p2skillUPGUI:=0
global p3skillUPGUI:=0
global p4skillUPGUI:=0

global p1weaponUPGUI:=0
global p2weaponUPGUI:=0
global p3weaponUPGUI:=0
global p4weaponUPGUI:=0

global p1weaponCDGUI:=0
global p2weaponCDGUI:=0
global p3weaponCDGUI:=0
global p4weaponCDGUI:=0

global p1artifactUPGUI:=0
global p2artifactUPGUI:=0
global p3artifactUPGUI:=0
global p4artifactUPGUI:=0

global p1burstUPGUI:=0
global p2burstUPGUI:=0
global p3burstUPGUI:=0
global p4burstUPGUI:=0

global sheildGUI:=0
init_this_file() {
    static _ := init_this_file()

    Gui Color, Black
    Gui -caption +toolwindow +AlwaysOnTop
    Gui font, s18 bold, Arial

    Gui add, text, x1517 y253 vp1skillCDGUI cWhite, 99.9
    Gui add, text, x1517 y348 vp2skillCDGUI cWhite, 99.9
    Gui add, text, x1517 y444 vp3skillCDGUI cWhite, 99.9
    Gui add, text, x1517 y541 vp4skillCDGUI cWhite, 99.9

    Gui add, text, x1592 y623 vp1skillUPGUI cWhite, 99.9
    Gui add, text, x1672 y623 vp2skillUPGUI cWhite, 99.9
    Gui add, text, x1752 y623 vp3skillUPGUI cWhite, 99.9
    Gui add, text, x1832 y623 vp4skillUPGUI cWhite, 99.9

    Gui add, text, x789 y800 vp1weaponUPGUI cWhite, 99.9
    Gui add, text, x884 y800 vp2weaponUPGUI cWhite, 99.9
    Gui add, text, x989 y800 vp3weaponUPGUI cWhite, 99.9
    Gui add, text, x1084 y800 vp4weaponUPGUI cWhite, 99.9

    Gui add, text, x789 y850 vp1weaponCDGUI cWhite, 99.9
    Gui add, text, x884 y850 vp2weaponCDGUI cWhite, 99.9
    Gui add, text, x989 y850 vp3weaponCDGUI cWhite, 99.9
    Gui add, text, x1084 y850 vp4weaponCDGUI cWhite, 99.9

    Gui add, text, x600 y360 vp1artifactUPGUI cWhite, 99.9
    Gui add, text, x600 y460 vp2artifactUPGUI cWhite, 99.9
    Gui add, text, x600 y560 vp3artifactUPGUI cWhite, 99.9
    Gui add, text, x600 y660 vp4artifactUPGUI cWhite, 99.9

    Gui font, s21 bold, Arial
    Gui add, text, x780 y290 vp1burstUPGUI cWhite, 99.9
    Gui add, text, x880 y290 vp2burstUPGUI cWhite, 99.9
    Gui add, text, x980 y290 vp3burstUPGUI cWhite, 99.9
    Gui add, text, x1080 y290 vp4burstUPGUI cWhite, 99.9

    Gui add, text, w200 x930 y970 vsheildGUI cWhite, 99.9
    Gui Show, % "x" 0 " y" 0, TRANS-WIN
    WinSet TransColor, Black, TRANS-WIN

    settimer, updateGUI, 50 
}

