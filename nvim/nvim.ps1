# 检查 Scoop 是否已安装
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop 未安装。$($_.Exception.Message)"
}

Write-Host "正在通过 Scoop 安装 nvim neovide..." -ForegroundColor Cyan

scoop install neovim neovide

git clone https://github.com/immortal521/nvim.git $env:LOCALAPPDATA\nvim
