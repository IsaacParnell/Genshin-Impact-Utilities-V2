# Genshin-Impact-Utilities-V2

Work in Progress. I am new to GitHub
Designed for 1920x1080 monitors

Displays
    Skill Cooldown
    Skill Uptime
    Shield Uptime

Skill Cooldown just left of name.
Skill Uptime below Characters.
Shield Uptime above Health

Different cooldown times for different charge levels

Handles multiple skill charges

Talents and Burst effect on Cooldown

Constellation effect on Cooldown

Aiming Skill

Key binds:

- Numpad numbers to swap party. Numpad 0 to change party members. Using a numpad number that doesn't have a party will prompt party creation.
- f to interact. Holding f down will cause f to be pressed every 100-150ms. To change keybind, change f at **line 1** of *config.ahk* and **line 3** of *extra.ahk*
- shift for run. holding shift will cause stagnated dashes (better then running). this can break shift input when used at the same time as other scripts. use right click for dashing to work around this. Remove **lines 10 to 25** of *extra.ahk* to remove function.
- e for skill, change **line 2** of *config.ahk* and **line 3** of *skill.ahk* to rebind
- q for burst, change **line 3** of *config.ahk* and **line 3** of *burst.ahk* to rebind
- Extra mouse button 1 (button on side of mouse) for jump spam. Holding this button will cause space to pressed every 100-150ms. Change **line 26** of *extra.ahk* to rebind. (**line 5** of *config.ahk* does nothing atm)
- Extra mouse button 2 (button on side of mouse) for attack combo. Holding this button will cause attack combo based on attack.ahk. Change **line 3** of *attack.ahk* to rebind. (**line 4** of *config.ahk* does nothing atm)
- Capslock to disable shift script. remove **lines 33 to 40** in *extra.ahk* to remove feature.

Config:

- Configure files are in config folder
- config.bat currently only prompts questions to config characters' Ascension and Constellation
- Party config must be done manually by editing partyConfig.ahk. Character names used are located in character.txt

TODO:

- display burst buffs
- add weapon buffs
- add display for artifact buffs
- better include cast animation
- add coop mode (change ability locations)
- add pause option

Known Issues:

- Using Capslock to toggle shift when caps lock is on will cause the capslock light on to spam when holding down shift.
- Special conditions to reduce CD isn't accounted for.

Updated for 2.1.0