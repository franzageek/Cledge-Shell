param($name, $path)
if (-not $name) {
  if ($args.length -gt 1) { $name = args[1] }
  else {
    Write-Error 'Provide an argument.'
    throw
  }
}
if (-not $path) { $path = $pwd }

function makefolder($name = $name, $path = $path) {
  $FolderPath = "$($path.TrimEnd('\').TrimEnd('/'))\$($name)"
  mkdir $FolderPath
  Set-Location $FolderPath
  $result = $pwd
  
  return $result
}

return makefolder
