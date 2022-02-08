::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFA5HSRa+GG6pDaET+NT8//+OrEsSGucnfe8=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get name /value') do (
set gpu=%%~a
goto gpu1
)
:gpu1
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get AdapterCompatibility /value') do (
set gpucompany=%%~a
goto maxfresh
)
:maxfresh
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get MaxRefreshRate /value') do (
set maxfresh=%%~a
goto minfresh
)
:minfresh
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get MinRefreshRate /value') do (
set minfresh=%%~a
goto fresh
)
:fresh
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get CurrentRefreshRate /value') do (
set fresh=%%~a
goto color
)
:color
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get VideoModeDescription /value') do (
set color=%%~a
goto driverdate
)
:driverdate
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get DriverDate /value') do (
set driverdate=%%~a
goto adapterRAM
)
:adapterRAM
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe path Win32_VideoController get AdapterRAM /value') do (
set RAM=%%~a
goto gpushow
)
:gpushow
rem 变量gpuname=GPU名字               
rem 变量gpucompany=GPU公司
rem 变量minfresh=最小刷新率
rem 变量minfresh=最大刷新率
rem 变量currentfresh=当前刷新率
rem 变量gpudriver=gpu驱动版本
rem 变量drivedata=驱动日期
rem 变量gpuram=显存大小
rem 变量colorse=支持的分辨率和颜色
set gpuname=%gpu:~5,-1%                              
set gpucompany=%gpucompany:~21,-1%
set minfresh=%minfresh:~15,-1%HZ
set maxfresh=%maxfresh:~15,-1%HZ
set currentfresh=%fresh:~19,-1%Hz
set gpudriver=%driver:~14,-1%
set drivedata=%driverdate:~11,-1%
set gpuram=%RAM:~11,-1%B
set colorse=%color:~21,-1%
