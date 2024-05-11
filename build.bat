@echo off
setlocal

set ORIGINAL_DIR=%CD%
set SCRIPT_DIR=%~dp0
cd /D %SCRIPT_DIR%
IF NOT EXIST build mkdir build

odin build src/ -out:build/TodoPicker.exe

cd /D %ORIGINAL_DIR%
endlocal
exit
