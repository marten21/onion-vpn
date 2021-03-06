@echo off

pushd "%~dp0"

SET ID=onion.vpn.heler

ECHO .. Deleting Chrome Registry
REG DELETE "HKCU\Software\Google\Chrome\NativeMessagingHosts\%ID%" /f

ECHO .. Deleting Firefox Registry
for %%f in ("%LocalAPPData%") do SET SHORT_PATH=%%~sf
REG DELETE "HKCU\SOFTWARE\Mozilla\NativeMessagingHosts\%ID%" /f

ECHO .. Kill already running instances
taskkill /im tor.exe /f >nul 2>&1
taskkill /im node.exe /f >nul 2>&1

ECHO .. Deleting %ID% directory
RMDIR /Q /S "%LocalAPPData%\%ID%"

ECHO.
ECHO .. Done!
pause

