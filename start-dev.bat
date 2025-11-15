@echo off
echo 正在启动 SaaSfly 开发服务器...
cd /d "F:\AIgjz\Code\saasfly\apps\nextjs"

REM 设置环境变量
set NODE_ENV=development

REM 从 .env.local 文件加载环境变量
for /f "usebackq tokens=*" %%a in ("..\..\.env.local") do (
    for /f "tokens=1,2 delims==" %%b in ("%%a") do (
        set "%%b=%%c"
    )
)

echo 环境变量加载完成，正在启动 Next.js 开发服务器...
npx next dev -p 3000

pause