cls
echo PDF��ʽ��ӡ���ù���
if exist config\pdf-backend (
set /p backend=< config\pdf-backend
) else (
set backend=PDFtoPrinter
echo PDFtoPrinter > config\pdf-backend
)
echo ��ǰPDF��ӡ���Ϊ%backend%
echo [1]PDFtoPrinter�����ã�
echo [2]Acrobat DC Pro���谲װ��
set /p value=�����������л��Ĵ�ӡ��ˣ�������Чֵ�򱣳ֲ�����
if %value%==1 echo PDFtoPrinter > config\pdf-backend
if %value%==2 echo Acrobat > config\pdf-backend
echo �л������ɣ������������
pause >nul
exit /b