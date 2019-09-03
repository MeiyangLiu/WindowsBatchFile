@echo off
set SOFTWAREPATH=%~dp0
cd %~dp0
rem @echo %~dp0
@echo================================================
@echo "腾宝安装专用版，先安装office，然后安装该目录下所有exe"
@echo================================================
rem 安装.NET3.5
@echo 安装.NET3.5
dism.exe /online /enable-feature /featurename:NetFX3 /Source:%~d0\sources\sxs
@echo 安装.NET3.5完成
@echo================================================
rem 安装office
@echo 正在安装Office，请稍后...
start /wait %~dp0office2013\setup.exe 
@echo 安装Office完成
@echo=================================================
rem 安装Visio
@echo 正在安装Visio，请稍后...
start /wait %~dp0Visio2013\setup.exe 
@echo 安装Visio完成
@echo=================================================
cd %SOFTWAREPATH%
@echo 开始安装应用软件
for %%i in (*.exe) do (
    @echo 正在安装%%i，请稍后...
	start /wait "" "%%i" 
	@echo 安装%%i完成
	@echo=================================================
)
@echo=================================================
@echo "所有操作完成，如有疑问请联系meiyangliu@126.com"
@echo=================================================
pause