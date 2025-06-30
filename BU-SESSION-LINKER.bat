@echo off
:: Automatischer Admin-Rechte-Check und Neustart

:: Prüfen, ob das Skript mit Admin-Rechten ausgeführt wird
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Starte das Skript neu mit Administratorrechten...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:: Fenster leeren
cls

:: Hinweistext
echo =============================================================
echo Bitte mit Adminrechten ausfuehren wenn ein Symlink auf den 'latest' Ordner gesetzt werden soll.
echo Please run as administrator if you want to create a symlink pointing to the 'latest' folder.
echo =============================================================
echo.

:: Desktop-Pfad des aktuellen Benutzers
set DesktopPath=%USERPROFILE%\Desktop

:: Hauptordner BU_SESSIONS auf dem Desktop anlegen, falls nicht vorhanden
set SessionRoot=%DesktopPath%\BU_SESSIONS
if not exist "%SessionRoot%" mkdir "%SessionRoot%"

:: Hardcodierte Pfade
set BU_PATH=C:\BimmerUtility\BimmerUtility.exe
set ESYS_PATH=C:\EC-APPS\E-Sys-3.40.2

:: Aktuelles Datum und Uhrzeit setzen fuer Zeitstempel (Windows-Format berücksichtigen)
for /f "tokens=1-3 delims=./ " %%a in ('date /t') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

for /f "tokens=1,2 delims=: " %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
)

:: Zeit formatieren
set hour=%hour: =0%
set timeStr=%hour%-%minute%

:: Neuen Session-Ordner erstellen
set SessionFolder=%SessionRoot%\BU_SESSION_%year%-%month%-%day%_%timeStr%
mkdir "%SessionFolder%"
mkdir "%SessionFolder%\FA"
mkdir "%SessionFolder%\SVT"
mkdir "%SessionFolder%\TAL"

:: Symbolischen Link "latest" erstellen
if exist "%SessionRoot%\latest" (
    rmdir "%SessionRoot%\latest"
)
mklink /D "%SessionRoot%\latest" "%SessionFolder%"

:: Original-Ordner im E-Sys Verzeichnis umbenennen
if exist "%ESYS_PATH%\FA" (
    ren "%ESYS_PATH%\FA" "WRAPPER_FA"
)
if exist "%ESYS_PATH%\SVT" (
    ren "%ESYS_PATH%\SVT" "WRAPPER_SVT"
)
if exist "%ESYS_PATH%\TAL" (
    ren "%ESYS_PATH%\TAL" "WRAPPER_TAL"
)

:: Symlinks der Unterordner im E-Sys Verzeichnis anlegen
mklink /D "%ESYS_PATH%\FA" "%SessionFolder%\FA"
mklink /D "%ESYS_PATH%\SVT" "%SessionFolder%\SVT"
mklink /D "%ESYS_PATH%\TAL" "%SessionFolder%\TAL"

:: BimmerUtility direkt starten, nur wenn die Datei existiert
if exist "%BU_PATH%" (
    start "" "%BU_PATH%"
) else (
    echo BimmerUtility Pfad nicht gefunden: %BU_PATH%
    pause
)

:: Fenster offen lassen bis Benutzer bestaetigt
echo.
echo =============================================================
echo Vorgang abgeschlossen. / Process completed.
echo Druecke eine Taste und anschliessend ENTER zum Beenden. / Press any key and ENTER to exit.
echo =============================================================
set /p EXIT_CONFIRM=

exit
