:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/27/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

:: define a variable containing a single backspace character
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

cd C:\Users\kevin\Desktop\wireshark\App\Wireshark

start tshark -i 4 -p -w %TEMP%\dashlisten.txt host 255.255.255.255

ping 1.1.1.1 -n 1 -w 3000 > nul

setlocal
set file="C:\Users\kevin\Desktop\hello.txt"
set oldSize=276
:_loop
ping 1.1.1.1 -n 1 -w 1500 > nul
FOR /F "usebackq" %%A IN ('%TEMP%\dashlisten.txt') DO set size=%%~zA

if %size% GTR %oldsize% (
    echo Button Pushed.
    set oldSize=%size%
    goto _playsound
)
goto _loop

:_playsound
cd %0\..\
sWavPlayer.exe rickroll.wav
goto _loop

pause
exit