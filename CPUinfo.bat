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
::Zh4grVQjdCyDJGyX8VAjFA5HSRa+GG6pDaET+NT4//+OrEsSGucnfe8=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get name /value') do (
set name1=%%~a
goto CPUcore
)
:CPUcore
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get NumberOfCores /value') do (
set core=%%~a
goto CPUprocess
)
:CPUprocess
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get NumberOflogicalProcessors /value') do (
set process=%%~a
goto CPUspeed
)
:CPUspeed
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get maxclockspeed /value') do (
set speed=%%~a
goto L2cache
)
:L2cache
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get L2cachesize /value') do (
set L2cache=%%~a
goto description
)
:description
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get description /value') do (
set description=%%~a
goto L3CACHE
)
:L3cache
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get L3cachesize /value') do (
set L3cache=%%~a
goto deviceid
)
:deviceid
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get ProcessorId /value') do (
set DeviceID=%%~a
goto TYPE
)
:TYPE
for  /f  "skip=2 delims="  %%a  in  ('wmic.exe CPU get ProcessorType /value') do (
set type=%%~a
goto CPUshow
)
:CPUshow
rem cpuname:cpu名字
rem cpuspeed:主频
REM cpudescript:架构
rem cpuid:设备id
rem cputype:设备总类
rem cpucore:cpu核心数
rem cpul2cache:cpu二级缓存
rem cpuprocess:CPU线程数
rem cpul3cache:cpu三级缓存
set cpuname=%name1:~9,-1%
set cpuspeed=%speed:~14,-1%KHZ
set cpudescript=%description:~12,13%
set cpuid=%DeviceID:~12,-1%
set cputype=%type:~14,-1%
set cpucore=%core:~14,-1%
set cpuprocess=%process:~26,-1% 
set cpul2cache=%L2cache:~12,16%
set cpul3cache=%L3cache:~12,16%