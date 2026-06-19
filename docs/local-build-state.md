# Local Build State

This file is a public-safe summary of the local prototype state. It intentionally
does not include personal machine names, usernames, private paths, or hardware
details.

## Current Prototype

The Windows prototype builds from a local Chromium checkout and produces:

```txt
chrome.exe
chrome.dll
mini_installer.exe
```

The current prototype reports Blank Browser in Windows version metadata for the
main browser binaries.

## Current Build Type

The fast incremental development build is still a debug/component-style output.
It is useful for iteration, but it can feel slow during normal browsing.

A faster daily-use build should be generated in a separate optimized output
directory instead of changing or cleaning the existing development output.

## Branding State

Completed:

- Blank Browser product metadata.
- Blank app icon and installer icon.
- Blank logo resources.
- Windows tile assets.
- visible setup wizard with Blank artwork.
- first custom shell pass: square tabs, dark toolbar/omnibox, blue accents.

Pending:

- clean `blank.exe` executable identity.
- final Windows AppUserModelID, registry keys, shortcuts, protocol handlers,
  file associations, and uninstall identity.
- final signing and update identity.
- first-run/new-tab product surface.

## Installer State

The user-facing installer is produced as:

```txt
BlankBrowserSetup-BLK010.exe
```

The raw Chromium mini installer remains useful for development and wrapper
testing, but it is silent by design.

## Rebuild Rule

Do not delete existing build outputs or run clean builds unless needed. Prefer
incremental builds and document any build configuration change before using it.
