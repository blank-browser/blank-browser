# Windows Chromium Build

This page describes the public-safe shape of the local Windows build process.
Use upstream Chromium documentation as the source of truth for prerequisites.

## Layout

Keep the Chromium checkout outside this repo:

```txt
<blank-browser-repo>
<chromium-src>
<chromium-src>\out\Default
```

## Build Flow

From the Chromium source checkout:

```powershell
gn gen out\Default
autoninja -C out\Default chrome
autoninja -C out\Default mini_installer
```

For local iteration, prefer incremental builds. Do not delete existing outputs
or run clean builds unless there is a specific reason.

## Launch

Use a separate user data directory for prototype runs:

```powershell
.\out\Default\chrome.exe --user-data-dir=<blank-user-data-dir>
```

## Installer

The Chromium `mini_installer` output is wrapped by this repo's Windows installer
script:

```txt
packaging/windows-wizard.iss
```

See [installer-build.md](installer-build.md).

## Performance Note

Debug/component builds are useful for iteration but can feel slow. Create a
separate optimized output directory for daily browser testing.
