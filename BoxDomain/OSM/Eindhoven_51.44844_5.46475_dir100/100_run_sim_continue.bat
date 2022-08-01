setlocal
call "C:\Program Files\blueCFD-Core-2017\\setvars.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
E:
REM cd "E:\Netherlands\Eindhoven_51.44844_5.46475_dir100\\100"
cd /d %~dp0\100
mpiexec -np 4 simpleFoam -parallel | tee -a log
reconstructPar -latestTime | tee -a log
