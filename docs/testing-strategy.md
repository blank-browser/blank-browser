# Testing Strategy

## Goal

Testing must prove that Blank launches, browses, preserves Chromium security
behavior, applies privacy defaults, blocks expected requests, installs cleanly,
updates safely, and uninstalls cleanly.

## Test Layers

### Chromium Tests

Run relevant upstream tests after touching shared behavior.

Initial targets to investigate:

- `unit_tests`
- `browser_tests`
- `components_unittests`
- network-related tests when privacy/adblock patches land.

### Blank Smoke Tests

Minimum per build:

- launch browser.
- open new tab.
- navigate to HTTPS site.
- navigate to HTTP site.
- open settings.
- create bookmark.
- import bookmarks visible.
- download file.
- clear browsing data.
- adblock known test request.
- disable adblock per site.

### Installer Tests

- clean install.
- install over same version.
- install over older version.
- uninstall.
- shortcut creation.
- launch after install.
- default browser prompt behavior.
- per-user install path.
- no unexpected leftover data after uninstall, except user profile if policy says keep it.

### Update Tests

- no update available.
- update available.
- failed download.
- bad hash.
- bad signature.
- rollback.
- channel mismatch.
- update from Beta to Beta, Stable to Stable only.

### Privacy Tests

- telemetry endpoints absent or disabled.
- third-party cookie behavior.
- known tracker blocked.
- site exception works.
- Burner session clears cookies/storage.
- sync does not upload raw bookmark URLs/titles.

## First Automation Plan

1. create manual smoke checklist.
2. automate launch/navigation using Chromium test harness where possible.
3. add installer PowerShell smoke script.
4. add update mock server tests.
5. require smoke pass before release manifest update.

## Manual Checklist Location

Future file:

```txt
testing/smoke-windows.md
```

Do not create broad automation before the first Chromium build works.

