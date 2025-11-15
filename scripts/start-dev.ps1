Param()
$ErrorActionPreference = 'Stop'

$root = 'F:\AIgjz\Code\saasfly'
$nextDir = Join-Path $root 'apps\nextjs'

$env:NODE_ENV = 'development'

$envFile = Join-Path $root '.env.local'
Get-Content $envFile | ForEach-Object {
  $line = $_.Trim()
  if ($line -eq '' -or $line -match '^\s*#') { return }
  $kv = $line.Split('=',2)
  if ($kv.Length -eq 2) {
    $key = $kv[0].Trim()
    $val = $kv[1].Trim()
    $val = $val.Trim("'").Trim('"')
    [System.Environment]::SetEnvironmentVariable($key, $val, 'Process')
  }
}

$env:NEXTAUTH_URL = 'http://localhost:3000'
$env:NEXT_PUBLIC_APP_URL = 'http://localhost:3000'

Set-Location $nextDir
npx next dev -p 3000