$ErrorActionPreference = "Stop"

$env:APAROKSHA_FRAMEWORK = if ($env:APAROKSHA_FRAMEWORK) { $env:APAROKSHA_FRAMEWORK } else { "WINUI" }

swift build -c release

$arch = $env:PROCESSOR_ARCHITECTURE
if (-not $arch) {
    $arch = "unknown"
}

$outDir = Join-Path "dist/windows" $arch.ToLowerInvariant()
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
Copy-Item ".build\release\AparokshaStarter.exe" (Join-Path $outDir "AparokshaStarter.exe") -Force

Write-Host "Built $(Join-Path $outDir 'AparokshaStarter.exe')"
