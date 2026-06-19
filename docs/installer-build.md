# Installer Build

## Outputs

Current user-facing installer name:

```txt
BlankBrowserSetup-BLK010.exe
```

Raw development installer copy:

```txt
BlankBrowserMiniInstaller-v1.0.exe
```

The BLK010 setup file shows a visible Inno Setup wizard, then runs Chromium's
mini installer underneath. The raw mini installer remains silent by design.

## Inputs

Expected local inputs:

```txt
<chromium-src>\out\Default\mini_installer.exe
packaging\windows-wizard.iss
branding\generated\blank-installer.ico
branding\generated\wizard-image.bmp
branding\generated\wizard-small.bmp
```

## Build Commands

Use an existing incremental Chromium output:

```powershell
cd <chromium-src>
autoninja -C out\Default chrome
autoninja -C out\Default mini_installer
```

Copy the raw mini installer into this repo's ignored `dist/` folder:

```powershell
cd <blank-browser-repo>
Copy-Item <chromium-src>\out\Default\mini_installer.exe `
  .\dist\BlankBrowserMiniInstaller-v1.0.exe -Force
```

Compile the visible installer wrapper:

```powershell
& "$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe" `
  .\packaging\windows-wizard.iss
```

Create the BLK010 named output:

```powershell
Copy-Item .\dist\BlankBrowserSetup-v1.0.exe `
  .\dist\BlankBrowserSetup-BLK010.exe -Force
Get-FileHash -Algorithm SHA256 .\dist\BlankBrowserSetup-BLK010.exe
```

## Current Hash

```txt
BlankBrowserSetup-BLK010.exe
SHA256: 4C78427E2DB7ABC4FFB1F3A580DDB9B3327370DF89F830E4FA01C4C74F23706C
```

## Installer Scope

Done:

- visible setup wizard.
- Spanish wizard text.
- Blank Browser setup name.
- Blank installer icon.
- Blank wizard image without black transparency artifacts.
- raw mini installer wrapped without changing Chromium installer internals.

Pending:

- full uninstall behavior review.
- final install directory and registry identity.
- clean executable target identity.
- signing.
- auto-update.
- default browser prompt review.
