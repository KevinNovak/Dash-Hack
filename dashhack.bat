:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/28/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

:: ==========================================
:: Variables
:: ==========================================
:: Replace the folowing with the appropriate values
set sourceIP=0.0.0.0
set destinationIP=0.0.0.0

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