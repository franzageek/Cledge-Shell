param ($item)
if (-not $item) {
  if ($args.length > 1) { $item = $args[1] }
  else {
    Write-Error 'Provide an argument.'
    throw
  }
}

function £($item) {
  $ItemType = $item.GetType().Name
  $ModulePath = "$($env:path.TrimEnd('\').TrimEnd('/'))\$($item.TrimEnd('.ps1')).ps1"
  
  $result = $null
  switch ($true) {
    Test-Path $item {
      Set-Location $item
      $result = $pwd
    }
    Test-Path $ModulePath {
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

return £ $item
