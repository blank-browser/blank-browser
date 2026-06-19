# Branding Patch

## Done

Blank Browser now has a first coherent local branding pass:

- visible product identity is `Blank Browser` in Windows version metadata.
- `chrome.exe`, `chrome.dll`, `chrome_proxy.exe`, and
  `chrome_pwa_launcher.exe` report Blank Browser metadata.
- Chromium product logo assets were replaced with the current `blanklogo.png`.
- Windows `.ico`, document/PDF icons, start tile assets, and product logo PNGs
  are Blank-branded.
- tab UI is no longer stock Chrome: squarer tabs, no tab overlap, thinner
  separators, Blank-blue active tab, stronger active stroke.
- browser shell color is more Blank-like: dark neutral frame/toolbar, dark
  omnibox, blue focus/accent treatment.
- installer wrapper uses Blank Browser name, icon, and wizard imagery.

## Patch Files

Apply in order on top of the local Chromium base used for this branch:

```txt
patches/branding/001-blank-product-identity.patch
patches/branding/002-blank-basic-icons.patch
patches/branding/003-updated-logo-square-tabs.patch
patches/branding/004-blank-shell-colors.patch
```

## Still Pending

These are intentionally deferred:

- rename runtime executable from `chrome.exe` to `blank.exe`.
- replace every remaining safe user-facing `Chrome` or `Chromium` string.
- audit installer registry keys, AppUserModelIDs, shortcut names, protocol
  handlers, file associations, uninstall entry, and default-browser prompts.
- replace default first-run/new-tab experience with a Blank-owned local page.
- decide final app id, install directory, publisher identity, signing identity,
  and updater identity.
- add automated smoke tests for name/icon/window/install assertions.

## String Policy

Not every `Chrome` string is user-facing. Some identifiers are code contracts,
protocols, namespaces, or upstream assumptions. Brand replacements should be
small, reviewed, and covered by a build plus launch smoke test.
