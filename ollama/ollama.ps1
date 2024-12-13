if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop 未安装。$($_.Exception.Message)"
}

Write-Host "正在通过 Scoop 安装 ollama..." -ForegroundColor Cyan

scoop install ollama-full

ollama run qwen2.5-coder
