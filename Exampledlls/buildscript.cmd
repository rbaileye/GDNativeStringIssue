set myproj=Exampledlls\ExampleDlls.sln
set "currentdirectory=%cd%"

rem assumes you have 2017 or 2019 community
set builder="%ProgramFiles%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" set builder="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" set builder="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"


title clean release
%builder% %myproj% /t:Clean /p:Configuration=Release /property:Platform=x64

title clean debug
%builder% %myproj% /t:Clean /p:Configuration=Debug /property:Platform=x64

rem
rem release build x64 
rem
title build release
%builder% %myproj% /p:Configuration=Release /property:Platform=x64
if ERRORLEVEL 1 GOTO :errors

rem
rem Debug build x64
rem
title build Debug
%builder% %myproj% /p:Configuration=Debug /property:Platform=x64
if ERRORLEVEL 1 GOTO :errors

:errors
set BUILD_STATUS=%ERRORLEVEL%
if %BUILD_STATUS%==0 echo Build success
if not %BUILD_STATUS%==0  echo Build failed!!!!!
if "%IGNOREERRORS%" == "1" goto :copyfiles
if not %BUILD_STATUS%==0  pause


:copyfiles
rem setting the directories for copying
set "rootdir=%currentdirectory%\ExampleDlls\x64"
set "copydir=%currentdirectory%\..\GDNativeStringIssue\bin"

rem Just copying debugs files for testing currently 
rem copy debug dll
xcopy /y /i "%rootdir%\Debug\Dll1.dll"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll1.pdb"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll2.dll"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll2.pdb"  "%copydir%"

goto :TheEnd

:TheEnd

rem Built both debug and Release x64, but only copied debug files.
