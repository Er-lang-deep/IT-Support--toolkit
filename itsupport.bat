@echo off
setlocal

set "LOG=IT_Support_Report.txt"

:menu
cls
echo === IT SUPPORT TOOLKIT ===
echo 1. System Information
echo 2. Network Information
echo 3. Running Processes
echo 4. Internet Connectivity
echo 5. Exit

set /p choice="Select an option (1-5): "

if "%choice%"=="1" goto system
if "%choice%"=="2" goto network
if "%choice%"=="3" goto processes
if "%choice%"=="4" goto internet
if "%choice%"=="5" exit /b

echo Invalid choice.
pause
goto menu

:system
echo ==system information === >> "%LOG%"
systeminfo >> "%LOG%" 2>&1
goto saved

:network
echo ===network information === >> "%LOG%"
ipconfig /all >> "%LOG%" 2>&1
goto saved

:processes
echo === current process running === >> "%LOG%"
tasklist >> "%LOG%" 2>&1
goto saved

:internet
echo === internet connectivity === >> "%LOG%"
ping -n 2 8.8.8.8 >> "%LOG%" 2>&1
goto saved

:saved
echo Diagnostic completed: %date% %time% >> "%LOG%"
echo Report saved to %LOG%.
pause
goto menu