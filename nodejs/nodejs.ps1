# 检查 Scoop 是否已安装
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    throw "Scoop 未安装。$($_.Exception.Message)"
}

Write-Host "正在通过 Scoop 安装 nodejs..." -ForegroundColor Cyan

scoop install nodejs

npm config set registry https://registry.npmmirror.com/

$npmPrefix = $env:USERPROFILE + "\.repo\npm\npm_global"
mkdir $npmPrefix

$npmCache = $env:USERPROFILE + "\.repo\npm\npm_cache"
mkdir $npmCache

if ($env:PATH -notlike "*$npmPrefix*") {
    $env:PATH = $npmPrefix + ";" + $env:PATH
    [System.Environment]::SetEnvironmentVariable('PATH', $env:PATH, [System.EnvironmentVariableTarget]::User)
    Write-Host "路径已添加到 PATH 环境变量中。"
} else {
    Write-Host "该路径已经存在于 PATH 环境变量中。"
}

npm i -g pnpm

$pnpmGlobal = $env:USERPROFILE + "\.repo\pnpm\pnpm_global"
mkdir $pnpmGlobal
$pnpmCache = $env:USERPROFILE + "\.repo\pnpm\pnpm_cache"
mkdir $pnpmCache
$pnpmState = $env:USERPROFILE + "\.repo\pnpm\pnpm_state"
mkdir $pnpmState
$pnpmStore = $env:USERPROFILE + "\.repo\pnpm\pnpm_store"
mkdir $pnpmStore

pnpm config set global-bin-dir $pnpmGlobal + "\bin"
pnpm config set global-dir $pnpmGlobal
pnpm config set store-dir $pnpmStore
pnpm config set cache-dir $pnpmCache
pnpm config ser state-dir $pnpmState

if ($env:PATH -notlike "*$pnpmGlobal*") {
      $env:PATH = $pnpmGlobal + ";" + $env:PATH
      [System.Environment]::SetEnvironmentVariable('PATH', $env:PATH, [System.EnvironmentVariableTarget]::User)
      Write-Host "路径已添加到 PATH 环境变量中。"
} else {
      Write-Host "该路径已经存在于 PATH 环境变量中。"
}

