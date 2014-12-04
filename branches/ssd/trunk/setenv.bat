@ECHO OFF 
PUSHD %~DP0
SET CURDIR=%CD%
PUSHD ..
SET TOPDIR=%CD%
POPD
POPD

SET GDAL_ROOT=%TOPDIR%\gdal_python
SET GDAL_API_PROXY=ecw,sid,jp2,j2k,ntf
rem SET GDAL_API_PROXY_CONN_POOL=NO
rem SET GDAL_PAM_PROXY_DIR=%TEMP%
SET GDAL_DATA=%GDAL_ROOT%\share\gdal-data
SET GEOTIFF_CSV=%GDAL_DATA%
SET PROJ_LIB=%GDAL_ROOT%\share\proj
SET GDAL_DRIVER_PATH=%GDAL_ROOT%\bin\plugins

SET PYTHONHOME=C:\Python27\ArcGIS10.2
SET PYTHONPATH=%PYTHONHOME%\Lib\lib-tk
SET PYTHONPATH=%GDAL_ROOT%\lib\pywin32_system32;%GDAL_ROOT%\lib\win32;%GDAL_ROOT%\lib\win32\lib;%GDAL_ROOT%\lib\pythonwin;%PYTHONPATH%
SET PYTHONPATH=%GDAL_ROOT%\bin;%GDAL_ROOT%\lib;%PYTHONPATH%
SET PYTHONPATH=%CURDIR%;%PYTHONPATH%

SET path=
SET path=%WINDIR%;%WINDIR%\system32
PATH=%GDAL_ROOT%\bin;%PATH%
PATH=;%GDAL_ROOT%\lib\osgeo;%PATH%
PATH=%GDAL_DRIVER_PATH%;%PATH%
PATH=%PYTHONPATH%;%PATH%
PATH=%PYTHONHOME%;%PATH%
PATH=%CURDIR%;%PATH%

SET GDAL_SKIP=
SET _GDAL_SKIP=JP2MrSID JP2OpenJPEG
REM for /f "tokens=1" %%D IN ('gdalinfo  --formats^|findstr /r "%_GDAL_SKIP%"') DO SET GDAL_SKIP=!GDAL_SKIP! %%D
