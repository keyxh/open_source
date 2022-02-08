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
::Zh4grVQjdCyDJGyX8VAjFA5HSRa+GG6pDaET+NT0/OOJpEJTUfo6GA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get Version /value') do (
set version=%%~a
goto mem5
)
:mem5
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get TotalVirtualMemorySize /value') do (
set mem5=%%~a
goto stored
)
:stored
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get SizeStoredInPagingFiles /value') do (
set stored=%%~a
goto director
)
:director
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get SystemDirectory /value') do (
set director=%%~a
goto FREERAM
)
:FREERAM
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get FreePhysicalMemory /value') do (
set FREERAM=%%~a
goto bit
)
:bit
if exist %windir%\SysWOW64 (set/a bit=64) else set/a bit=32
goto users
:users
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get NumberOfUsers /value') do (
set user=%%~a
goto debug
)
:debug
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe OS get debug /value') do (
set debug=%%~a
goto OSshow
)
:OSshow
rem 变量osname=名字
rem 变量osversion=版本
rem 变量debugmode=调试模式是否开启
rem 变量memmemory=虚拟内存大小
rem 变量memory=安装内存
rem 变量freememory=可用内存
rem 变量numberofuser=用户数
rem 变量firectorsize=系统目录
rem 变量systemstored=系统文件所占空间
set osname=%OS%_%bit%
set osversion=%version:~8,-1%
set debugmode=%debug:~5,-1%
set memmemory=%mem5:~23,-1%
set memory=%RAM2%
set freememory=%FREERAM:~19,-1%
set numberofuser=%user:~14,-1%         
set firectorsize=%director:~16,-1%
set systemstored=%stored:~24,-1%