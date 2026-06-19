# Windows Packaging

Windows packaging assets and notes for Blank Browser.

Current local installer name:

```txt
BlankBrowserSetup-BLK010.exe
```

Current packaging approach:

- build Chromium `mini_installer`.
- wrap it with `packaging/windows-wizard.iss`.
- use Blank Browser icon and wizard artwork.
- keep generated installers in ignored `dist/`.

See:

- ../../docs/installer-build.md
- ../../docs/installer-strategy.md
- ../../docs/update-strategy.md
