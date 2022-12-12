@echo off
chcp 65001
color a
cls
echo Selecione o album de música que você quer copiar.
setlocal

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Escolha a pasta do cantor.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I" & set "FolderName=%%~nxI"

setlocal enabledelayedexpansion
echo Você escolheu a pasta !folder!
xcopy /e /v "!folder!" "E:\%folderName:~0,1%\!folderName!"
endlocal
@pause