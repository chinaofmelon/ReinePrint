@echo off
set VERSION=Alpha0.1.0
title [������...]Reine Print [%VERSION%]
echo Reine Print
echo �汾��%VERSION%
echo ��������...
echo ����QRCP���շ���...
start /min qrcp\qrcpService.bat
echo �����ļ����ӷ���...
start /min fileDaemon.bat