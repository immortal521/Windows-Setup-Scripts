if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop δ��װ��$($_.Exception.Message)"
}

Write-Host "����ͨ�� Scoop ��װ ollama..." -ForegroundColor Cyan

scoop install ollama-full

ollama run qwen2.5-coder
