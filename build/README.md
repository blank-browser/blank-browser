# Build Notes

This repository does not contain the full Chromium checkout or build output.

Recommended layout:

```txt
<blank-browser-repo>     product docs, patches, packaging, assets
<chromium-src>           local Chromium source checkout
<chromium-src>\out\...   local Chromium build outputs
```

Keep Chromium build outputs outside this small repo. Store only repeatable docs,
scripts, branding assets, patch files, and packaging configuration here.
