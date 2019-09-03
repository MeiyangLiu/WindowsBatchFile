@echo off
@echo ===================================================================
@echo 查找最近n天内指定路径下修改的文件，包含该路径下子文件夹内的内容
@echo ===================================================================
rem set /a n=3
set SOFTWAREPATH=%~dp0
set TYPE=0
set /p TYPE=请输入您要查找的类型(0:所有文件；1:C#源代码；2:SQL；3：pdf)：
set /p n=请输入您要查找最近几天内的修改，输入数字：
set /p SOFTWAREPATH=请输入要查找的路径，不输入默认当前文件所在位置：

rem    计算前n天日期,闰年按简单4年一闰计  ----  yyykkkyyyy 
echo.
set/a y=%date:~,4%,m=1%date:~5,2%-100,d=1%date:~8,2%-100
set/a d-=n,"1/(-d>>31)" 2>nul&&goto :ok
:loop
set/a m-=1,d+=31,y-=!m,m+=!m*12
set/a "d-=!(m-2)*(3-!(y&3))+!(m-4)+!(m-6)+!(m-9)+!(m-11)"
if %d% leq 0 goto :loop
:ok
set/a m+=100,d+=100
set "d_n=%y%/%m:~1%/%d:~1%"
rem 计算时间结束

@echo 开始时间：%d_n%
rem 设置路径

@echo 查找路径：%SOFTWAREPATH%
@echo 查找类型：%TYPE%
cd /d %SOFTWAREPATH%
@echo ==================================================================
@echo 开始查找最近%n%天内修改的文件
@echo ==================================================================
if %TYPE%==0 (
	for /r %%i in (*) do if %%~ti GEQ %d_n% @echo  最后修改日期大于%d_n%的文件%%i；最后修改时间%%~ti
)
if %TYPE%==1 (
	for /r %%i in (*.cs) do if %%~ti GEQ %d_n% @echo  最后修改日期大于%d_n%的cs文件%%i；最后修改时间%%~ti
)
if %TYPE%==2 (
	for /r %%i in (*.sql) do if %%~ti GEQ %d_n% @echo  最后修改日期大于%d_n%的sql文件%%i；最后修改时间%%~ti
)
if %TYPE%==3 (
	for /r %%i in (*.pdf) do if %%~ti GEQ %d_n% @echo  最后修改日期大于%d_n%的sql文件%%i；最后修改时间%%~ti
)
@echo ===============================================================
@echo 查找结束，欢迎交流，邮箱：liumeiyang@mail.sdu.edu.cn
@echo ===============================================================
pause
rem EQU - 等于
rem NEQ - 不等于
rem LSS - 小于
rem LEQ - 小于或等于
rem GTR - 大于
rem GEQ - 大于或等于