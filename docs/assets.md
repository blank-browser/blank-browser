# Assets

## Source

Master logo source:

```txt
blanklogo.png
SHA256: 2425473B969B5E00BB50C30E068980556BC25B17E34449463E28A67FC5980758
```

The current master is a transparent 2000x2000 PNG.

## Exported Asset Kit

Generated assets live under:

```txt
branding/exported/
```

Manifest:

```txt
branding/exported/asset-manifest.json
```

Included exports:

- app PNGs: 16, 24, 32, 48, 64, 128, 256, 512, 1024.
- light and dark 256 logo previews.
- Windows `.ico`.
- installer `.ico`.
- Windows tile PNGs: 44 and 150.

Installer-specific generated assets live under:

```txt
branding/generated/
```

Included:

- `blank-installer.ico`
- `wizard-image.bmp`
- `wizard-small.bmp`
- `wizard-small.png`

`wizard-image.bmp` and `wizard-small.bmp` composite the transparent logo on a
light background. This avoids black transparency artifacts in Inno Setup.

## Chromium Resource Targets

The asset set maps into these Chromium areas:

```txt
chrome/app/theme/chromium/
chrome/app/theme/chromium/win/
chrome/app/theme/chromium/win/tiles/
chrome/app/theme/default_100_percent/chromium/
chrome/app/theme/default_200_percent/chromium/
```

## Missing Later

- signed final Windows icon set after publisher identity is chosen.
- high-quality installer hero/wizard art with final brand typography.
- first-run/new-tab product art if Blank gets its own local page.
- store/release images if public distribution starts.
