# ��� Scoop �Ƿ��Ѱ�װ
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop δ��װ��$($_.Exception.Message)"
}

Write-Host "����ͨ�� Scoop ��װ nvim neovide..." -ForegroundColor Cyan

scoop install neovim neovide

git clone https://github.com/immortal521/nvim.git $env:LOCALAPPDATA\nvim
