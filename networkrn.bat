@ECHO OFF
cd/d %~dp0
title �������
SET SJ=%RANDOM%/327
if not exist "folder\log\networkrn\" (MD folder\log\networkrn\)
set log=folder\log\networkrn\%date:~0,3%%date:~5,2%%date:~8,2%%sj%.log
@mode con lines=32 cols=100
rem ���͵�ַ
set ip1=127.0.0.1
rem ip��ַ

for /f "tokens=16" %%i in ('ipconfig ^|find /i "ipv4"') do set ip2=%%i
if "%ip2%"=="" (goto xp1) else goto 2
:xp1
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "ipv4"') do (
set ip2=%%i
if "%ip2%"=="" (goto xp2) else goto 2
)
:xp2
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "IP Address"') do set ip2=%%i
rem ���ص�ַ
:2
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr Ĭ������') do set ip3=%%i
if "%ip3%"=="" (goto xpwg) else goto 3
:xpwg
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr Gateway') do set ip3=%%i 
if "%ip3%"=="" (goto debug3) else goto 3
:3
cls
rem ������ַ
rem �ҵķ�������ַ
set ip4=119.6.50.218
set ip5=www.baidu.com
rem ���������
echo                                  networkrn
echo.
echo                           ����������������������
echo.
echo                             ���͵�ַ:%ip1%
echo.
echo                           ������ַ:%ip2%
echo.
echo                            ���ص�ַ:%ip3%
echo.
echo                            ������ַ:%ip4%
echo.
echo                            ������ַ:%ip5%
echo.
echo                          ������������������������
echo.
Ping/n 3 127.0.0.1 > NUL 
echo ��ʼ����
cls
echo log:[%time%]startting
echo log:[%time%]pinging %ip1%
echo.
ping %ip1% > NUL
if errorlevel 1 (set test1=��  & goto xs) else set test1=�� 
echo log:[%time%]pinging %ip1%:%test1%


echo log:[%time%]pinging %ip2%
echo.
ping %ip2% > nul
if errorlevel 1 (set test2=��  & goto xs) else set test2=��
echo [%time%]pinging %ip2%:%test1%



echo log:[%time%]pinging %ip3%
ping %ip3% > NUL
if errorlevel 1 (set test3=��  & goto xs) else set test3=��
echo log:[%time%]pinging %ip1%:%test1%

echo log:[%time%]pinging %ip4%
ping %ip4% > NUL
if errorlevel 1 (set test4=��  & goto xs) else set test4=��
echo log:[%time%]pinging %ip4%:%test1%

echo log:[%time%]pinging %ip5%
ping %ip5% > nul
if errorlevel 1 (set test5=��  & goto xs) else set test5=��
echo log:[%time%]pinging %ip5%:%test1%
:xs
if "%test1%"=="" (set test1=?)
if "%test2%"=="" (set test2=?)
if "%test3%"=="" (set test3=?)
if "%test4%"=="" (set test4=?)
if "%test5%"=="" (set test5=?)
cls
echo �̴���ɹ�
echo ������ʧ��
echo ? ����δ����
echo                        ���Խ��
echo ��������������������������������������������
echo.
echo                      ���͵�ַ:%test1%            
echo.
echo                      ����ip:%test2%            
echo.
echo                      ����ip:%test3%           
echo.
echo                      ����ip:%test4%
echo.
echo                      ������ַ:%test5%                  
echo.
echo ��������������������������������������������
if %test1%==��  (goto hs)
if %test2%==��  (goto bip)
if %test3%==��  (goto wg)
if %test4%==��  (goto gw)
if %test5%==��  (goto ww)
goto 3
:hs
if exist "failed1.txt" (del failed1.txt & echo ������Ȼ����)
echo.
echo �����������⣨ping��ͨ���͵�ַ��
echo ���������
echo �������,modem���
echo ���tcp/ipЭ���Ƿ�������װ
echo ����:��װtcp/ipЭ��
echo. >>FOLDER\TMP\wl1.txt
echo. >>failed1.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit
:bip
if exist "failed2.txt" (del failed2.txt & echo ������Ȼ����)
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
echo �����������⣨ping��ͨ����ip��
echo ���⵼��ԭ��
echo �����������Ӳ���Ƿ��������
echo �����Ƿ���������
echo ������ܶϿ�
echo ip������������
echo ���飺
echo ��ip����Ϊ�Զ�
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed2.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit
:wg
if exist "failed3.txt" (del failed3.txt & echo ������Ȼ����)
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
echo.
echo �����������⣨ping��ͨ���أ�
echo ���ܵ��µ�ԭ��ֻ˵��������
echo �������豸���ʱ��̫��
echo IP��ַ��������,����ip��ͻ
echo ���ֶ˿ڲ������û�ping��������ping����ip����
echo ���������
echo 1.��ϵ���繩Ӧ��
echo 2.����ip�Զ�����
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>failed3.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit
:gw
if exist "failed4.txt" (del failed4.txt & echo ������Ȼ����)
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
echo �����������⣨ping��ͨ������
echo ���ܵ��µ�ԭ��
echo �������������⣨lsp�ȣ�
echo ȷʵ���ڱ�����������
echo ���������
echo ��ϵ���繩Ӧ��
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed4.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit
:ww
echo.
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed4.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
echo �����������⣨ping��ͨ�ٶȣ�
echo ���ܵ��µ�ԭ��
echo �������������⣨dns��lsp,hosts�ȣ�
echo ȷʵ���ڱ�����������
echo ���������
echo ��ϵ���繩Ӧ��
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl4.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed5.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit

:3
echo.
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed4.txt" (del failed4.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed5.txt" (del failed5.txt & echo ���޸��޷�pingͨ�ٶ�����)
echo Ŀǰ����û�з������� �����
echo �����
echo �Ҳ�ʱ��û���öԻ���lsp��host��������
echo ���飺
echo 1.�ֶ�cmd����lsp�����hosts������ʱ��
echo 2.�����ͻ
echo 3.ip��dns��������
echo. >>FOLDER\TMP\wl1.txt
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl4.txt
echo. >>FOLDER\TMP\wl5.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl8.txt
echo �������ʼ�޸� & pause 
start networkrn1.bat
exit


