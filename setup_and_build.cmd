
SET /P TRUSTSUBMODULE=Do you want to reset all submodules? (Choose Y first time you run or retest) (Y/[N])?
IF /I "%TRUSTSUBMODULE%" NEQ "Y" GOTO SKIP_SUBMODULE

REM Remove all untracked content of the module
git submodule foreach --recursive git clean -xfd
REM Force all changed track files to be default values.
git submodule foreach --recursive git reset --hard
REM Update to the Latest and greatest in the submodule
git submodule update --recursive --remote

:SKIP_SUBMODULE

@ECHO Checking for VS2019 Enterprise
if "%VSINSTALLDIR%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsx86_amd64.bat"

@ECHO Checking for VS2019 Professional
if "%VSINSTALLDIR%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsx86_amd64.bat"

SET BASE_DIR=%cd%
set VCPKG_HOME=%BASE_DIR%/vcpkg
mkdir "%VCPKG_HOME%"

@ECHO -------------------------------------------
@echo BASE_DIR   = %BASE_DIR%
@echo VCPKG_HOME = %VCPKG_HOME%
@ECHO -------------------------------------------

cd %BASE_DIR%/../liboauth2

call "bootstrap-windows.cmd"


cd %BASE_DIR%

msbuild.exe "mod_oauth2.sln" /p:Configuration=Release /p:Platform="x64"

mkdir target
mkdir target\mod_oauth2
mkdir target\mod_oauth2\x64
mkdir target\mod_oauth2\x64\Release
copy x64\Release\mod_oauth2.dll target\mod_oauth2\x64\Release\mod_oauth2.dll

del target\mod_oauth2-3.4.0-win64-VS16.zip

powershell Compress-Archive -Path target\mod_oauth2\x64\Release\mod_oauth2.dll -DestinationPath target\mod_oauth2-3.4.0-win64-VS16.zip

%VCPKG_CMD% integrate remove 