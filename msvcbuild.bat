@echo off
chcp 65001
setlocal EnableDelayedExpansion
set cmakepath=D:/Software/Cmake/bin
if exist %cmakepath% (
    set "PATH=%PATH%;%cmakepath%"
    echo 已将 %cmakepath% 添加到 PATH 环境变量中。
) else (
    echo 目录 %cmakepath% 不存在，请检查后重试。
    exit /b
)
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
echo 显示cmake版本
cmake --version
echo 显示编译器版本
cl
echo 正在执行cmake构建
cmake .. -G "NMake Makefiles"
echo cmake构建完成,是否执行编译
set /p input_var=输入Y时编译,其它不编译:
set input_var=%input_var:~0,1%
if /i %input_var%==y (
    nmake
    echo 编译完成
) else (
    echo 跳过编译
)
set /p input_var1=输入Y时安装,其它不安装:
set input_var1=%input_var1:~0,1%
if /i %input_var1%==y (
    nmake  install
    echo 安装完成
) else (
    echo 跳过安装
)
pause