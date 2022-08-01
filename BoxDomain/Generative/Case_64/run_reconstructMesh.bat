setlocal
call "C:\Program Files\blueCFD-Core-2020\\setvars_OF8.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
Z:
REM cd "Z:\\\\SprawlGAN\Case_64\\mesh\"
cd /d %~dp0\mesh
reconstructParMesh -constant | tee -a log
