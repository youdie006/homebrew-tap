# homebrew-tap

Homebrew formulae for [sessionwiki](https://github.com/youdie006/sessionwiki).

```console
brew install youdie006/tap/sessionwiki
```

## Bumping a release

Update `version`, the three `url` tags, and the three `sha256` values in
`Formula/sessionwiki.rb` from the new release's `.sha256` assets:

```console
gh release download vX.Y.Z --repo youdie006/sessionwiki --pattern '*.sha256' -O -
```
