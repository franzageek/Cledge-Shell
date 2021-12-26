param($path, $override)
if (-not $path) { $path = $env:path }
if (-not $override) { $override = $false }

function Install-ToPath($path = $path, $override = $false) {
  $InstallPath = "$($path.TrimEnd('\').TrimEnd('/'))/Cledge"
  
  if (-not Test-Path $InstallPath) {
    New-Item $InstallPath
    Copy-Item -Path cledge.ps1,lib -Destination $InstallPath
    Write-Host "Cledge was successfully installed to $($path)." -ForegroundColor Blue
    return $true
  } else {
    if (-not $override) {
      Write-Error "A Cledge installation already exists in $($path)." -RecommendedAction "Run .\installer.ps1 -override $true to override the installation."
    } else {
      Remove-Item $($path)
      Install-ToPath -path $path -override $true
    }
  }
}
