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
echo Disabling Recommends In Start Menu...
(
	reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f
	reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Education" /v "IsEducationEnvironment" /t REG_DWORD /d "1" /f
	reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f

	taskkill /f /im explorer.exe
	start explorer.exe
) > nul 2>&1

echo]
echo Finished.
echo Press any key to exit...
pause > nul
exit /b