# Cledge Shell v1.9
# © 2021, SwiftDevLabs Open Source

if ($args.length -gt 1) {
  for ($arg -in $args) {
    Invoke-Expression -Command $arg
  }
} else {
  $arg = Read-Host 'Write a command'
  while (-not $arg -eq '') {
    Invoke-Expression -Command $arg
  }
}
