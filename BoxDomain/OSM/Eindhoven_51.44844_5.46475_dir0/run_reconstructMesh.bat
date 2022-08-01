setlocal
call "C:\Program Files\blueCFD-Core-2017\\setvars.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
REM cd "E:\Netherlands\Eindhoven_51.44844_5.46475_dir0\\mesh\"
cd /d %~dp0\mesh
reconstructParMesh -constant | tee -a log
