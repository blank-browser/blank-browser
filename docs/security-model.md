# Security Model

## Core Position

Blank inherits much of its security from Chromium. The safest fork is one that
stays close enough to Chromium to merge security updates quickly.

## Security Priorities

1. fast Chromium security merges.
2. sandbox preserved.
3. site isolation preserved.
4. safe update mechanism.
5. signed binaries.
6. no risky wrapper architecture.
7. no remote code in first-run/new-tab surfaces.
8. no invasive telemetry.
9. minimal privileged Blank-specific code.

## Do Not Break

- Chromium process sandbox.
- site isolation.
- certificate validation.
- extension permission model.
- safe browsing or replacement strategy without clear review.
- component updater decisions without replacement plan.
- auto-update security.

## Threats

- outdated Chromium base.
- malicious update package.
- compromised update manifest.
- unsafe extension behavior.
- adblock filter update abuse.
- sync server compromise.
- local profile theft.
- telemetry/log leakage.
- accidental Google/service traffic contrary to product promise.

## Required Reviews

Security review required before:

- changing updater.
- changing networking stack.
- adding sync.
- syncing passwords.
- changing certificate behavior.
- adding native messaging.
- changing extension permissions.
- adding remote config.
- adding crash/diagnostics upload.

## Security Update SLA

Target:

- critical Chromium security update: same day triage.
- high severity update: patch branch within 48 hours.
- public Stable release: as soon as smoke/update tests pass.

This requires automation before broad release.

