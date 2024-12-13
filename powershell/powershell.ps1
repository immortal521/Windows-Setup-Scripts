$modules = @(
  "NuGet",
  "PSReadLine",
  "posh-git"
)

foreach ($module in $modules) {
    if (-not (Get-InstalledModule -Name $module -ErrorAction SilentlyContinue)) {
        Install-Module -Name $module -Force -Scope CurrentUser
        Write-Host "$module ģ���ѳɹ���װ��" -ForegroundColor Green
    } else {
        Write-Host "$module ģ���Ѱ�װ��" -ForegroundColor Yellow
    }
}

$destinationPath = $env:USERPROFILE + "\Documents\WindowsPowerShellMicrosoft.PowerShell_profile.ps1"
$settingFileUrl = "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/powershell/Microsoft.PowerShell_profile.ps1"  # �滻Ϊʵ�ʵ� URL

if (-not (Test-Path $destinationPath)) {
      New-Item -ItemType Directory -Path $destinationPath -Force
      Write-Host "Ŀ��Ŀ¼�Ѵ�����$destinationPath" -ForegroundColor Green
}

Invoke-WebRequest -Uri $settingFileUrl -OutFile $destinationPath
Write-Host "�����ļ������ص���$destinationPath" -ForegroundColor Green
