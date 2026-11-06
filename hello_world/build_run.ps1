param(
    [ValidateSet("Debug", "Release", "Both")]
    [string]$Config = "Both",
    [switch]$NoRun
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

cmake -S . -B build
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$configs = if ($Config -eq "Both") { @("Debug", "Release") } else { @($Config) }

foreach ($c in $configs) {
    Write-Host "=== Build $c ===" -ForegroundColor Cyan
    cmake --build build --config $c
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    if (-not $NoRun) {
        Write-Host "=== Run $c ===" -ForegroundColor Green
        & ".\build\$c\hello.exe"
    }
}
