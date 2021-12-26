param($path)
if (-not $path) { $path = $pwd }

function Open-Explorer($path = $path) {
  explorer $path
}

Open-Explorer
