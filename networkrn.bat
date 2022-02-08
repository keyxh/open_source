@ECHO OFF
cd/d %~dp0
title 网络测试
SET SJ=%RANDOM%/327
if not exist "folder\log\networkrn\" (MD folder\log\networkrn\)
set log=folder\log\networkrn\%date:~0,3%%date:~5,2%%date:~8,2%%sj%.log
@mode con lines=32 cols=100
rem 回送地址
set ip1=127.0.0.1
rem ip地址

for /f "tokens=16" %%i in ('ipconfig ^|find /i "ipv4"') do set ip2=%%i
if "%ip2%"=="" (goto xp1) else goto 2
:xp1
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "ipv4"') do (
set ip2=%%i
if "%ip2%"=="" (goto xp2) else goto 2
)
:xp2
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "IP Address"') do set ip2=%%i
rem 网关地址
:2
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr 默认网关') do set ip3=%%i
if "%ip3%"=="" (goto xpwg) else goto 3
:xpwg
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr Gateway') do set ip3=%%i 
if "%ip3%"=="" (goto debug3) else goto 3
:3
cls
rem 外网地址
rem 我的服务器地址
set ip4=119.6.50.218
set ip5=www.baidu.com
rem 到这里结束
echo                                  networkrn
echo.
echo                           ———————————
echo.
echo                             回送地址:%ip1%
echo.
echo                           本机地址:%ip2%
echo.
echo                            网关地址:%ip3%
echo.
echo                            外网地址:%ip4%
echo.
echo                            测试网址:%ip5%
echo.
echo                          ————————————
echo.
Ping/n 3 127.0.0.1 > NUL 
echo 开始测试
cls
echo log:[%time%]startting
echo log:[%time%]pinging %ip1%
echo.
ping %ip1% > NUL
if errorlevel 1 (set test1=×  & goto xs) else set test1=√ 
echo log:[%time%]pinging %ip1%:%test1%


echo log:[%time%]pinging %ip2%
echo.
ping %ip2% > nul
if errorlevel 1 (set test2=×  & goto xs) else set test2=√
echo [%time%]pinging %ip2%:%test1%



echo log:[%time%]pinging %ip3%
ping %ip3% > NUL
if errorlevel 1 (set test3=×  & goto xs) else set test3=√
echo log:[%time%]pinging %ip1%:%test1%

echo log:[%time%]pinging %ip4%
ping %ip4% > NUL
if errorlevel 1 (set test4=×  & goto xs) else set test4=√
echo log:[%time%]pinging %ip4%:%test1%

echo log:[%time%]pinging %ip5%
ping %ip5% > nul
if errorlevel 1 (set test5=×  & goto xs) else set test5=√
echo log:[%time%]pinging %ip5%:%test1%
:xs
if "%test1%"=="" (set test1=?)
if "%test2%"=="" (set test2=?)
if "%test3%"=="" (set test3=?)
if "%test4%"=="" (set test4=?)
if "%test5%"=="" (set test5=?)
cls
echo √代表成功
echo ×代表失败
echo ? 代表未测试
echo                        测试结果
echo ——————————————————————
echo.
echo                      回送地址:%test1%            
echo.
echo                      本机ip:%test2%            
echo.
echo                      网关ip:%test3%           
echo.
echo                      外网ip:%test4%
echo.
echo                      具体网址:%test5%                  
echo.
echo ——————————————————————
if %test1%==×  (goto hs)
if %test2%==×  (goto bip)
if %test3%==×  (goto wg)
if %test4%==×  (goto gw)
if %test5%==×  (goto ww)
goto 3
:hs
if exist "failed1.txt" (del failed1.txt & echo 问题依然复现)
echo.
echo 检测出了新问题（ping不通回送地址）
echo 解决方案：
echo 检查网卡,modem情况
echo 检查tcp/ip协议是否正常安装
echo 建议:重装tcp/ip协议
echo. >>FOLDER\TMP\wl1.txt
echo. >>failed1.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit
:bip
if exist "failed2.txt" (del failed2.txt & echo 问题仍然存在)
if exist "failed1.txt" (del failed1.txt & echo 已修复无法ping通回送地址地址问题)
echo 检测出了新问题（ping不通本机ip）
echo 问题导致原因：
echo 检查其他网络硬件是否存在问题
echo 网络是否正常连上
echo 网络可能断开
echo ip存在设置问题
echo 建议：
echo 将ip设置为自动
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed2.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit
:wg
if exist "failed3.txt" (del failed3.txt & echo 问题仍然存在)
if exist "failed1.txt" (del failed1.txt & echo 已修复无法ping通回送地址地址问题)
if exist "failed2.txt" (del failed2.txt & echo 已修复无法ping通本机ip问题)
echo.
echo 检测出了新问题（ping不通网关）
echo 可能导致的原因（只说几条）：
echo 网络因设备间的时延太大
echo IP地址分配问题,内网ip冲突
echo 部分端口不允许用户ping，请自行ping外网ip测试
echo 解决方案：
echo 1.联系网络供应商
echo 2.设置ip自动分配
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>failed3.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit
:gw
if exist "failed4.txt" (del failed4.txt & echo 问题仍然存在)
if exist "failed1.txt" (del failed1.txt & echo 已修复无法ping通回送地址地址问题)
if exist "failed2.txt" (del failed2.txt & echo 已修复无法ping通本机ip问题)
if exist "failed3.txt" (del failed3.txt & echo 已修复无法ping通网关ip问题)
echo 检测出了新问题（ping不通外网）
echo 可能导致的原因：
echo 网络设置有问题（lsp等）
echo 确实存在本地网络问题
echo 解决方案：
echo 联系网络供应商
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed4.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit
:ww
echo.
if exist "failed1.txt" (del failed1.txt & echo 已修复无法ping通回送地址地址问题)
if exist "failed2.txt" (del failed2.txt & echo 已修复无法ping通本机ip问题)
if exist "failed3.txt" (del failed3.txt & echo 已修复无法ping通网关ip问题)
if exist "failed4.txt" (del failed3.txt & echo 已修复无法ping通外网ip问题)
echo 检测出了新问题（ping不通百度）
echo 可能导致的原因：
echo 网络设置有问题（dns，lsp,hosts等）
echo 确实存在本地网络问题
echo 解决方案：
echo 联系网络供应商
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl4.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl8.txt
echo. >>failed5.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit

:3
echo.
if exist "failed1.txt" (del failed1.txt & echo 已修复无法ping通回送地址地址问题)
if exist "failed2.txt" (del failed2.txt & echo 已修复无法ping通本机ip问题)
if exist "failed3.txt" (del failed3.txt & echo 已修复无法ping通网关ip问题)
if exist "failed4.txt" (del failed4.txt & echo 已修复无法ping通外网ip问题)
if exist "failed5.txt" (del failed5.txt & echo 已修复无法ping通百度问题)
echo 目前程序没有发现问题 如果有
echo 如果有
echo 我猜时间没设置对或者lsp，host存在问题
echo 建议：
echo 1.手动cmd重置lsp，清空hosts，重置时钟
echo 2.软件冲突
echo 3.ip，dns设置问题
echo. >>FOLDER\TMP\wl1.txt
echo. >>FOLDER\TMP\wl2.txt
echo. >>FOLDER\TMP\wl3.txt
echo. >>FOLDER\TMP\wl4.txt
echo. >>FOLDER\TMP\wl5.txt
echo. >>FOLDER\TMP\wl6.txt
echo. >>FOLDER\TMP\wl7.txt
echo. >>FOLDER\TMP\wl8.txt
echo 任意键开始修复 & pause 
start networkrn1.bat
exit


