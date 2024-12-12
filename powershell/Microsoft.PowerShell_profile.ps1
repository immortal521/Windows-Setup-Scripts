# 修改powershell编码
# chcp 65001

# 去除 Window PowerShell 版权所有提示
Clear-Host

# 去除 curl 别名
Remove-Item Alias:curl -ErrorAction SilentlyContinue


# Microsoft.PowerShell_profile.ps1

# 使用 vscode 打开 $PROFILE 配置文件
function vscodeOpen {
  Code $PROFILE
}

# 使用 nodepad++ 打开 $PROFILE 配置文件
function notepadOpen {
  noetepad $PROFILE
}

# 打开 windows termial 设置文件

function openTermialSetting {
  Code C:\Users\immort\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}


# 配置 oh-my-posh 主题方式一
# oh-my-posh init pwsh --config 'D:/OhMyPosh/themes/jandedobbeleer.omp.json' | Invoke-Expression

# 配置 oh-my-posh 主题方式二，远程方式
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json' | Invoke-Expression

# 配置 oh-my-posh 主题方式三，当前我使用的

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tokyo.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/easy-term.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/gmay.omp.json" | Invoke-Expression

# 导出 oh-my-posh 主题
# oh-my-posh config export --output D:/jandedobbeleer.omp.json

# 引入 ps-read-line
Import-Module PSReadLine

# 引入 posh-git
Import-Module posh-git

Invoke-Expression (& { (zoxide init powershell | Out-String) })
