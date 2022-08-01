setlocal
call "C:\Program Files\blueCFD-Core-2020\\setvars_OF8.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
Z:
REM cd "Z:\\\\SprawlGAN\Case_64\\mesh\"
cd /d %~dp0\mesh
blockMesh | tee -a log
surfaceFeatures | tee -a log
decomposePar -force | tee -a log
mpiexec -np 10 snappyHexMesh -overwrite -parallel | tee -a log
reconstructParMesh -constant | tee -a log
renumberMesh -overwrite | tee -a log
