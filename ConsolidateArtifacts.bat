setlocal EnableDelayedExpansion

:: Libraries from local folder
@SETLOCAL
@ECHO off
call "%VS140COMNTOOLS%..\..\VC\bin\vcvars32.bat"

set "OUT_DIR=./Artifacts"
set "CURR_DIR=."

::remove original artifacts (if any)
if exist "OUT_DIR" rmdir "%OUT_DIR%" /s /q
::create artifacts folder
mkdir "%OUT_DIR%"

::go to json11 folder and move json.hpp into artifact folder
xcopy  "src\*.hpp" "%OUT_DIR%" /y/s/q/i
if !errorlevel! neq 0 exit /b !errorlevel!

exit /b 0

@ECHO ON

:FAIL
exit /b %errorlevel%
@ECHO ON

