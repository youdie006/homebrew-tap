# Changelog

## 2026-09-16: swapdex 0.165.3

- Update swapdex 0.165.2 → 0.165.3 so active responses continue beyond the
  header deadline and available SSE headers, heartbeats and completion events
  reach clients immediately. Failed streams close without successful framing;
  healthy connections remain reusable.
- Keep quota inspection read-only for credentials: expired tokens are reported
  without OAuth renewal, credential writes or expired-token usage requests.
- Verify all four official archive URLs/SHA-256 values and the Linux x86_64
  executable version. Upstream PR and merged-source Linux/macOS CI, all four
  release builds, 1,213 local Rust tests and a 305-second stream check pass.
  Ruby syntax and formula mapping checks cover this update; target machines
  use exact npm packages, so a full Homebrew installation is not claimed.
- Upstream: [swapdex v0.165.3](https://github.com/youdie006/swapdex/releases/tag/v0.165.3),
  source `9f01140b411d1690a0fa700842988d4c83d88b8c`,
  [PR #37](https://github.com/youdie006/swapdex/pull/37).

## 2026-09-16: swapdex 0.165.2

- Update swapdex 0.165.1 → 0.165.2 to remove client API-key headers from
  managed Claude/Codex requests. A stale client key no longer conflicts with
  the selected OAuth bearer or incorrectly sidelines a healthy account.
  Explicit passthrough and native authentication exchanges preserve client auth.
- Verify all four official archive URLs/SHA-256 values, Ruby formula syntax,
  diff checks and the Linux x86_64 native version. Upstream Linux/macOS PR
  and merged-source CI, all four release builds and 1,198 local Rust tests pass.
  A full brew install is outside this verification; WSL/M3 use exact npm packages.
- Upstream: [swapdex v0.165.2](https://github.com/youdie006/swapdex/releases/tag/v0.165.2),
  source `6f9e245efa1505782c9cd4ca00b9cd29fc21c1c7`,
  [PR #36](https://github.com/youdie006/swapdex/pull/36).

## 2026-09-16: swapdex 0.165.1

- Update swapdex 0.165.0 → 0.165.1: preserve literal fractional thresholds,
  keep allowed Claude plans available with paid overage disabled, and use the
  renewed credential on the first quota read for both slot layouts.
- Preserve independent concurrent cache observations and settings on lock
  failure. Report rotation causes from actual measurements/refusals.
- Install Homebrew services with a verified stable opt path so removing the
  previous Cellar version does not break their next launch. Upgrade fixtures
  also cover path aliases, spaces, quotes and percent/XML characters.
- Verify all four formula URLs/SHA-256 mappings against downloaded official
  archives and checksum files. Upstream Linux/macOS PR and merged-source CI,
  all four release builds, and local 1,192 Rust tests passed.
- PASS Ruby formula syntax, diff checks and execution of the isolated Linux
  x86_64 binary (`swapdex 0.165.1`). Real target installations use npm; a full
  Homebrew installation is outside this verification.
- Upstream: [swapdex v0.165.1](https://github.com/youdie006/swapdex/releases/tag/v0.165.1),
  source `f3387a09544ae0a253525e2070baa0fb5f44d74a`,
  [PR #35](https://github.com/youdie006/swapdex/pull/35).


## 2026-09-15: swapdex 0.165.0

- Update swapdex 0.164.1 → 0.165.0 so Codex-only users can install their shim
  and complete onboarding without Claude. Available clients get independent
  setup and PATH checks; a later Codex installation preserves the existing
  Claude shim during onboarding.
- Document native login per account slot, shim activation, launch defaults and
  next-request serving selection. Clarify existing-session relaunch and saved
  snapshots instead of promising immediate switching from a direct session.
- Preserve a working shell installation when a download, checksum, staging or
  executable check fails; reject directory targets and quote custom PATH hints.
- Verify all four formula URLs/SHA-256 values against the official release
  archives and checksum files. Ruby syntax and diff checks pass, and the
  isolated Linux x86_64 binary reports 0.165.0.
- Upstream PR and post-merge Linux/macOS CI passed, including all six aliased
  first-use autostart journeys; all four release builds passed. Homebrew itself
  is unavailable on this WSL host, so a Homebrew installation was not run.
- Upstream: [swapdex v0.165.0](https://github.com/youdie006/swapdex/releases/tag/v0.165.0),
  source `2c5c57df4a89bd69b3311b066bd75f3ee288870f`,
  [PR #34](https://github.com/youdie006/swapdex/pull/34).

## 2026-09-15: swapdex 0.164.1

- Update swapdex 0.163.0 → 0.164.1 so an older failing request cannot overwrite
  a newer account selection, and accepted model POSTs are not replayed after an
  ambiguous disconnect. Safe bodyless GET/HEAD retries also handle the macOS
  `Peer disconnected` error.
- Keep Codex user/workspace identities separate and coordinate copied refresh
  tokens across processes. Reject stale refresh results after credentials change,
  preserve future quota reset times, and prevent unreadable Claude slots from
  reusing an older account's cached credential.
- Preserve the launch home in generated swap commands, quote service paths,
  resolve native executables consistently, and fix session search limits,
  symlink cycles and timed-out search child processes.
- Verify all four formula URLs and SHA-256 values against the official release
  archives and checksum files. Ruby syntax and diff checks pass; the isolated
  Linux x86_64 executable reports 0.164.1.
- Homebrew installation was not run on this WSL host, which has no `brew`
  executable. Upstream Linux/macOS CI and all four release builds passed.
  The 0.164.0 validation candidate was superseded before package publication.
- Upstream: [swapdex v0.164.1](https://github.com/youdie006/swapdex/releases/tag/v0.164.1),
  source `cc864aaaeaa9ec8f251134ce9e90e51379b5b3ef`,
  [PR #31](https://github.com/youdie006/swapdex/pull/31) and
  [PR #33](https://github.com/youdie006/swapdex/pull/33).

## 2026-09-15: swapdex 0.163.0

- Update swapdex 0.162.0 → 0.163.0 so Claude credential snapshots read the
  identity and credential from the same selected account. Managed children no
  longer inherit a secure-storage override that can redirect them to another
  account, and rooted library operations remain isolated from the machine
  Keychain.
- Stop managed Claude and Codex launches when proxy startup fails or returns an
  invalid port, preventing fallback to a different native login. Actual Claude
  auth commands and explicit provider choices still run directly, while prompt
  text and option values cannot accidentally bypass account routing.
- Send named-account login runs to the native executable and report a missing
  native tool instead of recursively invoking the managed shim. Explicitly
  release store, credential and registry locks when each account operation ends.
- Verify all four formula URLs and SHA-256 values against the official release
  downloads and their published checksum files. Ruby syntax and diff checks
  pass; the isolated Linux x86_64 executable reports 0.163.0.
- Homebrew installation and macOS or ARM64 execution were not run on this WSL
  host, which has no `brew` executable. Upstream post-merge CI and all four
  release builds passed.
- Upstream: [swapdex v0.163.0](https://github.com/youdie006/swapdex/releases/tag/v0.163.0),
  source `855e85c965bcf73907ec5d24033ac23704114836`,
  [PR #30](https://github.com/youdie006/swapdex/pull/30).

## 2026-09-15: swapdex 0.162.0

- Update swapdex 0.160.0 → 0.162.0 to restore Codex session search and resume
  across account changes. The launcher keeps a stable provider and repairs old
  provider metadata with private recovery backups while preserving conversations.
- Include the native-login and renewal ownership fixes from 0.161.0.
- Verify all four formula URLs and SHA-256 values against the official release
  downloads and their published checksum files. Ruby syntax and diff checks
  pass; the Linux binary reports 0.162.0 and its isolated repair preview succeeds.
- Homebrew installation and macOS execution were not run on this WSL host,
  which has no `brew` executable. Both upstream CI platforms and all four
  release builds passed.
- Upstream: [swapdex v0.162.0](https://github.com/youdie006/swapdex/releases/tag/v0.162.0),
  source `72bf8020ffb9f82825ced5e5cc709911f49d08a6`,
  [PR #29](https://github.com/youdie006/swapdex/pull/29).

## 2026-09-15: sessionwiki 0.28.0 and swapdex 0.160.0

- Update sessionwiki 0.27.0 → 0.28.0 so large MCP turn responses remain valid
  JSON when escaping expands their content beyond the transport limit.
- Update swapdex 0.156.0 → 0.160.0 so Homebrew users receive provider-scoped
  account selection and health, persistent renewal rejection/deferral visibility,
  failed manual-renewal exit status, and early-curl-exit crash protection.
  The release also patches rustls and lru security advisories.
- Verify all seven formula URL/checksum mappings against downloaded official
  archives. Ruby syntax and diff checks pass. The official Linux executables
  pass isolated CLI/MCP acceptance, including the MCP JSON boundary and curl
  closing stdin before reading its synthetic request.
- Homebrew itself and macOS executables were not run on this WSL host because
  `brew` is unavailable. Upstream Linux/macOS CI and all release builds passed.
- Sources: [sessionwiki v0.28.0](https://github.com/youdie006/sessionwiki/releases/tag/v0.28.0),
  `e16a6ed82e9511df573c6b3c57040bf8affca9fc`;
  [swapdex v0.160.0](https://github.com/youdie006/swapdex/releases/tag/v0.160.0),
  `4e41d25063a2a5cf44c94c19b950365d0f36aefe`.

## 2026-09-15

- Update sessionwiki from 0.24.0 to 0.27.0 for macOS ARM64, macOS x86_64 and
  Linux x86_64. Homebrew installs now receive the fixes for redaction before
  truncation, stale swapdex account badges after serving is disabled, and
  incomplete discovery incorrectly removing live sessions.
- Verify each formula URL and SHA-256 against its downloaded official release
  archive. `ruby -c Formula/sessionwiki.rb` and `git diff --check` pass.
  The official Linux binary also passes isolated CLI/MCP acceptance checks.
  Homebrew installation and macOS execution were not run on this WSL host,
  which has no `brew` executable.
- Upstream release: [sessionwiki 0.27.0](https://github.com/youdie006/sessionwiki/releases/tag/v0.27.0),
  source `ea0aec810e8f7ba48382b59e105d029051aaecb6`.
