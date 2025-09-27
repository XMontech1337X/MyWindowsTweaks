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
echo Enabling Recommends In Start Menu...
(
	reg.exe delete "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "HideRecommendedSection" /f
	reg.exe delete "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Education" /f
	reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /f

	taskkill /f /im explorer.exe
	start explorer.exe
) > nul 2>&1

echo]
echo Finished.
echo Press any key to exit...
pause > nul
exit /b