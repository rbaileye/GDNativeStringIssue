set "currentdirectory=%cd%"

rem setting the directories for copying
set "rootdir=%currentdirectory%\ExampleDlls\x64"
set "copydir=%currentdirectory%\..\GDNativeStringIssue\bin"

rem Just copying debugs files for testing currently 
rem copy debug dll
xcopy /y /i "%rootdir%\Debug\Dll1.dll"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll1.pdb"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll2.dll"  "%copydir%"
xcopy /y /i "%rootdir%\Debug\Dll2.pdb"  "%copydir%"

rem All done