setlocal
call "C:\Program Files\blueCFD-Core-2017\\setvars.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
REM cd "E:\Netherlands\Eindhoven_51.44844_5.46475_dir0\\mesh\"
cd /d %~dp0\0
blockMesh | tee -a log
surfaceFeatureExtract | tee -a log
decomposePar -force | tee -a log
mpiexec -np 4 snappyHexMesh -overwrite -parallel | tee -a log
reconstructParMesh -constant | tee -a log
renumberMesh -overwrite | tee -a log
