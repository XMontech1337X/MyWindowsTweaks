@echo off
echo Enabling Windows Update Bloatware...

reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate" /v workCompleted /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate" /v workCompleted /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\CrossDeviceUpdate" /v workCompleted /t REG_DWORD /d 1 /f

reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OEMPreInstalledAppsEnabled /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 1 /f

reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v DisableWpbtExecution /f
echo Finished. Restart PC.
pause
