@echo off
title Kirikouano - Obtenir mon code PC
echo.
echo  KIRIKOUANO - recuperation de ton code PC
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$g=(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Cryptography').MachineGuid; $b=[Text.Encoding]::UTF8.GetBytes('KIRI|'+$g+'|'+[Environment]::MachineName); $h=[Security.Cryptography.SHA256]::Create().ComputeHash($b); $x=([BitConverter]::ToString($h,0,6)).Replace('-',''); $c=$x.Substring(0,4)+'-'+$x.Substring(4,4)+'-'+$x.Substring(8,4); Set-Content -Path '%~dp0mon_code.txt' -Value $c; $c | clip; Write-Host ('  Ton code PC : '+$c) -ForegroundColor Cyan"
echo.
echo  Le code est deja copie : colle-le (Ctrl+V) dans ton message a Kirikouano.
echo.
pause
