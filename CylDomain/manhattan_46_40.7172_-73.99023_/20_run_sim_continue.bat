setlocal
call "C:\Program Files\blueCFD-Core-2020\\setvars_OF8.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
Z:
REM cd "Z:\manhattan_46_40.7172_-73.99023_\\20"
cd /d %~dp0\20
mpiexec -np 4 simpleFoam -parallel | tee -a log
reconstructPar -latestTime | tee -a log
