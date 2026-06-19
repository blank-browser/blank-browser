# Blank Browser

Blank Browser is a minimal Chromium-based browser focused on a clean interface,
privacy-conscious defaults, and a calm browsing experience.

This repository contains the product documentation, branding assets, packaging
scripts, and local build notes for the Windows prototype. It does not contain a
marketing website or landing page.

## Current Status

Blank Browser currently has a local Windows prototype with:

- Blank Browser product name in Windows binary metadata.
- Blank-branded app icon and installer icon.
- a visible Windows setup wizard.
- a first pass of custom browser chrome: square tabs, dark toolbar, dark
  omnibox, and blue Blank accents.
- generated brand assets for Windows packaging and product docs.

The prototype still uses Chromium's upstream executable target internally. A
clean executable rename and full Windows app identity pass are planned before a
public alpha.

## Repository Layout

```txt
branding/             Source logo, generated app assets, installer art
build/                Generic build workspace notes
docs/                 Product, build, packaging, and release docs
packaging/windows/    Windows packaging notes
patches/              Chromium patch queue snapshots
scripts/              Local helper scripts
research/             Public prior-art notes
```

## Useful Docs

- [Build status](docs/build-status.md)
- [Branding patch](docs/branding-patch.md)
- [Assets](docs/assets.md)
- [Installer build](docs/installer-build.md)
- [Browser architecture](docs/browser-architecture.md)
- [Privacy engine](docs/privacy-engine.md)
- [Adblock engine](docs/adblock-engine.md)
- [Bookmark sync](docs/bookmark-sync.md)
- [Installer strategy](docs/installer-strategy.md)
- [Update strategy](docs/update-strategy.md)
- [Release pipeline](docs/release-pipeline.md)
- [Security model](docs/security-model.md)
- [Testing strategy](docs/testing-strategy.md)
- [Next steps](docs/next-steps.md)

## Brand Assets

The current source logo is:

```txt
blanklogo.png
```

Generated assets live under:

```txt
branding/exported/
branding/generated/
```

See [docs/assets.md](docs/assets.md) for the asset list.

## Non-Goals

Blank Browser does not aim to add ads, sponsored tiles, crypto rewards, wallet
features, forced AI, forced accounts, invasive telemetry, hidden affiliate
behavior, or homepage clutter.
