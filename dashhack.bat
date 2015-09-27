:: Dash Hack - Hacking the Amazon Dash to run a batch file
:: Code by: Kevin Novak
:: Last Edited: 9/27/2015
:: Version: 0.0.0.0

@echo off

title Dash Hack

:: define a variable containing a single backspace character
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

cd C:\Users\kevin\Desktop\wireshark\App\Wireshark

start tshark -i 4 -p -w C:\Users\kevin\Desktop\hello.txt host 255.255.255.255

echo.
echo test
echo.

setlocal
set file="C:\Users\kevin\Desktop\hello.txt"
set oldSize=0
:_loop
ping 1.1.1.1 -n 1 -w 600 > nul
FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% GTR %oldsize% (
    echo changed
    set oldSize=%size%
) ELSE (
    echo no change
)
goto _loop

pause
exit