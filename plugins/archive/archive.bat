@echo off
title ��ӡ���ݹ鵵��
echo ���򵼽�ָ����鵵�Ѵ�ӡ�ļ�
set /p explore=����Ҫ���Ѵ�ӡ�ļ��б�鿴�������ļ���[Y/N(Ĭ��)]
if "%explore%"=="Y" start finished\
set /p filename=������Ҫ�鵵���ļ���(Ĭ��ΪReineBackup.7z)
if not defined filename set filename=ReineBackup.7z
set /p pass=���������룬����Ҫ������
echo ���ڴ����鵵...
if defined pass set passopt=-p%pass%
plugins\archive\7za.exe a -mx9 -sdel %passopt%  %filename% finished\
mkdir finished
echo �鵵������ɣ�����Reine PrintĿ¼�ڲ鿴
echo ��������˳�
pause >nul
exit