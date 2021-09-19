::Made by Brawldude2. ;)

@echo off
set randomfilename = "DRGHUF"

SET /p drive="Enter the removable drive letter:"
CD /D "%drive%:\"

if %errorlevel% == 0 (goto contin)
echo "Drive cannot found."
timeout /t 5
exit

:contin
	attrib -r -h -s /s /d
	del *.lnk
	echo "Deleting shortcut files."
	set thereis=0
	for /d %%f in (*) do (echo "%%~nf"|findstr /r "\<.\>"&&ren "%%f" "DRGHUF"&& set thereis=1)
	

timeout /NOBREAK 5
echo "Folder state: %thereis%"
	)
	if %thereis%==1 CD "DRGHUF"
echo "Cd into the main folder."
	
	del "autorun.inf"
	del "desktop.ini"
echo "Deleting configuration and autorun files."

	echo "Regex search..."
	for /R %%f in (*) do (echo %%~nf|findstr /r "[-_][-_][-_][-_][-_]"&&del "%%f")
	
	if %thereis%==1 goto extract 
:finish
	if exist "autorun.inf" goto finish2
	md "autorun.inf"
	cd "autorun.inf"
	echo "This file is created to perevent reinfections.">Policy.txt
	cd..

:finish2
	attrib +r +h +s /d "Autorun.inf"
	attrib +r +h +s /s /d ^\.*
	attrib +r +h +s /s /d "System Volume Information"
	echo "Done :)"
	timeout /t 10
	exit

:extract
CD "DRGHUF"
echo "Extracting."
for %%f in (*) do (move "%%f" ..)
for /d %%f in (*) do (move "%%f" ..)
cd ..
rd "DRGHUF"
del "$Recycle.bin"
goto finish