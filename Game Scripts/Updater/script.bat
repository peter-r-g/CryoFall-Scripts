@ECHO OFF
: Don't edit this file. See settings.bat for configurable settings.

: Check if the required variable from update or update_editor is defined.
IF NOT DEFINED gameInstallPath (
    ECHO Use this script from the update or update_editor batch files
    PAUSE
    EXIT 1
)

: Backup old files.
IF %shouldBackup%==yes (
    ECHO Backing up old files...
    MOVE files.backup.zip files.backup.zip.old
    7z a -y -r -mx=0 -tzip files.backup.zip -x!files.backup.zip.old
)

: Save needed files to temporary folder.
ECHO Saving crucial files to temporary folder...
MKDIR update_temp
COPY /Y settings.bat .\update_temp\settings.bat
COPY /Y update.bat .\update_temp\update.bat
COPY /Y update_editor.bat .\update_temp\update_editor.bat
COPY /Y files.backup.zip .\update_temp\files.backup.zip
COPY /Y files.backup.zip.old .\update_temp\files.backup.zip.old

: Delete old files.
ECHO Deleting old files...
FOR /D %%D IN ("*") DO (
    IF /I NOT "%%~D"=="update_temp" RD /S/Q "%%~D"
)
FOR %%F IN ("*") DO (
    IF /I NOT "%%~F"=="script.bat" DEL /Q "%%~F"
)

: Start copy.
ECHO Copying new files...
XCOPY /E/H "%gameInstallPath%\" .

: Delete steam file if requested.
IF %deleteSteamFile%==yes (
    ECHO Deleting steam file...
    DEL steam
)

: Restore the needed files.
ECHO Restoring crucial files from temporary directory...
COPY /Y .\update_temp\settings.bat settings.bat
COPY /Y .\update_temp\update.bat update.bat
COPY /Y .\update_temp\update_editor.bat update_editor.bat
COPY /Y .\update_temp\files.backup.zip files.backup.zip
COPY /Y .\update_temp\files.backup.zip.old files.backup.zip.old
RD /S/Q update_temp

: Finish.
ECHO Your installation has been updated, your old files have been stored in files.backup.zip within the current directory.
IF %shouldPause%==yes PAUSE