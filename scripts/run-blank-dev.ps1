[CmdletBinding()]
param(
    [string]$OutDir = "C:\src\chromium\src\out\Default",
    [string]$ProfileDir = "C:\src\chromium-user-data\blank-dev",
    [string[]]$Url = @("about:blank"),
    [switch]$Wait
)

$ErrorActionPreference = "Stop"

$exe = Join-Path $OutDir "chrome.exe"

if (-not (Test-Path -LiteralPath $exe)) {
    throw "Missing build output: $exe"
}

New-Item -ItemType Directory -Force -Path $ProfileDir | Out-Null

$args = @(
    "--no-first-run",
    "--disable-sync",
    "--user-data-dir=$ProfileDir"
) + $Url

Write-Host "Launching Blank from $exe"
Write-Host "Profile: $ProfileDir"

$process = Start-Process -FilePath $exe -ArgumentList $args -PassThru
Write-Host "PID: $($process.Id)"

if ($Wait) {
    Wait-Process -Id $process.Id
}
