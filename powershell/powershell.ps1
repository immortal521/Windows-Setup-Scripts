$modules = @(
  "NuGet",
  "PSReadLine",
  "posh-git"
)

foreach ($module in $modules) {
    if (-not (Get-InstalledModule -Name $module -ErrorAction SilentlyContinue)) {
        Install-Module -Name $module -Force -Scope CurrentUser
        Write-Host "$module 模块已成功安装。" -ForegroundColor Green
    } else {
        Write-Host "$module 模块已安装。" -ForegroundColor Yellow
    }
}

$destinationPath = $env:USERPROFILE + "\Documents\WindowsPowerShellMicrosoft.PowerShell_profile.ps1"
$settingFileUrl = "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/powershell/Microsoft.PowerShell_profile.ps1"  # 替换为实际的 URL

if (-not (Test-Path $destinationPath)) {
      New-Item -ItemType Directory -Path $destinationPath -Force
      Write-Host "目标目录已创建：$destinationPath" -ForegroundColor Green
}

Invoke-WebRequest -Uri $settingFileUrl -OutFile $destinationPath
Write-Host "设置文件已下载到：$destinationPath" -ForegroundColor Green
