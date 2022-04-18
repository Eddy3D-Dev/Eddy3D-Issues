setlocal
call "C:\Program Files\blueCFD-Core-2017\\setvars.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
REM cd "E:\Netherlands\Eindhoven_51.44844_5.46475_dir0\\0"
cd /d %~dp0\0
decomposePar -force | tee -a log
mpiexec -np 4 simpleFoam -parallel | tee -a log
reconstructPar -latestTime | tee -a log
