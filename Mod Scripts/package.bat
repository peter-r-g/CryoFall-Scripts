@ECHO OFF

: Required settings:
: This should be the same as the ID field in your header.xml file.
SET modName=TestMod

: Optional settings:
: Whether the console window should pause. (Only use this if you're debugging or need to see output)
: yes = will pause, anything else = will not pause.
: Default is no
SET shouldPause=no
: The number of CPU cores to use for the archiving process.
: Default is 1
SET cpuCores=1
: The level of logging that the 7zip application should output. (Only use this if you're debugging or need to see output)
: 0 = limited logging, 3 = verbose logging.
: Default is 0
SET logLevel=0

: Don't edit past this point.
TITLE Packaging %modName%

: Move old mpk as a form of backup for user.
ECHO Moving pre-existing mpk
MOVE %modName%.mpk %modName%.mpk.old

: Package mpk.
ECHO Starting package process...
7z a -y -bb%logLevel% -mmt=%cpuCores% -mx=0 -tzip %modName%.mpk *.xml *.txt -ir!Content -ir!Editor -ir!Localization -ir!Scripts -ir!UI

: Finish.
ECHO Your mod has been packaged as %modName%.mpk within the current directory.
IF %shouldPause%==yes PAUSE