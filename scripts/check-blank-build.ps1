[CmdletBinding()]
param(
    [string]$OutDir = "C:\src\chromium\src\out\Default",
    [string]$ExpectedProductName = "Blank Browser"
)

$ErrorActionPreference = "Stop"

$exe = Join-Path $OutDir "chrome.exe"
$dll = Join-Path $OutDir "chrome.dll"

if (-not (Test-Path -LiteralPath $exe)) {
    throw "Missing build output: $exe"
}

if (-not (Test-Path -LiteralPath $dll)) {
    throw "Missing build output: $dll"
}

$targets = @($exe, $dll)
$rows = foreach ($target in $targets) {
    $item = Get-Item -LiteralPath $target
    $version = $item.VersionInfo

    [PSCustomObject]@{
        File = $item.Name
        ProductName = $version.ProductName
        FileDescription = $version.FileDescription
        CompanyName = $version.CompanyName
        FileVersion = $version.FileVersion
        LastWriteTime = $item.LastWriteTime
    }
}

$rows | Format-Table -AutoSize

$bad = $rows | Where-Object {
    $_.ProductName -ne $ExpectedProductName -or
    $_.FileDescription -ne $ExpectedProductName -or
    $_.CompanyName -ne $ExpectedProductName
}

if ($bad) {
    throw "Blank identity check failed. Expected ProductName/FileDescription/CompanyName: $ExpectedProductName"
}

Write-Host "OK: Blank build identity verified at $OutDir"
