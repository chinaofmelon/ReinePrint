@echo off
set VERSION=Alpha0.1.0
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
start %%i\Service.bat
)
echo ������ӡ����...
start daemon.bat
echo ���ؿ���̨...
title Reine Print [%VERSION%]
cls
echo Reine Print Console
echo =============
echo [0]����
echo [1]ֹͣ
echo [2]չʾ��ӡ��ַ
echo =============
set /p choose=����������