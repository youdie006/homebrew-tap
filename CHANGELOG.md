# Changelog

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
