@echo off
title Reine Printer Maintance Tool
setlocal enabledelayedexpansion
echo �����߽�������л���
python -h >nul
if not %ERRORLEVEL%==0 (
echo ȱ��Python3��)else (echo ���ҵ�Python3)
if not exist "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE" (
echo ȱ��MS Office�� )else (echo ���ҵ�MS Office)
for /r "C:\Program Files (x86)\Adobe\" %%i in (acrodist.*) do set acrodist=%%i
for /r "C:\Program Files\Adobe\" %%i in (acrodist.*) do set acrodist=%%i
if not defined acrodist (
echo δ�ҵ�Acrobat Pro DC��
)else (echo ���ҵ�Acrobat Pro DC)
if not %PROCESSOR_ARCHITECTURE%==AMD64 (
echo ��ǰ�ܹ���%PROCESSOR_ARCHITECTURE%�����ܹٷ�֧��)else (echo ��ǰ�ܹ�ΪAMD64���ܹٷ�֧��)
if %NUMBER_OF_PROCESSORS% GEQ 4 (
echo ��ǰ�豸�߼���������Ϊ%NUMBER_OF_PROCESSORS%��������������)else (echo ��ǰ�豸�߼�������С��4�������޷���ӡĳЩ��ʽ)
sc query|find "Spooler" >nul && echo ϵͳ��ӡ������������ || echo ϵͳ��ӡ���������У�
pause >nul