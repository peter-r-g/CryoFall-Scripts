@ECHO OFF
: Don't edit this file. See settings.bat for configurable settings.

: Get settings.
ECHO Getting settings...
CALL settings.bat

: Set correct path.
SET gameInstallPath="%steamFolder%\steamapps\common\CryoFall"

: Execute the script.
CALL script.bat