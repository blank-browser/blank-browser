# Adblock Engine

## Goal

Blank should block ads, common trackers, and known malicious domains by default
without becoming noisy or exaggerated.

## MVP Behavior

- network request blocking.
- tracker domain blocking.
- malicious domain list support.
- EasyList/EasyPrivacy-compatible filter ingestion if licensing allows.
- per-site disable.
- basic blocked-item counter.
- filter update cadence.
- allowlist for broken sites.

Cosmetic filtering and scriptlet injection can come after network blocking is
stable.

## Engine Requirements

The blocking engine should support:

- fast network request classification.
- common filter-list syntax.
- domain and tracker rules.
- per-site exceptions.
- updateable list data.
- a path to cosmetic filtering after network blocking is stable.

## Filter Lists

Initial candidates:

- EasyList.
- EasyPrivacy.
- malware/domain blocklist source to be selected.
- Blank-owned emergency allowlist/blocklist.

Before shipping:

- confirm licenses.
- document update URL ownership.
- pin list versions in build metadata.
- validate filter parser behavior.
- add rollback path for bad list updates.

EasyList reference:

- https://easylist.to/

## Browser Integration Points

Likely integration areas:

- request classification before network dispatch.
- per-tab/per-profile settings.
- site exception store.
- filter update component.
- blocked counter UI.
- settings page controls.
- test pages for blocked/allowed behavior.

## Performance Requirements

Adblock must not become the browser bottleneck.

Measure:

- startup cost.
- filter parse time.
- memory held by engine.
- per-request classification latency.
- update/download time.
- impact on top sites.

## Claims Policy

Allowed public claim:

```txt
Designed to load less junk and give users more control over resource usage.
```

Do not claim:

- lowest RAM browser.
- fastest browser.
- blocks everything.
- unbreakable privacy.

Claims require benchmarks.
