# 检查 Scoop 是否已安装
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop 未安装。$($_.Exception.Message)"
}

Write-Host "正在通过 Scoop 安装 Maven..." -ForegroundColor Cyan
scoop install maven
$repoDir = $env:USERPROFILE + "\.repo\maven"

mkdir $repoDir

$configDir = "C:\Apps\scoop\apps\maven\current\conf\setting.xml"
$settingFileUrl = "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/maven/setting.xml"

if (Test-Path $settingsDestPath) {
    Write-Host "Maven 配置文件已存在，正在覆盖..." -ForegroundColor Yellow
}

Invoke-WebRequest -Uri $settingFileUrl -OutFile $configDir

Write-Host "Maven 配置完成，settings.xml 已应用。" -ForegroundColor Green
