# 安装 Scoop
try {
    iwr -useb get.scoop.sh | iex
    Write-Host "Scoop 安装成功。" -ForegroundColor Green
} catch {
    throw "Scoop 安装失败，请检查网络连接或权限。$($_.Exception.Message)"
}

# Scoop Bucket 列表
$buckets = @(
  "main",
  "extras",
  "nerd-fonts",
  "java",
  "dorado https://github.com/chawyehsu/dorado",
  "ImmortBucket https://github.com/immortal521/ImmortBucket"
)

# 添加 Scoop 额外的 bucket（例如 extras）
foreach ($bucket in $buckets) {
    try {
        scoop bucket add $bucket
        Write-Host "已添加 Scoop bucket: $bucket" -ForegroundColor Green
    } catch {
        throw "添加 Scoop bucket $bucket 失败。$($_.Exception.Message)"
    }
}

try {
    scoop install git
    Write-Host "Git 已安装成功。" -ForegroundColor Green
} catch {
    throw "Git 安装失败，请检查网络连接或权限。$($_.Exception.Message)"
}

try {
    scoop install aria2
    Write-Host "Aria2 已安装成功。" -ForegroundColor Green
} catch {
    throw "Aria2 安装失败，请检查网络连接或权限。$($_.Exception.Message)"
}

try {
  scoop config aria2-enabled true
  scoop config aria2-spliy 8
  scoop config aria2-warning-enabled false
} catch {
  throw "配置 aria2 失败。$($_.Exception.Message)"
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
        Write-Host "$software 安装成功。" -ForegroundColor Green
    } catch {
        Write-Host "$software 安装失败。" -ForegroundColor Red
    }
}