[CmdletBinding()]
param(
    [string]$Source = "blanklogo.png",
    [string]$OutDir = "branding\exported"
)

$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Drawing

$sourcePath = Resolve-Path -LiteralPath $Source
$root = Resolve-Path "."
$outRoot = Join-Path $root $OutDir
$pngDir = Join-Path $outRoot "png"
$tileDir = Join-Path $outRoot "tiles"
$winDir = Join-Path $outRoot "win"

New-Item -ItemType Directory -Force -Path $pngDir, $tileDir, $winDir | Out-Null

$logo = [System.Drawing.Image]::FromFile($sourcePath)
$generated = New-Object System.Collections.Generic.List[object]

function Save-Png($image, [string]$path) {
    $image.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
}

function New-Canvas([int]$size, [System.Drawing.Color]$background) {
    $bitmap = [System.Drawing.Bitmap]::new(
        $size,
        $size,
        [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.InterpolationMode =
        [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.Clear($background)
    return @($bitmap, $graphics)
}

function Add-ManifestEntry([string]$path) {
    $item = Get-Item -LiteralPath $path
    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $path
    $relative = Resolve-Path -LiteralPath $path -Relative
    $generated.Add([PSCustomObject]@{
        path = ($relative.TrimStart(".\") -replace "\\", "/")
        bytes = $item.Length
        sha256 = $hash.Hash
    })
}

$sizes = @(16, 24, 32, 48, 64, 128, 256, 512, 1024)
foreach ($size in $sizes) {
    $path = Join-Path $pngDir "blank-browser-$size.png"
    $bitmap = [System.Drawing.Bitmap]::new($logo, $size, $size)
    Save-Png $bitmap $path
    $bitmap.Dispose()
    Add-ManifestEntry $path
}

foreach ($variant in @(
    @{ name = "light"; bg = [System.Drawing.Color]::FromArgb(235, 243, 255) },
    @{ name = "dark"; bg = [System.Drawing.Color]::FromArgb(6, 12, 22) }
)) {
    $canvas = New-Canvas 256 $variant.bg
    $bitmap = $canvas[0]
    $graphics = $canvas[1]
    $graphics.DrawImage($logo, 32, 32, 192, 192)
    $path = Join-Path $pngDir "blank-browser-$($variant.name)-256.png"
    Save-Png $bitmap $path
    $graphics.Dispose()
    $bitmap.Dispose()
    Add-ManifestEntry $path
}

foreach ($tile in @(
    @{ name = "blank-browser-tile-small-44.png"; size = 44; logo = 32 },
    @{ name = "blank-browser-tile-150.png"; size = 150; logo = 108 }
)) {
    $canvas = New-Canvas $tile.size ([System.Drawing.Color]::FromArgb(235, 243, 255))
    $bitmap = $canvas[0]
    $graphics = $canvas[1]
    $xy = [int](($tile.size - $tile.logo) / 2)
    $graphics.DrawImage($logo, $xy, $xy, $tile.logo, $tile.logo)
    $path = Join-Path $tileDir $tile.name
    Save-Png $bitmap $path
    $graphics.Dispose()
    $bitmap.Dispose()
    Add-ManifestEntry $path
}

$iconSource = "branding\generated\blank-installer.ico"
if (Test-Path -LiteralPath $iconSource) {
    foreach ($name in @("blank-browser.ico", "blank-browser-installer.ico")) {
        $path = Join-Path $winDir $name
        Copy-Item -LiteralPath $iconSource -Destination $path -Force
        Add-ManifestEntry $path
    }
}

$manifest = [PSCustomObject]@{
    source = "blanklogo.png"
    generated = (Get-Date).ToString("o")
    assets = $generated
}

$manifestPath = Join-Path $outRoot "asset-manifest.json"
$manifest | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 $manifestPath

$logo.Dispose()
Write-Host "Exported $($generated.Count) Blank assets to $outRoot"
