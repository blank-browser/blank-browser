# Build Status

Last updated: 2026-06-19.

## Prototype State

Blank Browser has a local Windows prototype based on Chromium. The current
development build verifies these metadata fields on the main browser binaries:

```txt
ProductName: Blank Browser
FileDescription: Blank Browser
CompanyName: Blank Browser
```

## Patch Queue

Current branding patch snapshots:

```txt
patches/branding/001-blank-product-identity.patch
patches/branding/002-blank-basic-icons.patch
patches/branding/003-updated-logo-square-tabs.patch
patches/branding/004-blank-shell-colors.patch
```

## Build Type

The current development output is optimized for incremental iteration, not
daily-use performance. A release-like output should be created separately for
performance testing.

## Installer Artifact

Current local installer name:

```txt
BlankBrowserSetup-BLK010.exe
```

Current hash:

```txt
SHA256: 4C78427E2DB7ABC4FFB1F3A580DDB9B3327370DF89F830E4FA01C4C74F23706C
```

Installer binaries are intentionally not tracked in git.

## Known Limitations

- runtime executable is still Chromium's upstream target name.
- install/uninstall identity still needs a full Windows pass.
- signing and update infrastructure are not implemented.
- first-run/new-tab experience is not final.
