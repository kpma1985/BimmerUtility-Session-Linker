@echo off
:: GitHub Push-Skript für BU-SESSION-LINKER

:: Repository-URL
set REPO_URL=https://github.com/kpma1985/BimmerUtility-Session-Linker.git

:: Benutzer-Konfiguration (optional anpassen)
set COMMIT_MESSAGE=Release 1.0 - BU-SESSION-LINKER initial commit without restore script

:: Git-Initialisierung und Upload
echo Git Initialisierung...
git init

echo Entferne vorhandenes Remote, falls vorhanden...
git remote remove origin 2>nul

echo Remote Repository hinzufügen...
git remote add origin %REPO_URL%

echo Dateien zum Commit hinzufügen...
git add .

echo Commit durchführen...
git commit -m "%COMMIT_MESSAGE%"

echo Branch setzen...
git branch -M main

echo Dateien zu GitHub pushen...
git push -u origin main

echo.
echo =============================================================
echo Push abgeschlossen. / Push completed.
echo =============================================================
pause
