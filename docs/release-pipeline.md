# Release Pipeline

## Goal

Blank releases must be repeatable, signed, testable, and tied to a Chromium
upstream revision.

## Versioning

Product versions:

```txt
Blank 0.1.0-alpha
Blank 0.2.0-alpha
Blank 0.5.0-beta
Blank 1.0.0
```

Installer code:

```txt
BlankBrowserSetup-BLK010.exe
```

The installer code is not the same as product version.

## Release Steps

1. choose Chromium upstream revision.
2. sync source.
3. apply Blank patches.
4. generate build config.
5. build browser.
6. run unit/smoke tests.
7. build installer.
8. sign binaries and installer.
9. publish artifacts.
10. update release manifest.
11. verify clean install.
12. verify update from previous release.
13. archive metadata.

## Required Metadata

Store per release:

- Blank version.
- installer code.
- channel.
- Chromium revision/version.
- Blank patch commit.
- GN args.
- build machine/toolchain version.
- artifact hashes.
- signing cert id.
- test results.
- release notes.
- rollback decision.

## Artifact Naming

```txt
BlankBrowserSetup-BLK010.exe
BlankBrowserSetup-BLK010.exe.sha256
BlankBrowserSetup-BLK010.manifest.json
```

## Smoke Tests

Minimum:

- app launches.
- new tab opens.
- HTTPS page loads.
- HTTP page loads.
- downloads work.
- bookmarks create/edit/delete.
- settings opens.
- adblock test page blocks known request.
- per-site adblock disable works.
- third-party cookie default verified.
- import flow visible.
- installer uninstall removes expected files.
- updater check does not leak browsing data.

## Release Gates

Public release requires:

- signed installer.
- signed browser binaries.
- update path verified.
- security update process documented.
- privacy defaults tested.
- license notices complete.
- known issues documented.

Local development builds can skip signing only when they are never distributed.
