@echo off
setlocal

IF NOT EXIST build mkdir build

cd build
REM TodoPicker.exe
TodoPicker.exe scn.txt

endlocal
exit
