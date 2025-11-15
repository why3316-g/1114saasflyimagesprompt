# SaaSfly 开发环境重启指南

## 问题原因
出现"服务不可用"错误的原因是：开发服务器在电脑重启后不会自动启动。这是开发环境的正常行为，需要手动重新启动服务器。

## 解决方案

### ✅ 推荐启动方式

#### 方法1：PowerShell 一键启动（可靠）
```powershell
cd 'F:\AIgjz\Code\saasfly\apps\nextjs'
$env:NODE_ENV="development"; Get-Content ..\..\.env.local | ForEach-Object { if($_ -ne "" -and $_ -notmatch "^\s*#" -and $_ -match "^([^=]+)=(.*)$") { [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2]) } }; $env:NEXTAUTH_URL="http://localhost:3000"; $env:NEXT_PUBLIC_APP_URL="http://localhost:3000"; npx next dev -p 3000
```

#### 方法2：双击脚本启动（简便）
- 双击 `start-dev.bat`
- 该脚本会自动加载 `.env.local` 并修正必需的地址

#### 方法3：使用 Bun（可选）
```bash
cd F:\AIgjz\Code\saasfly
bun run dev
```

### 清理说明
- 已移除旧脚本：`restart-after-sleep.bat`、`QUICK_START_FIXED.bat`
- 保留并修复：`start-dev.bat`

## 预防措施

### 针对不同情况的建议

#### 💤 对于电脑睡眠/休眠
- **睡眠后**：务必使用 `restart-after-sleep.bat` 脚本
- **创建桌面快捷方式**：为两个脚本都创建桌面快捷方式
- **记住顺序**：睡眠后 → 用restart脚本，正常重启 → 用start脚本

#### 🔄 对于日常开发
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