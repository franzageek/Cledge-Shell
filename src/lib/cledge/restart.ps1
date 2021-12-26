function restart {
  timeout /t 3
  $null = shutdown /r
}

restart
