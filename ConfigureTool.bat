@echo off
@setlocal enableextensions enabledelayedexpansion
title Reine Print ���ù���
:mainmenu
cls
set choose=0
echo �����߿��ԶԹ��ܽ�������
echo ��ȷ������ǰ�Ѿ�ֹͣ����
echo =============
echo [1]���շ������
echo [2]��ʽ֧�ֹ���
echo [3]��ӡ��־����
echo [4]��ӡ����⿪��
echo =============
set /p choose=����������
if %choose%==1 goto receivers
if %choose%==2 goto format
if %choose%==3 goto log
if %choose%==4 goto printerdetect
goto mainmenu




:receivers
cls
set choose=0
echo ���շ������
echo =============
echo [1]����һ�����շ���
echo [2]ͣ��һ�����շ���
echo [3]��ѯ�����б�
echo [4]����
echo =============
set /p choose=����������
if %choose%==1 goto receiveron
if %choose%==2 goto receiveroff
if %choose%==3 goto receiverlist
if %choose%==4 goto mainmenu
goto receivers

:receiveron
set name=
cls
set /p name=������Ҫ���õķ�����
if not exist receivers\%name%\Service.disable goto noreceiver
rename receivers\%name%\Service.disable Service.bat
echo ������%name%
ping 127.1 >nul -n 3
goto receivers

:receiveroff
set name=
cls
set /p name=������Ҫͣ�õķ�����
if not exist receivers\%name%\Service.bat goto noreceiver
rename receivers\%name%\Service.bat Service.disable
echo ��ͣ��%name%
ping 127.1 >nul -n 3
goto receivers

:noreceiver
echo �÷��񲻴��ڻ�ǰ״̬�޷����иò���
ping 127.1 >nul -n 3
goto receivers

:receiverlist
cls
for /d %%i in (receivers\*) do (
if exist %%i\Service.bat (
echo %%i��������״̬
)
if exist %%i\Service.disable (
echo %%i����ͣ��״̬
)
)
echo �����������
pause >nul
goto receivers


:format
cls
set choose=0
echo ��ʽ֧�ֹ���
echo =============
echo [1]����һ����ʽ
echo [2]ͣ��һ����ʽ
echo [3]��ѯ��ʽ�б�
echo [4]�л���ʽ�������
echo [5]����
echo =============
set /p choose=����������
if %choose%==1 goto formaton
if %choose%==2 goto formatoff
if %choose%==3 goto formatlist
if %choose%==4 goto formatengine
if %choose%==5 goto mainmenu
goto format

:formaton
set name=
cls
set /p name=������Ҫ���õĸ�ʽ
if not exist printmodule\%name%\print.bat_disable goto formaterror
rename printmodule\%name%\print.bat_disable print.bat
echo ������%name%
ping 127.1 >nul -n 3
goto format

:formatoff
set name=
cls
set /p name=������Ҫ���õĸ�ʽ
if not exist printmodule\%name%\print.bat goto formaterror
rename printmodule\%name%\print.bat print.bat_disable
echo �ѽ���%name%
ping 127.1 >nul -n 3
goto format



:formatlist
cls
for /d %%i in (printmodule\*) do (
if exist %%i\print.bat (
echo %%i��������״̬
)
if exist %%i\print.bat_disable (
echo %%i����ͣ��״̬
)
)
echo �����������
pause >nul
goto format


:formatengine
cls
set /p name=������Ҫ���õĸ�ʽ
if not exist printmodule\%name%\config.bat goto formaterror
call printmodule\%name%\config.bat
cls
goto format

:formaterror
echo �ø�ʽ�����ڻ�ò�����ǰ�����ø�ʽ֧��
ping 127.1 >nul -n 3
goto format


:log
cls
set choose=0
echo ��ӡ��־����
echo =============
if exist config\printlog.enable (
echo [1]���ô�ӡ��־)else (
echo [1]���ô�ӡ��־)
echo [2]�鿴��ӡ��־
echo [3]����
echo =============
set /p choose=����������
if %choose%==1 goto switchlog
if %choose%==2 if exist logs\print.log (start logs\print.log)else (cls&echo ��ӡ��־������&ping 127.1 >nul -n 2&goto log)
if %choose%==3 goto mainmenu
goto log

:switchlog
cls
if exist config\printlog.enable (
rename config\printlog.enable printlog.disable
echo �ѽ��ô�ӡ��־)else (
rename config\printlog.disable printlog.enable
echo �����ô�ӡ��־)
ping 127.1 >nul -n 2
goto log

:printerdetect
cls
if exist config\detectonline.enable (
rename config\detectonline.enable detectonline.disable
echo �ѽ��ô�ӡ����⣬���Ӵ�ӡ���Ƿ�����)else (
rename config\detectonline.disable detectonline.enable
echo �����ô�ӡ����⣬��ӡ�����ߺ���ͣ����)
ping 127.1 >nul -n 2
goto mainmenu