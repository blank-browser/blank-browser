# Next Steps

## Immediate

1. Create a separate optimized build output, for example `out\BlankRelease`,
   instead of changing `out\Default`.
2. Decide final Windows identity: executable name, install directory, app ids,
   registry keys, protocol names, shortcut names, and publisher name.
3. Rename or wrap `chrome.exe` cleanly as `blank.exe`.
4. Audit remaining visible Chrome/Chromium strings and replace only safe ones.
5. Test installer install/uninstall behavior on a clean local profile or VM.
6. Add smoke tests for product name, icon, window title, shortcut, installer
   wizard, and first launch.

## Product Polish

1. Replace first-run/new-tab defaults with a Blank-owned minimal local page.
2. Decide privacy defaults and Google-service behavior.
3. Add local ad/tracker blocking MVP plan to the Chromium patch queue.
4. Define import flow and default-browser prompt behavior.
5. Prepare signing path before public distribution.

## Release Prep

1. Build optimized prototype.
2. Produce signed installer.
3. Generate release manifest with hashes and patch commit ids.
4. Run install/uninstall smoke tests.
5. Freeze BLK010 notes, known issues, and rollback plan.
