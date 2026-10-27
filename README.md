# Leo Yi's Homebrew Tap

## Formulae

### git-sweep-rs

Clean up merged Git branches locally and on the remote.
Project: <https://github.com/leo-yi/git-sweep-rs>

```bash
brew install leo-yi/tap/git-sweep-rs
```

Or:

```bash
brew tap leo-yi/tap
brew install git-sweep-rs
```

In a `Brewfile`:

```ruby
tap "leo-yi/tap"
brew "git-sweep-rs"
```

## Maintainer notes

The formula downloads the prebuilt release assets from GitHub, so a new upstream
release means updating the version (in the three asset URLs) and the three
`sha256` values in `Formula/git-sweep-rs.rb` by hand. Automatic bumping is not
available for formulae with multiple URLs.

```bash
curl -sL https://github.com/leo-yi/git-sweep-rs/releases/download/vX.Y.Z/SHA256SUMS
```

After editing, verify:

```bash
brew audit --strict leo-yi/tap/git-sweep-rs
brew reinstall leo-yi/tap/git-sweep-rs && brew test git-sweep-rs
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
