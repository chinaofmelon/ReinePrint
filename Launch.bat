@echo off
set VERSION=Alpha0.1.1
title [������...]Reine Print [%VERSION%]
echo Reine Print
echo ������������
echo �汾��%VERSION%
echo ��������...
if not exist pending mkdir pending
if not exist finished mkdir finished
if not exist error mkdir error
echo �������շ���...
for /d %%i in (receivers\*) do (
echo ��������%%i����
start /min %%i\Service.bat
)
echo ������ӡ����...
start /min daemon.bat
echo ���ؿ���̨...
:console
title Reine Print [%VERSION%]
cls
echo Reine Print Console
echo =============
echo [1]ֹͣ
echo [2]չʾ��ӡ��ַ
echo =============
set /p choose=����������
if %choose%==1 goto stop
if %choose%==2 goto showurl
goto console



:stop
cls
echo ����ֹͣ...
for /d %%i in (receivers\*) do (
echo ����ֹͣ%%i����
start /min %%i\Stop.bat
)
taskkill /im cmd.exe /f
exit

:showurl
for /f "tokens=1-2 delims=:" %%i in ('ipconfig ^|find /i "IPv4"') do set ip=%%j
set "ip=%ip: =%"
echo setIP(^"%ip%^") >showurl/ip.js
start showurl/showurl.html
goto console