@echo off
title Site Blocker- 335i
setlocal enabledelayedexpansion
chcp 65001 > nul
color 5

mode con: cols=105 lines=25

:banner
echo.
echo.
echo         ███████╗██╗████████╗███████╗    ██████╗ ██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
echo         ██╔════╝██║╚══██╔══╝██╔════╝    ██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
echo         ███████╗██║   ██║   █████╗      ██████╔╝██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝
echo         ╚════██║██║   ██║   ██╔══╝      ██╔══██╗██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
echo         ███████║██║   ██║   ███████╗    ██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
echo         ╚══════╝╚═╝   ╚═╝   ╚══════╝    ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
echo.
echo.                                                                                        

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator.
    pause
    exit /b
)

:menu
cls
color 5
echo.
echo.
echo         ███████╗██╗████████╗███████╗    ██████╗ ██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
echo         ██╔════╝██║╚══██╔══╝██╔════╝    ██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
echo         ███████╗██║   ██║   █████╗      ██████╔╝██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝
echo         ╚════██║██║   ██║   ██╔══╝      ██╔══██╗██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
echo         ███████║██║   ██║   ███████╗    ██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
echo         ╚══════╝╚═╝   ╚═╝   ╚══════╝    ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
echo.
echo.    
echo. 
echo     1. Block a website
echo     2. Unblock a website
echo     3. Exit
echo.
set /p choice=Choose an option: 

if "%choice%"=="1" goto block
if "%choice%"=="2" goto unblock
if "%choice%"=="3" exit
goto menu

:block
echo.
echo      ** Note: Dont Enter URLS (e.g., https://facebook.com) , Just Enter Domain (www.facebook.com) **
echo.
set /p site=Enter website to block (e.g., facebook.com): 
echo 127.0.0.1 %site% >> %SystemRoot%\System32\drivers\etc\hosts
echo Website blocked: %site%
pause
goto menu

:unblock
set /p site=Enter website to unblock (e.g., facebook.com): 
findstr /v "127.0.0.1 %site%" %SystemRoot%\System32\drivers\etc\hosts > "%TEMP%\hosts_temp"
copy /y "%TEMP%\hosts_temp" %SystemRoot%\System32\drivers\etc\hosts >nul
del "%TEMP%\hosts_temp"
echo Website unblocked: %site%
pause
goto menu
