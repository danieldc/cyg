@setlocal enableextensions 
@echo off

REM 1. change those based on your machine, make sure there are no spaces
REM 2. make sure cygwin's setup-x86_64.exe is saved under %__CYGWIN_SETUP_DIR%
set __CYGWIN_SETUP_DIR=c:\cygwin64-setup
set __CYGWIN_DIR=c:\cygwin64
set __CYGWIN_SITE=http://mirrors.xmission.com/cygwin/

set __CMD=%1
shift
if "%__CMD%" == "" goto lblHelp
if "%__CMD%" == "help" goto lblHelp
if "%__CMD%" == "--help" goto lblHelp
if "%__CMD%" == "-h" goto lblHelp
if "%__CMD%" == "/h" goto lblHelp
if "%__CMD%" == "-?" goto lblHelp
if "%__CMD%" == "/?" goto lblHelp
if "%__CMD%" == "install" goto lblInstall
if "%__CMD%" == "download" goto lblDownload
if "%__CMD%" == "local-install" goto lblLocalInstall
if "%__CMD%" == "uninstall" goto lblUninstall
if "%__CMD%" == "list" goto lblList
if "%__CMD%" == "local-list" goto lblLocalList
if "%__CMD%" == "details" goto lblDetails
if "%__CMD%" == "grep-details" goto lblGrepDetails
if "%__CMD%" == "find-package" goto lblFindPackage
if "%__CMD%" == "grep-package" goto lblGrepPackage
if "%__CMD%" == "upgrade" goto lblUpgrade
echo Unknown command "%__CMD%"
goto lblHelp

:lblHelp
echo.
echo cyg : a cygwin install management utility
echo.
echo Usage:
echo    cyg install p1,p2,p3   -- install p1, p2 and p3 packages
echo    cyg download p1,p2,p3  -- download p1, p2 and p3 packages from internet
echo    cyg local-install p1,p2,p3  -- install p1, p2 and p3 packages from local dir
echo    cyg uninstall p1,p2,p3  -- uninstall p1, p2 and p3 packages
echo    cyg list               -- list all installed packages
echo    cyg local-list         -- list all locally downloaded packages
echo    cyg details p1 p2 p3   -- get details about packages p1, p2 and p3
echo    cyg grep-details foo   -- grep package details for foo string
echo    cyg find-package /a/b/c1 /a/b/c2 ...   -- get package containing /a/b/c file
echo    cyg grep-package packageNameRegexp     -- grep online packages from cygwin.com using packageNameRegexp
echo    cyg upgrade             -- upgrade all packages to their latest version
echo    cyg upgrade p1,p2,p3    -- upgrade p1,p2 and p3 packages to their latest version
goto lblExit

:lblInstall
call :setCygwinSetupApp
echo TODO: transform `a b c` to `a,b,c`
set __PACKAGES=%1
if "%__PACKAGES%" == "" (
    echo.
    echo Error: no packages to install
    echo.
    goto lblHelp
)
call %__CYGWIN_SETUP_APP% -P %__PACKAGES%
goto :lblExit

:lblDownload
echo TODO: Not Implemented
goto :lblExit

:lblLocalInstall
echo TODO: Not Implemented
goto :lblExit

:lblUninstall
call :setCygwinSetupApp
echo TODO: transform `a b c` to `a,b,c`
set __PACKAGES=%1
if "%__PACKAGES%" == "" (
    echo.
    echo Error: no packages to install
    echo.
    goto lblHelp
)
call %__CYGWIN_SETUP_APP% -x %__PACKAGES%
goto :lblExit

:lblList
call :setCygwinCheckApp
call %__CYGWIN_CHECK_APP% -c
goto :lblExit

:lblLocalList
call :setCygwinCheckApp
REM TODO: more than 9 packages
set __PACKAGES=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %__CYGWIN_CHECK_APP% -c %__PACKAGES%
goto :lblExit

:lblDetails
call :setCygwinCheckApp
REM TODO: more than 9 packages
set __PACKAGES=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %__CYGWIN_CHECK_APP% -l %__PACKAGES%
goto :lblExit

:lblGrepDetails
echo TODO: Not Implemented
goto :lblExit

:lblFindPackage
call :setCygwinCheckApp
REM TODO: more than 9 packages
set __FILES=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %__CYGWIN_CHECK_APP% -f %__FILES%
goto :lblExit

:lblGrepPackage
call :setCygwinCheckApp
REM TODO: more than 9 packages
set __REGEXP=%1 %2 %3 %4 %5 %6 %7 %8 %9
if %__REGEXP% == "" set __REGEXP=.
call %__CYGWIN_CHECK_APP% -p %__REGEXP%
goto :lblExit

:lblUpgrade
call :setCygwinSetupApp
echo TODO: transform `a b c` to `a,b,c`
set __PACKAGES=%1
REM if "%__PACKAGES%" == "" (
REM     echo.
REM     echo Error: no packages to install
REM     echo.
REM     goto lblHelp
REM )
call %__CYGWIN_SETUP_APP% -g %__PACKAGES%
goto :lblExit

:lblEcho
echo program:       %0
echo __CMD:           %__CMD%
echo unprocessed:   %1 %2 %3 %4 %5 %6 %7
echo full:          %*
goto lblExit

:lblExit
endlocal
exit /b 0

:setCygwinSetupApp
    set __CYGWIN_SETUP_APP=%__CYGWIN_SETUP_DIR%\setup-x86_64.exe -v -n -q -R %__CYGWIN_DIR% -O -s %__CYGWIN_SITE% -l %__CYGWIN_SETUP_DIR% -a x86_64
    goto :eof
:setCygwinCheckApp
    set __CYGWIN_CHECK_APP=%__CYGWIN_DIR%\bin\cygcheck.exe -v
    goto :eof
