function off {
  timeout /t 5
  $null = shutdown /s
}

off
