:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/27/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

:: ==========================================
:: Variables
:: ==========================================
set sourceIP=192.168.0.1
set destinationIP=255.255.255.255

:: ==========================================
:: Dialog
:: ==========================================
echo.
echo   Listening for Amazon Dash...

:: ==========================================
:: Begin Loop
:: ==========================================
:_loop
tshark -c 1 -i 4 -p host %sourceIP% and %destinationIP%> NUL 2>&1

:: ==========================================
:: Perform Action
:: ==========================================
start sWavPlayer.exe johncena.wav
ping 1.1.1.1 -n 1 -w 13000 > nul






:: ==========================================
:: End Loop
:: ==========================================
goto _loop

pause
exit