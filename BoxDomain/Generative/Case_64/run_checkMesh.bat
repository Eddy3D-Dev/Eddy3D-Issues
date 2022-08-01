setlocal
call "C:\Program Files\blueCFD-Core-2020\\setvars_OF8.bat"
set PATH=%HOME%\msys64\usr\bin;%PATH%
Z:
REM cd "Z:\\\\SprawlGAN\Case_64\\mesh\"
cd /d %~dp0\mesh
checkMesh -allGeometry -allTopology -writeSets vtk | tee -a log
foamToVTK -faceSet highAspectRatioCells -ascii | tee -a log
foamToVTK -faceSet nonOrthoFaces -ascii | tee -a log
foamToVTK -faceSet skewFaces -ascii | tee -a log
foamToVTK -faceSet wrongOrientedFaces -ascii | tee -a log
foamToVTK -faceSet zeroVolumeCells -ascii | tee -a log
foamToVTK -faceSet edgeFaces -ascii | tee -a log
foamToVTK -cellSet oneInternalFaceCells -ascii | tee -a log
foamToVTK -cellSet concaveCells -ascii | tee -a log
