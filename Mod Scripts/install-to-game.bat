@ECHO OFF

: Required Settings:
: The location to where your CryoFall installation is.
: Default is C:\Program Files (x86)\Steam\steamapps\common\CryoFall
SET installFolder="C:\Program Files (x86)\Steam\steamapps\common\CryoFall"
: The file name of the package batch file.
: Defaukt is package.bat
SET packageBatchFile=package.bat

: Optional Settings:
: Whether the console window should pause. (Only use this if you're debugging or need to see output)
: yes = will pause, anything else = will not pause.
: Default is no
SET shouldPause=no

: Don't edit past this point.
TITLE Installing Mod

: Package the mod into an mpk.
ECHO Packaging mod...
CALL %packageBatchFile%
: Copy the mpk to the games mod directory.
ECHO Copying mod to game directory...
MOVE %modName%.mpk %installFolder%\Core\%modName%.mpk

: Finish.
ECHO Your mod has been packaged as %modName%.mpk within the games mod directory.
IF %shouldPause%==yes PAUSE