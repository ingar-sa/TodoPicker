@echo off
setlocal

set ORIGINAL_DIR=%CD%
set SCRIPT_DIR=%~dp0
cd /D %SCRIPT_DIR%
IF NOT EXIST build mkdir build

odin run src/ -out:build/TodoPicker.exe -- path ./build/lists/scn.txt 

cd /D %ORIGINAL_DIR%
endlocal
exit
