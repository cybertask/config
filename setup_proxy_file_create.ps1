# File: setup_proxy.ps1

$content = @"
@echo off

:: Set Proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 10.0.0.5:3128 /f

:: Set Proxy Exceptions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "localhost;127.0.0.1" /f

echo Proxy settings applied.
"@
Set-Content -Path "C:\Users\Public\Desktop\setup_proxy_windows.bat" -Value $content
