@SETLOCAL EnableDelayedExpansion

@SET _packages=
@for /F "delims=" %%i in (cyg-packages.txt) do SET _packages=!_packages!,%%i
@REM echo Installing packages: "%_packages%"
@call cyg.cmd install "%_packages%"

@ENDLOCAL
