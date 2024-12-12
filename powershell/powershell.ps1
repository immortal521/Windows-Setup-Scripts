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
$settingFileUrl = "https://example.com/settings.xml"  # 替换为实际的 URL
