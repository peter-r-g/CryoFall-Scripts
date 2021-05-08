@ECHO OFF

: Required settings:
: The path to where your steam folder that contains the CryoFall or CryoFall Editor games are.
: Default is "C:\Program Files (x86)\Steam"
SET steamFolder="E:\Steam Games"

: Optional settings:
: Whether the empty steam file should be deleted or not
: Default is yes
SET deleteSteamFile=yes
: Whether the current directory should be backed up into a zip before starting the copy.
: This should be yes if you're actively using the directory for modding.
: Default is yes
SET shouldBackup=yes
: Whether the console window should pause. (Only use this if you're debugging or need to see output)
: yes = will pause, anything else = will not pause.
: Default is no
SET shouldPause=yes