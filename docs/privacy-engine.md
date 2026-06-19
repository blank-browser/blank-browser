# Privacy Engine

## Goal

Blank should be private by default while staying compatible enough for daily
browsing. Privacy settings must be understandable, reversible, and honest.

## Principles

- No data selling.
- No ad business.
- No invasive telemetry.
- No forced account.
- Local-first where practical.
- Sync optional.
- Sync encrypted before upload.
- Security updates mandatory.
- Privacy claims backed by implementation and tests.

## Privacy Modes

### Standard

Default mode.

Behavior:

- block ads.
- block common trackers.
- block known malicious domains.
- limit third-party cookies where compatibility allows.
- keep most sites working.
- avoid uncommon fingerprinting changes that make users stand out.

### Strict

Higher privacy, expected site breakage.

Behavior:

- stronger tracker blocking.
- stricter third-party cookie rules.
- stricter fingerprinting defenses.
- stronger referrer trimming.
- more aggressive script/resource blocking options.

### Burner

Temporary identity.

Behavior:

- isolated session.
- isolated cookies.
- isolated cache/storage.
- deleted on close.
- no sync writes by default.

### Workspace Identity

Future feature.

Behavior:

- separate cookies per workspace.
- separate sessions.
- separate storage.
- optional separate bookmark groups.
- useful for work, personal, clients, trading, and development contexts.

## Implementation Layers

Prefer low-maintenance layers first:

1. Chromium preferences.
2. Chromium enterprise policy-like controls where useful.
3. feature flags.
4. network request hooks.
5. content settings.
6. source patches.

Avoid deep source patches until the behavior cannot be achieved cleanly through
supported Chromium surfaces.

## Telemetry Policy

MVP default:

- no product analytics.
- no personal browsing telemetry.
- no hidden affiliate/referral changes.
- crash reporting disabled unless user explicitly opts in.

Later optional diagnostics may exist only if:

- opt-in.
- minimal.
- documented.
- easy to disable.
- no browsing history or page content.
- retention window defined.

## Google Services

Blank should not promise that every Google integration remains active.

Required distinctions:

- Google websites login should work like normal browsing.
- Google OAuth can be used later for Blank account identity.
- Chrome Sync is not supported and should not be promised.
- Blank sync must be its own encrypted system.

## Defaults To Review In Chromium

Initial audit areas:

- metrics and crash reporting.
- search provider defaults.
- prerender/preload behavior.
- third-party cookies.
- Safe Browsing or replacement strategy.
- spellcheck services.
- translation services.
- background networking.
- component updater.
- account/sign-in surfaces.
- extension update behavior.
- new tab remote content.

## Safety Warning

Removing a Google service is not automatically a security improvement. Some
services, such as malware/phishing protection and component updates, may provide
real protection. Replace or disable them only with a documented tradeoff.

