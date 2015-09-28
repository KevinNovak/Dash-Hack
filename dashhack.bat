:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/27/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

start tshark -i 4 -p -w %TEMP%\dashlisten.txt host 255.255.255.255 and 192.168.0.1
echo Please ^Wait
ping 1.1.1.1 -n 1 -w 3000 > nul
echo Begin

:_loop
FOR /F "usebackq" %%A IN ('%TEMP%\dashlisten.txt') DO set size=%%~zA
if %size% GTR 294 (
    start sWavPlayer.exe johncena.wav
    taskkill /f /im tshark.exe
    start tshark -i 4 -p -w %TEMP%\dashlisten.txt host 255.255.255.255 and 192.168.0.1
    ping 1.1.1.1 -n 1 -w 18000 > nul
    goto _loop
)
ping 1.1.1.1 -n 1 -w 300 > nul
goto _loop

pause
exit