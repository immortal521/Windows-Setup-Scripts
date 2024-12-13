# ����·��
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
$tempHostsPath = "$env:Temp\hosts"

# ���� GitHub DNS ������¼
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

# ��ȡ hosts ����
$hostsContent = Get-Content $hostsPath

# ����Ƿ��Ѵ��� GitHub DNS
if ($hostsContent -notcontains "# GitHub DNS Start") {
    # ������ʱ�ļ�
    $updatedContent = $hostsContent + "`r`n" + $githubDNS
    $updatedContent | Set-Content -Path $tempHostsPath -Encoding UTF8

    # ʹ�ù���ԱȨ�޸��� hosts �ļ�
    Start-Process -FilePath "powershell" -ArgumentList "-Command `"Copy-Item -Path '$tempHostsPath' -Destination '$hostsPath' -Force`"" -Verb RunAs
    Write-Host "�ѳɹ����� hosts �ļ���" -ForegroundColor Green
} else {
    Write-Host "hosts �ļ����Ѱ��� GitHub DNS�������ظ�д�롣" -ForegroundColor Yellow
}

# ˢ�� DNS ����
try {
    ipconfig /flushdns | Out-Null
    Write-Host "DNS ������ˢ�¡�" -ForegroundColor Green
} catch {
    Write-Host "ˢ�� DNS ����ʧ�ܣ����ֶ����� 'ipconfig /flushdns'��" -ForegroundColor Red
}

$scriotUrls = @(
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/scoop/scoop.ps1",
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/powershell/powershell.ps1",
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/nodejs/nodejs.ps1"
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/nvim/nvim.ps1",
  "https://raw.githubusercontent.com/immortal521/Windows-Setup-Scripts/refs/heads/main/maven/maven.ps1"
)

foreach ($url in $scriotUrls) {
  try {
    Write-Host "����ִ�нű�: $url" -ForegroundColor Cyan
      iwr -useb $url | iex
    }
  catch {
    Write-Host $_ -ForegroundColor Red
  }
}
