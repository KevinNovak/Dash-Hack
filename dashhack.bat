:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/27/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

:: define a variable containing a single backspace character
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

start tshark -i 4 -p -w %TEMP%\dashlisten.txt host 255.255.255.255 and 192.168.0.1

ping 1.1.1.1 -n 1 -w 3000 > nul

setlocal
set oldSize=500
:_loop
ping 1.1.1.1 -n 1 -w 4000 > nul
FOR /F "usebackq" %%A IN ('%TEMP%\dashlisten.txt') DO set size=%%~zA

if %size% GTR %oldsize% (
    echo Button Pushed.
    goto _playsound
)
goto _loop

:_playsound
sWavPlayer.exe rickroll.wav
set oldSize=%size%
goto _loop

pause
exit