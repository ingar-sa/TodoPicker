@echo off
setlocal

IF NOT EXIST build mkdir build

cd build
TodoPicker.exe

endlocal
exit
