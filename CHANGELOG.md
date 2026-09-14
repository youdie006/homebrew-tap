# Changelog

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
