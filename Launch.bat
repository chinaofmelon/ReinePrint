@echo off
set VERSION=Alpha0.1.5
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
if exist %%i\Service.bat (
echo ��������%%i����
start /min %%i\Service.bat
)
)
echo ������ӡ����...
start /min daemon.bat
echo ���ؿ���̨...
:console
title Reine Print [%VERSION%]
cls
set choose=0
echo Reine Print Console
echo =============
echo [1]ֹͣ
echo [2]չʾ��ӡ��ַ
echo [3]��ӡ���й���
echo =============
set /p choose=����������
if %choose%==1 goto stop
if %choose%==2 goto showurl
if %choose%==3 goto printlist
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

:printlist
cls
set choose=0
echo Reine Print Console -^> List
echo =============
echo [1]�鿴����ӡ�ļ�
echo [2]�鿴�Ѵ�ӡ�ļ�
echo [3]�鿴��ӡʧ���ļ�
echo [4]�����Ѵ�ӡ�ļ�
echo [5]�鵵�Ѵ�ӡ�ļ�
echo [6]����
echo =============
set /p choose=����������
if %choose%==1 start pending\
if %choose%==2 start finished\
if %choose%==3 start error\
if %choose%==4 rd /s /q finished & mkdir finished
if %choose%==5 start plugins\archive\archive.bat
if %choose%==6 goto console
goto printlist