# ȷ�� PowerShell ��ִ�в����������нű�
try {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Write-Host "ִ�в���������Ϊ RemoteSigned��" -ForegroundColor Yellow
} catch {
    Write-Host "�޷�����ִ�в��ԣ����ֶ��޸ĺ��������нű���" -ForegroundColor Red
    exit 1
}

# ��װ Scoop
try {
    iwr -useb https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1 | iex
    Write-Host "Scoop ��װ�ɹ���" -ForegroundColor Green
} catch {
    throw "Scoop ��װʧ�ܣ������������ӻ�Ȩ�ޡ�$($_.Exception.Message)"
}

# Scoop Bucket �б�
$buckets = @(
  "main",
  "extras",
  "nerd-fonts",
  "java",
  "dorado https://github.com/chawyehsu/dorado",
  "ImmortBucket https://github.com/immortal521/ImmortBucket"
)

# ��� Scoop ����� bucket������ extras��
foreach ($bucket in $buckets) {
    try {
        scoop bucket add $bucket
        Write-Host "����� Scoop bucket: $bucket" -ForegroundColor Green
    } catch {
        throw "��� Scoop bucket $bucket ʧ�ܡ�$($_.Exception.Message)"
    }
}

try {
    scoop install git 7zip
    Write-Host "Git �Ѱ�װ�ɹ���" -ForegroundColor Green
} catch {
    throw "Git ��װʧ�ܣ������������ӻ�Ȩ�ޡ�$($_.Exception.Message)"
}

try {
    scoop install aria2
    Write-Host "Aria2 �Ѱ�װ�ɹ���" -ForegroundColor Green
} catch {
    throw "Aria2 ��װʧ�ܣ������������ӻ�Ȩ�ޡ�$($_.Exception.Message)"
}

try {
  scoop config aria2-enabled true
  scoop config aria2-spliy 8
  scoop config aria2-warning-enabled false
} catch {
  throw "���� aria2 ʧ�ܡ�$($_.Exception.Message)"
}

$softwareList = @(
  "bottom",
  "cmake",
  "curl",
  "dark",
  "fastfetch",
  "ffmpeg",
  "fzf",
  "gcc",
  "gdb",
  "gdu",
  "go",
  "gradle",
  "gzip",
  "innounp",
  "kitty",
  "lazygit",
  "lua",
  "luarocks",
  "minio",
  "minio-client",
  "msys2",
  "music-player",
  "nginx",
  "oh-my-posh",
  "oraclejdk",
  "protobuf",
  "psutils",
  "putty",
  "python",
  "redis",
  "resource-hacker",
  "ripgrep",
  "rustup",
  "sqlite",
  "sqlttespy",
  "tree-sitter",
  "vcpkg",
  "vscode",
  "zoxide"
)

foreach ($software in $softwareList) {
    try {
        scoop install $software
        Write-Host "$software ��װ�ɹ���" -ForegroundColor Green
    } catch {
        Write-Host "$software ��װʧ�ܡ�" -ForegroundColor Red
    }
}
