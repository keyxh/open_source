@echo off
cd/d %~dp0
if exist "1.txt" (DEL 1.TXT)
color 02
@mode con lines=8 cols=80
echo msgbox "��������λ��C:\gamesharefoder\gamemode�����",64,"gamemode" >>1.vbs
start/wait 1.vbs
del/q 1.vbs
if exist "sd.py" (del/q sd.py)
if exist "memory.txt" (del memory.txt)
if exist "PING.txt" (del ping.txt)
title gamemode
for  /f  "skip=2 delims="  %%a  in  ('wmic cpu get name /value')  do  (
set  cpu=%%~a
goto cpu 
)
:CPU
set cpu=%cpu:~5,-1%
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get name /value') do (
set gpu=%%~a
goto yh
)
:yh
if "%cpu%"==""  set cpu=000000000000
if "%gpu%"=="" set gpu=000000000000
echo �����Ż���
start /min /wait folder\lib\optimization\1.bat
start /min /wait folder\lib\optimization\2.bat
start /min /wait folder\lib\optimization\3.bat
start /min /wait folder\lib\optimization\4.bat
start /min /wait folder\lib\optimization\5.bat
start /min /wait folder\lib\optimization\6.bat
echo ���
cls
echo ���ڼ�����
rem log address
rem ��random��ֵ��1-100
set/a sj=%random%/327
if not exist "folder\log\gamemode\" (md folder\log\gamemode)
rem ��������Ϊlog��
set log=folder\log\gamemode\%date:~0,3%%date:~5,2%%date:~8,2%%sj%.log
if not exist "C:\gamesharefolder\" (md C:\gamesharefolder\)
set log2=C:\gamesharefolder\%date:~0,3%%date:~5,2%%date:~8,2%gamemode���.log
echo report power by gamemode >>%log2%
echo [%date%_%time%] >>%log2%
echo log start >>%log2%
ping/n 2 127.0.0.1 > NUL
type 1.TXT>>%log%
echo type tasklist >>%log%
tasklist >>%LOG%
type folder\lib\optimization\1.txt >>%LOG%
echo cpu=%cpu%  >>%log2%
echo gpu=%gpu%  >>%log2%
echo.  >>%log2%
echo.  >>%log2%
echo %date%_%time% >>%LOG%
echo gamemode.bat starting...>>%log%
folder\lib\empty *
:game
if exist "nul@sc" (del nul@sc)
ECHO. >>%log%
ECHO. >>%LOG%
echo %time% >>%Log%
tasklist|find /i "human.exe" 
if %errorlevel%==0 (set game=����һ��Ϳ��)
tasklist|find /i "crossfire.exe" 
if %errorlevel%==0 (set game=��Խ����)
tasklist|find /i "TGame.exe" 
if %errorlevel%==0 (set game=��ս)
tasklist|find /i "league of legends.exe" 
if %errorlevel%==0 (set game=Ӣ������)
tasklist|find /i "aow_exe.exe" 
if %errorlevel%==0 (set game=��Ѷ��������)
tasklist|find /i "falcon.exe" 
if %errorlevel%==0 (set game=������)
tasklist|find /i "yuanshen.exe" 
if %errorlevel%==0 (set game=ԭ��)
tasklist|find /i "genshin.exe" 
if %errorlevel%==0 (set game=ԭ��)
tasklist|find /i "typing_test.exe" 
if %errorlevel%==0 (set game=typing_test)
tasklist|find /i "typing_test_engine.exe" 
if %errorlevel%==0 (set game=typing_test)
tasklist|find /i "gta5.exe" 
if %errorlevel%==0 (set game=5)
tasklist|find /i "gta_sa.exe" 
if %errorlevel%==0 (set game=gtasa)
tasklist|find /i "pubg.exe" 
if %errorlevel%==0 (set game=pubg)
if "%game%"=="" (set game=δʶ��)
:CPU1
echo get game=%game% >>%LOG%
for /f "tokens=2 delims==" %%a in ('wmic path Win32_PerfFormattedData_PerfOS_Processor get PercentProcessorTime /value ^| findstr "PercentProcessorTime"') do (
set CPUUsage=%%a  
echo get cpuusage=%cpuusage% >>%log%
goto 1
)
:1
for /f "tokens=2 delims==" %%a in ('wmic path Win32_PerfFormattedData_PerfOS_Memory get * /value^|findstr "AvailableBytes"') do (
set memory=%%a
goto js
)
:js
for  /f  "skip=1 delims="  %%a  in  ('wmic logicaldisk where "DeviceID='C:'" get FreeSpace ')  do  (
set space=%%~a
goto space
)
:space
if exist "MEMORY.txt" (del/q memory.txt)
echo a=1048576 > sd.py
echo b=%memory% >>sd.py 
echo c=int(b/a) >>sd.py 
echo with open("memory.txt","w") as f: >>sd.py
echo    f.write("0"+"\n")  >>sd.py
echo    f.write(str(c)+"\n")  >>sd.py
echo    f.write("0")   >>sd.py
echo f.close >>sd.py
echo type sd.py >>%LOG%
TYPE SD.py >>%LOG%
folder\lib\python sd.py
for  /f  "skip=1 delims="  %%a  in  (memory.txt)  do  (
set/a memory=%%~a
echo get memory=%memory% >>%log%
goto zh
)
:zh
set n=3
set url=www.baidu.com
for /f "tokens=1-4* delims==" %%a in ('ping /n %n% "%url%"^|find "Average"') do set "ms=%%d"
echo errorlevel=%errorlevel% >>%log%
if errorlevel 1 (set network=��) else set network=�� 
echo ����:%date:~0,10% >>%log2%
echo ʱ��:%time:~0,-3% >>%log2%
echo ��ǰcpuռ��:%CPUUsage%%%  >>%log2%
echo �����ڴ�:%memory%mb >>%log2%
echo ��������:%network%_%ms%>>%log2%
echo C�̿ռ��С:%space%
if %CPUUsage% geq 40 (echo CPUռ�ù���>>%lOG2%)
if %memory% LSS 3000 (echo �����ڴ����>>%LOG2%)
echo.  >>%log2%
echo.  >>%log2%
cls
TITLE gamemode (���ģʽ)--��Ϸ:%game%
echo.       ��������������������������������������������������������������
echo                 ����:%date:~0,10%  
echo                 ˢ��ʱ��:%time:~0,-3%
echo                 ����������:%cpu%  
echo                 �Կ�����:%gpu% 
echo                 ��������:%network% %ms%
echo                 C�̿ռ��С:%space%  
echo                 ������ʹ����:%CPUUsage%%% �����ڴ�:%memory%mb        
ping/n 5 127.0.0.1 > NUL
folder\lib\empty *  >>%log%
ipconfig/flushdns>>%log%
goto game