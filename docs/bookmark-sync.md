# Bookmark Sync

## Decision

Blank must not promise Chrome Sync.

MVP sync should be bookmark-only and encrypted before upload. Account identity
and sync encryption are separate concerns.

## Identity Options

Supported later:

- Blank account email/password or passkey.
- Google OAuth for authentication only.

Not supported:

- Chrome Sync.
- reading Google Chrome synced data directly.
- using Google account as encryption trust root.

## MVP Data Scope

Sync first:

- bookmarks.
- bookmark folders.
- bookmark order.
- bookmark metadata required for merge.

Do not sync in MVP:

- passwords.
- browsing history.
- open tabs.
- sessions.
- extensions.
- payment data.

## Encryption Model

Recommended model:

```txt
user signs in
  -> client derives or unlocks sync key
  -> bookmark tree serialized
  -> encrypted locally
  -> encrypted blob uploaded
  -> server stores opaque data
```

Server should not be able to read bookmark contents.

Key storage options:

- passphrase-derived key for true end-to-end encryption.
- OS-protected local secret using Windows DPAPI for local persistence.
- recovery key or recovery phrase later.

Do not silently reset encryption keys.

## Data Model

Bookmark object:

```json
{
  "id": "stable-client-generated-id",
  "parentId": "folder-id",
  "type": "bookmark",
  "title": "Example",
  "url": "https://example.com",
  "createdAt": "2026-06-18T00:00:00Z",
  "updatedAt": "2026-06-18T00:00:00Z",
  "deleted": false,
  "version": 1
}
```

Folder object:

```json
{
  "id": "folder-id",
  "parentId": "root",
  "type": "folder",
  "title": "Work",
  "children": ["bookmark-id"],
  "updatedAt": "2026-06-18T00:00:00Z",
  "version": 1
}
```

## Conflict Strategy

MVP:

- last-writer-wins for title/url changes.
- preserve both copies for same-parent ordering conflicts.
- tombstones for deletes.
- manual recovery folder if merge uncertainty is high.

Later:

- CRDT-style bookmark tree.
- device-level change clocks.
- conflict UI.

## Sync API Sketch

Endpoints:

```txt
POST /v1/sync/bookmarks/pull
POST /v1/sync/bookmarks/push
POST /v1/sync/bookmarks/commit
GET  /v1/sync/status
```

Payloads should be encrypted blobs plus metadata:

- account id.
- device id.
- blob version.
- schema version.
- changed timestamp.
- hash.
- encrypted payload.

No raw URLs or titles in server logs.

## Security Requirements

- TLS.
- encrypted blobs at rest.
- per-device auth tokens.
- token revocation.
- sync disabled by default until user opts in.
- clear "delete server data" flow.
- export bookmarks locally without sync.

