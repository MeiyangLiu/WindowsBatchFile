@echo off
set SOFTWAREPATH=%~dp0
cd %~dp0
rem @echo %~dp0
@echo================================================
@echo "�ڱ���װר�ð棬�Ȱ�װoffice��Ȼ��װ��Ŀ¼������exe"
@echo================================================
rem ��װ.NET3.5
@echo ��װ.NET3.5
dism.exe /online /enable-feature /featurename:NetFX3 /Source:%~d0\sources\sxs
@echo ��װ.NET3.5���
@echo================================================
rem ��װoffice
@echo ���ڰ�װOffice�����Ժ�...
start /wait %~dp0office2013\setup.exe 
@echo ��װOffice���
@echo=================================================
rem ��װVisio
@echo ���ڰ�װVisio�����Ժ�...
start /wait %~dp0Visio2013\setup.exe 
@echo ��װVisio���
@echo=================================================
cd %SOFTWAREPATH%
@echo ��ʼ��װӦ�����
for %%i in (*.exe) do (
    @echo ���ڰ�װ%%i�����Ժ�...
	start /wait "" "%%i" 
	@echo ��װ%%i���
	@echo=================================================
)
@echo=================================================
@echo "���в�����ɣ�������������ϵmeiyangliu@126.com"
@echo=================================================
pause