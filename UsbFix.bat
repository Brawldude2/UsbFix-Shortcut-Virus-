@echo off

set randomfilename = "DRGHUF"

SET /p drive="Usb harfini giriniz:"
CD /D "%drive%:\"

if %errorlevel% == 0 (goto contin)
echo "Surucu bulunamadi."
timeout /t 5
exit

:contin
	attrib -r -h -s /s /d
	del *.lnk
	echo "Deleting lnk files."
	set thereis=0
	for /d %%f in (*) do (echo "%%~nf"|findstr /r "\<.\>"&&ren "%%f" "DRGHUF"&& set thereis=1)
	

timeout /NOBREAK 5
echo "Folder state: %thereis%"
	)
	if %thereis%==1 CD "DRGHUF"
echo "Cd into the main folder."
	
	del autorun.inf
	del desktop.ini
echo "Deleting more stuff"

	echo "Regex search..."
	for /R %%f in (*) do (echo %%~nf|findstr /r "[-_][-_][-_][-_][-_]"&&del "%%f")
	
	if %thereis%==1 goto extract 
:finish
	md "Autorun.inf"
	cd "Autorun.inf"
	type nul>Policy.txt
	cd..
	attrib +r +h +s /s /d "Autorun.inf"
	attrib +r +h +s /s /d ^\.*
	attrib +r +h +s /s /d "System Volume Information"
	echo "Bitti :)"
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