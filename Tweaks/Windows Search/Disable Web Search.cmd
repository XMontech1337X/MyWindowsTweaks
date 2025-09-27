@echo off

set "___args="%~f0" %*"
fltmc > nul 2>&1 || (
	echo Administrator privileges are required.
	powershell -c "Start-Process -Verb RunAs -FilePath 'cmd' -ArgumentList """/c $env:___args"""" 2> nul || (
		echo You must run this script as admin.
		if "%*"=="" pause
		exit /b 1
	)
	exit /b
)

echo]
echo Disabling Web Search
(
	reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f

	taskkill /f /im explorer.exe
	taskkill /f /im SearchHost.exe
	start explorer.exe
) > nul 2>&1

echo]
echo Finished.
echo Press any key to exit...
pause > nul
exit /b