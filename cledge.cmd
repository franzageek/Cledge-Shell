@echo off
if "%1"=="/makedir" goto :makedirX
if "%1"=="/msinfo32" msinfo32
if "%1"=="/mspaint" mspaint
if "%1"=="/shutdown-now" shutdown /s
if "%1"=="/reboot-now" wpeutil reboot
if "%1"=="/logoff-now" logoff
if "%1"=="/explorer" explorer
if "%1"=="/regedit" regedit
if "%1"=="/scandisk" chkdsk
if "%1"=="/diskinfo" goto :diskinfoX
if "%1"=="/updates" start https://github.com/franzageek/Cledge-Shell/releases
if "%1"=="/sysinfo" goto :sysinfoX
if "%1"=="/notepad" notepad
if "%1"=="/winver" winver
if "%1"=="/calc" calc
if "%1"=="/write" write
if "%1"=="/ctrlpanel" control
if "%1"=="/defragui" dfrgui.exe
if "%1"=="/perfmon" perfmon.msc
if "%1"=="/osk" osk.exe
if "%1"=="/?" goto :HELP
if "%1"=="/csver" goto :csver
if "%1"=="/help" goto :HELP

title Cledge Shell 1.21

:start
echo.
echo       *Cledge Shell 1.21*        
echo   *Powered by Tecla Soft and Batch*
echo.
timeout /t 2 /nobreak > NUL
echo.
echo.
echo.

:cmdlist
echo.
echo   cs.makeDir()    to make folders
echo.
echo   cs.MSPaint()    to open Microsoft Paint
echo.
echo   cs.rebootCS()   to restart Cledge Shell
echo.
echo   cs.winSDOptions()  to view Shut Down Options
echo.
echo   cs.csTerminate()  to end the Cledge Shell process
echo.
echo   cs.fileExplorer()  to open File Explorer
echo.
echo   cs.regEdit()  to open Registry Editor 
echo.
echo   cs.commandList()  to get this commandlist
echo.
echo   cs.scanDisk()  to scan and check your disk
echo.
echo   cs.winVer()  to run Winver
echo.
echo   cs.calc()  to run Calculator
echo.
echo   cs.wordPad()  to run WordPad
echo.
echo   cs.controlPanel()  to run Control Panel
echo.
echo   cs.notePad()  to start Notepad
echo.
echo   cs.msInfo32()  to run MSINFO32
echo.
echo   cs.msConfig()  to run MSCONFIG
echo.
echo   cs.cmd()  to start another instance of Command Prompt
echo.
echo   cs.diskInfo() to view disk informations and disk label
echo.
echo   cs.defragUI()  to run Defrag UI
echo.
echo   cs.onScreenKeyboard() to run On Screen Keyboard
echo.
echo   cs.perfMonitor() to run Performances Monitor
echo.
echo   cs.getUpdates()  to check updates
echo.
echo   cs.sysInfo()  to get System Informations
echo.
echo.
echo  *** PLEASE PAY ATTENTION TO "." , "( )" AND CAPITAL LETTERS ***
echo.
echo.
echo.
pause

:getcon
set /p getcon=[Press "I" to get console]   
if %getcon%==i goto :console
goto :getcon

:console
set /p console=CledgeShell1.21#
if %console%==cs.cs.MSPaint() mspaint
if %console%==cs.makeDir() goto :makedir
if %console%==cs.msInfo32() msinfo32
if %console%==cs.msConfig() msconfig
if %console%==cs.fileExplorer() explorer
if %console%==cs.regEdit() regedit
if %console%==cs.rebootCS() goto :start
if %console%==cs.winSDOptions() goto :sdoptions
if %console%==cs.csTerminate() exit
if %console%==cs.commandList() goto :cmdlist
if %console%==cs.scanDisk() chkdsk
if %console%==cs.cmd() start
if %console%==cs.diskInfo() goto :diskinfo
if %console%==cs.getUpdates() start https://github.com/franzageek/Cledge-Shell/releases
if %console%==cs.sysInfo() goto :sysinfo
if %console%==cs.notePad() notepad.exe
if %console%==cs.winVer() winver.exe
if %console%==cs.calc() calc.exe
if %console%==cs.wordPad() write.exe
if %console%==cs.controlPanel() control.exe
if %console%==cs.defragUI() dfrgui.exe
if %console%==cs.onScreenKeyboard() osk.exe
if %console%==cs.perfMonitor() perfmon.msc
goto :console

:makedir
echo.
echo.
echo How to make a new folder:
echo specify the name and the path of folder.
echo.
echo EXAMPLE: If you want to create NEWFOLDER folder, you must to
echo type the path (C:\Users\Bob\Desktop\NEWFOLDER).
echo.
echo **If you want to create NEWERFOLDER subfolder, you must to type the path of that
echo subfolder (C:\Users\Bob\Desktop\NEWFOLDER\NEWERFOLDER).
echo.
:nfaby
set /p nfabort=Do you want to continue?(y-n)
if %nfabort%==n goto :console
if %nfabort%==y goto :nfol
goto :nfaby

:nfol
set /p newfol=Specify the path of new folder:

md %newfol%

echo Created.

:folcon
set /p nfs=Do you want to create other folders? (y-n)
if %nfs%==y goto :nfol
if %nfs%==n goto :console
goto :folcon


:makedirX
echo.
echo.
echo How to make a new folder:
echo specify the name and the path of folder.
echo.
echo EXAMPLE: If you want to create NEWFOLDER folder, you must to
echo type the path (C:\Users\Bob\Desktop\NEWFOLDER).
echo.
echo **If you want to create NEWERFOLDER subfolder, you must to type the path of that
echo subfolder (C:\Users\Bob\Desktop\NEWFOLDER\NEWERFOLDER).
echo.
:nfabyX
set /p nfabortX=Do you want to continue?(y-n)
if %nfabortX%==n exit /B
if %nfabortX%==y goto :nfolX
goto :nfabyX

:nfolX
set /p newfolX=Specify the path of new folder:
md %newfolX%

echo Created.

:folconX
set /p nfsX=Do you want to create other folders? (y-n)
if %nfsX%==y goto :nfolX
if %nfsX%==n exit /B
goto :folconX



:sdoptions
echo.
echo These are the Power Options:
echo.
echo Press "S" to Shut Down Windows
echo Press "R" to Reboot Windows
echo Press "L" to Logoff
echo Press "A" to abort and get the console
echo.
:sop
set /p sdopt=Your choice:
if %sdopt%==s shutdown /s
if %sdopt%==r wpeutil reboot
if %sdopt%==l logoff
if %sdopt%==a goto :console
goto :sop



:sysinfo
systeminfo

:ynqas
set /p ynoqa=Do you want to save in a file? (y/n)
if %ynoqa%==y systeminfo>>C:\Users\%username%\Desktop\SystemInfo.txt &echo Done! &goto :console
if %ynoqa%==n goto :console
goto :ynqas 

:sysinfoX
systeminfo

:ynqasX
set /p ynoqaX=Do you want to save in a file? (y/n)
if %ynoqaX%==y systeminfo>>C:\Users\%username%\Desktop\SystemInfo.txt &echo Done! &start C:\Users\%username%\Desktop\SystemInfo.txt &exit
if %ynoqaX%==n exit /B
goto :ynqasX 


:diskinfo
vol
:diqasw
set /p diqa=Do you want to save in a file? (y/n)
if %diqa%==y systeminfo>>C:\Users\%username%\Desktop\DiskInfo.txt &echo Done! &goto :console
if %diqa%==n goto :console
goto :diqasw 

:diskinfoX
vol
:diqaswX
set /p diqaX=Do you want to save in a file? (y/n)
if %diqaX%==y systeminfo>>C:\Users\%username%\Desktop\DiskInfo.txt &echo Done! &start C:\Users\%username%\Desktop\DiskInfo.txt &exit
if %diqaX%==n exit /B
goto :diqaswX



:HELP

echo Usage of "cledge"
echo	cledge [command]
echo.
echo    Commands:
echo.
echo    [/makedir]     Make a folder.
echo    [/msinfo32]    Open System Information.
echo    [/mspaint]     Open MS Paint.
echo    [/shutdown-now]   Shut the PC down.
echo    [/reboot-now]  Reboot your PC.
echo    [/logoff-now]  Log off your user.
echo    [/explorer]    Run "Explorer".
echo    [/regedit]     Run "Registry Editor".
echo    [/scandisk]    Scan your Disk.
echo    [/diskinfo]    Show Volume Informations.
echo    [/updates]     Check the updates online.
echo    [/sysinfo]     Show System Informations.
echo    [/notepad]     Open "Notepad".
echo    [/winver]      Display the Windows Version.
echo    [/calc]        Run "Calcuator".
echo    [/write]       Open "WordPad".
echo    [/ctrlpanel]   Open the Control Panel.
echo    [/defragui]    Run "UI Defragmenter".
echo    [/perfmon]     Run "Performance Monitor".
echo    [/osk]         Run "On Screen Keyboard".
echo    [/csver]       Display current Cledge Version.
echo    [/?]-[/help]   Display this help.
echo.
exit /B

:csver
echo.
echo =========================================
echo =         Cledge Shell v1.21            =
echo =       Powered by Swift and Batch      =
echo =                                       =
echo =        Developed by FranzaGeek        =
echo =  github.com/franzageek/Cledge-Shell   =
echo =========================================
exit /B

