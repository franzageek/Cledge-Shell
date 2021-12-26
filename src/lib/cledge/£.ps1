param ($item)
if (-not $item) {
  if ($args.length -lt 1) { $item = $args[1] }
  else {
    Write-Error 'Provide an argument.'
    throw
  }
}

function £($item = $item) {
  $ItemType = $item.GetType().Name
  $ModulePath = "$($env:path.TrimEnd('\').TrimEnd('/'))\$($item.TrimEnd('.ps1')).ps1"
  
  $result = $null
  switch ($true) {
    Test-Path $item {
      Set-Location $item
      $result = $pwd
    }
    Test-Path $item -PathType Leaf {
      $result = Get-Content $item
    }
    Test-Path $ModulePath -PathType Leaf {
      $result = Invoke-Expression -Command $ModulePath
    }
    ($ItemType -eq string) {
      try { $result = [int]$item }
      catch { $result = $item }
    }
    ($ItemType -in int, Int32, Int64) {
      try { $result = [string]$item }
      catch { $result = $item }
    }
    ($item.StartsWith('http://')) || ($item.StartsWith('https://')) {
      $result = Invoke-RestMethod $item
    }
  }
  
  return $result
}

return £
