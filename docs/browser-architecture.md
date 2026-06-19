# Browser Architecture

Blank Browser is a Chromium-based browser with a narrow product layer on top of
upstream browser code.

## Architecture Shape

```txt
Chromium
  -> Blank patch queue
  -> Blank assets and product identity
  -> Blank privacy defaults
  -> Blank packaging and update identity
```

## Patch Layer

Blank-specific changes should be grouped by area:

```txt
patches/branding/
patches/privacy/
patches/adblock/
patches/sync/
patches/installer/
patches/updater/
```

Each patch should explain what user-visible behavior it changes and why the
change cannot be handled through configuration alone.

## Product Identity

The Windows prototype currently covers product metadata, icon resources,
installer artwork, and a first visual pass for tabs and toolbar colors.

Final Windows identity still needs dedicated work:

- executable name.
- install directory.
- AppUserModelID.
- registry keys.
- shortcuts.
- file associations.
- protocol handlers.
- uninstall identity.

## Privacy Layer

Privacy defaults should be understandable, reversible, and honest. Blank should
not claim privacy properties it cannot enforce.

## Ad/Tracker Blocking Layer

Ad and tracker blocking should be integrated in the browser in a way that avoids
large performance regressions and remains compatible with normal browsing.

## Sync Layer

Blank Sync, if implemented, should be independent from Chrome Sync and designed
around encrypted user data.

## Release Layer

Release builds need repeatable build inputs, artifact hashes, signing, updater
identity, and smoke tests before public distribution.
