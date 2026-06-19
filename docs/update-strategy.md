# Update Strategy

## Rule

Do not ship a public browser without a security update plan.

A private browser that falls behind Chromium security updates is not safe.

## Channels

Initial channels:

- Nightly.
- Beta.
- Stable.

Each channel needs:

- separate app id.
- separate update feed.
- separate install path or channel marker.
- separate version policy.
- rollback rules.

## Recommended Direction

Use an Omaha-style update protocol or Chromium updater-compatible flow.

Chromium updater docs state that the updater communicates with update servers
using the Omaha Protocol and platform-native network stacks such as WinHTTP on
Windows.

Source:

- https://chromium.googlesource.com/chromium/src/+/HEAD/docs/updater/functional_spec.md
- https://chromium.googlesource.com/chromium/src/+/HEAD/docs/updater/protocol_3_1.md

## Update Flow

```txt
Blank installed
  -> scheduled/background update check
  -> update manifest request
  -> signed package download
  -> signature/hash verification
  -> install/update transaction
  -> version registry updated
  -> relaunch prompt if needed
```

## Required Security Properties

- signed binaries.
- signed installer/update packages.
- TLS.
- package hash validation.
- rollback protection.
- staged rollout support.
- update failure reporting without browsing telemetry.
- server-side kill switch for bad release.
- reproducible release metadata.

## Manifest Fields

Minimum:

```json
{
  "appId": "blank-stable-guid",
  "channel": "stable",
  "version": "0.1.0-alpha",
  "installerCode": "BLK010",
  "platform": "win-x64",
  "url": "https://updates.example.invalid/BlankBrowserSetup-BLK010.exe",
  "sha256": "hex",
  "size": 0,
  "signature": "base64",
  "minUpdaterVersion": "0.1.0"
}
```

## Privacy Position

Updater must not send browsing history, open tabs, URLs, search terms, or page
content.

Allowed minimal data:

- app id.
- current version.
- channel.
- OS/platform.
- installer/update result code.
- randomized cohort if needed for rollout.

Document every field.

## MVP Plan

1. Decide updater base after `mini_installer` investigation.
2. Create channel GUID/app-id plan.
3. Create signed manifest format.
4. Build local update server mock.
5. Install `0.1.0-alpha`.
6. Update to `0.1.1-alpha`.
7. Verify rollback/failed update behavior.

