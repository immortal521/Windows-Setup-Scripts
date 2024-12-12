# 定义 hosts 文件路径
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

# 定义 GitHub DNS 解析记录（可以根据需要更新）
$githubDNS = @"
# GitHub DNS Start
140.82.113.4    github.com
185.199.108.153 assets-cdn.github.com
185.199.109.153 assets-cdn.github.com
185.199.110.153 assets-cdn.github.com
185.199.111.153 assets-cdn.github.com
140.82.113.10   api.github.com
185.199.108.133    raw.githubusercontent.com
185.199.109.133    raw.githubusercontent.com
185.199.110.133    raw.githubusercontent.com
185.199.111.133    raw.githubusercontent.com
# GitHub DNS End
"@

# 检查并写入 GitHub DNS 到 hosts 文件
if (-not (Get-Content $hostsPath | Select-String -Pattern "GitHub DNS Start")) {
    try {
        Add-Content -Path $hostsPath -Value $githubDNS
        Write-Host "已成功将 GitHub DNS 写入 hosts 文件。" -ForegroundColor Green
    } catch {
        Write-Host "写入 GitHub DNS 失败，请以管理员权限运行脚本。" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "hosts 文件中已包含 GitHub DNS，无需重复写入。" -ForegroundColor Yellow
}

# 刷新 DNS 缓存
try {
    ipconfig /flushdns | Out-Null
    Write-Host "DNS 缓存已刷新。" -ForegroundColor Green
} catch {
    Write-Host "刷新 DNS 缓存失败，请手动运行 'ipconfig /flushdns'。" -ForegroundColor Red
}

$scriotUrls = @(
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/scoop/scoop.ps1",
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/maven/maven.ps1",
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/nvim/nvim.ps1"
)

foreach ($url in $scriotUrls) {
  try {
    Write-Host "正在执行脚本: $url" -ForegroundColor Cyan
      iwr -useb $url | iex
    }
  catch {
    Write-Host $_ -ForegroundColor Red
  }
}
