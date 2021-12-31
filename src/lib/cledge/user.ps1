param($user, $sign)
if (-not $user) { $user = $env:UserName }
switch ($sign) {
  on { Sign-In }
  off { Sign-Out }
  Default {}
}

function Sign-In($user = $user) {
  Write-Warning 'This feature is experimental and is not available on this version of Cledge Shell. Check back later…'
}

function Sign-Out($user = $user) {
  $null = logoff
}
