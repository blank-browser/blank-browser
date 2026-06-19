# Installer Strategy

## Goal

Blank needs a normal Windows installer that feels like a serious browser
installer and can support updates, uninstall, shortcuts, first-run import, and
default-browser registration.

Target filename format:

```txt
BlankBrowserSetup-BLK010.exe
```

Examples:

```txt
BlankBrowserSetup-BLK001.exe
BlankBrowserSetup-BLK010.exe
BlankBrowserSetup-BLK100.exe
```

## MVP Recommendation

Start with a per-user Windows installer.

Reasons:

- lower friction for testing.
- can avoid admin where possible.
- easier early rollout.
- simpler for limited test users.

Machine-wide install should come later.

## Installer Flow

Expected behavior:

1. user runs `BlankBrowserSetup-BLK010.exe`.
2. installer verifies payload/signature.
3. install progress shown.
4. shortcuts created if selected.
5. Blank launches after install unless disabled.
6. first-run import prompt appears.
7. user can choose default browser.

## Technology Options

### Chromium mini_installer

Use as first reference.

Pros:

- native to Chromium.
- understands Chromium packaging assumptions.
- good path for browser-specific packaging.

Cons:

- branding and update integration require real Chromium knowledge.
- not a polished custom installer UX by itself.
- may be harder to adapt before Blank identity stabilizes.

### WiX Toolset

Useful for MSI/MSIX-style enterprise-friendly packaging.

Pros:

- builds MSI, setup bundles, patches.
- works with command line, MSBuild, Visual Studio, and CI.
- Burn bootstrapper can bundle or download prerequisites.

Cons:

- more ceremony.
- not browser-native.
- requires update integration design.

Source:

- https://docs.firegiant.com/wix/

### Inno Setup

Useful for fast early EXE installer.

Pros:

- simple.
- common.
- supports command-line install options.

Cons:

- not MSI-native.
- update integration must be designed separately.
- enterprise deployment less ideal than MSI.

Source:

- https://jrsoftware.org/ishelp/

### NSIS

Useful for compact scripted installer.

Pros:

- flexible.
- common for EXE installers.

Cons:

- script maintenance.
- logging/silent behavior must be designed carefully.
- update integration separate.

Source:

- https://nsis.sourceforge.io/Docs/

## Code Signing

Public builds must be signed.

Windows Authenticode identifies publisher and verifies that signed software has
not changed after signing.

Source:

- https://learn.microsoft.com/en-us/windows-hardware/drivers/install/authenticode

Unsigned builds are acceptable only for local development. Public releases
should wait for a proper certificate and signing pipeline.

## Open Questions

- company/publisher legal name.
- certificate type and purchasing path.
- per-user install path.
- machine-wide install timeline.
- updater implementation.
- silent install requirements.
- enterprise policy needs.

## First Installer Milestone

1. build stock Chromium `mini_installer`.
2. inspect installed files and registry entries.
3. document what must change for Blank identity.
4. create per-user Blank installer prototype.
5. sign test build with a test certificate.
6. validate install, launch, update placeholder, uninstall.
