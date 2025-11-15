# SaaSfly 开发环境重启指南

## 问题原因
出现"服务不可用"错误的原因是：开发服务器在电脑重启后不会自动启动。这是开发环境的正常行为，需要手动重新启动服务器。

## 解决方案

### 方法1：使用快捷启动脚本（推荐）
我已经为您创建了 `start-dev.bat` 文件，以后只需双击即可启动开发服务器：

```bash
# 在项目根目录下双击运行
double-click start-dev.bat
```

### 方法2：手动启动
如果您想手动启动，请在 PowerShell 中运行：
```powershell
cd 'F:\AIgjz\Code\saasfly\apps\nextjs'
$env:NODE_ENV="development"
Get-Content ..\..\.env.local | ForEach-Object { if($_ -match '^([^=]+)=(.*)$') { [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2].Trim("'")) } }
npx next dev -p 3000
```

### 方法3：使用 Bun（如果您安装了 Bun）
```bash
cd F:\AIgjz\Code\saasfly
bun run dev
```

## 预防措施

1. **创建桌面快捷方式**：将 `start-dev.bat` 发送到桌面作为快捷方式
2. **添加到启动项**：将脚本添加到 Windows 启动项（可选）
3. **使用进程管理器**：考虑使用 PM2 等进程管理器来管理开发服务器

## 技术细节

- **端口**：3000
- **框架**：Next.js 14.2.5
- **包管理器**：Bun（也可用 npm/pnpm）
- **环境变量**：存储在 `.env.local` 文件中
- **认证**：使用 Clerk 服务

## 验证服务器状态

启动后，您可以通过以下方式验证：
1. 访问 http://localhost:3000
2. 在 PowerShell 中运行：`netstat -ano | findstr :3000`
3. 查看控制台输出是否显示 "✓ Ready"

现在您可以重新访问 http://localhost:3000 了！