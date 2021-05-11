# CryoFall Scripts
A collection of scripts that are helpful for setting up modding in CryoFall. Currently there are only Windows batch scripts but if requested I can create the scripts for Linux also.

## Game Scripts
There is currently a single group of scripts that are for updating the game version if needed. You can use update.bat to update your files to the regular CryoFall client. You can use the update_editor.bat file to update your files to the CryoFall Editor version of the game. All configurable settings are placed within the settings.bat file.

## Mod Scripts
### package.bat
All configurable settings are placed at the top of the package.bat file.<br>
This script will package your mod into an mpk file according to the documentation. All xml and txt files are included as well as the following directories (These are case sensitive):

1. Content
2. Editor
3. Localization
4. Scripts
5. UI

### install-to-game.bat
All configurable settings are placed at the top of the install-to-game.bat file.<br>
This script will use the package.bat script to package your mpk then install it to your defined games mod directory (InstallFolder\Core\)
