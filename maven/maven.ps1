# ��� Scoop �Ƿ��Ѱ�װ
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop δ��װ��$($_.Exception.Message)"
}

Write-Host "����ͨ�� Scoop ��װ Maven..." -ForegroundColor Cyan
scoop install maven
$repoDir = $env:USERPROFILE + "\.repo\maven"

mkdir $repoDir

$configDir = "C:\Apps\scoop\apps\maven\current\conf\setting.xml"
$settingFileUrl = "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/maven/setting.xml"

if (Test-Path $settingsDestPath) {
      Write-Host "Maven �����ļ��Ѵ��ڣ����ڸ���..." -ForegroundColor Yellow
}

Invoke-WebRequest -Uri $settingFileUrl -OutFile $configDir

Write-Host "Maven ������ɣ�settings.xml ��Ӧ�á�" -ForegroundColor Green
