# PowerAim (PowerShell Module)

## Description
PowerAim is a PS Module that provides an easy way to configure your fps games to have similar aim sensitivity settings.

## Usage
```powershell
Import-Module .\PowerAim

Convert-GameSensitivity -SourceGame Overwatch2 -DestinationGame Battlefield2042 -Sensitivity 6.2 

Game            Sensitivity
----            -----------
Battlefield2042        8.18
```

## Adding more games
1. Create a folder in the .\private\games\ folder with the name of the game (no-spaces preferred)
2. Create a convert.ps1 file in the folder with the relevant aim equations for CM/360deg at 800dpi based on in-game aim value. (See existing files for example)

## To-Do
- Add auto-game configuration for games that have offline config files
- Add more games