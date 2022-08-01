setlocal
call "C:\Program Files\blueCFD-Core-2020\\setvars_OF8.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
Z:
REM cd "Z:\\\\SprawlGAN\Case_64\\0"
cd /d %~dp0\0
decomposePar -force | tee -a log
mpiexec -np 10 simpleFoam -parallel | tee -a log
reconstructPar -latestTime | tee -a log
