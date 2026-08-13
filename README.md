# homebrew-tap

The Homebrew cask for [zero](https://github.com/zero-editor/zero).

```sh
brew install --cask zero-editor/tap/zero
```

Write it fully qualified like that. Homebrew refuses casks from non-official
taps unless you name the tap on the command line — naming it *is* the consent
signal — so the prefix is what lets this be one command instead of a `brew tap`
and a `brew trust` first.

The dmg is signed with an Apple Developer ID and notarized, so macOS opens it
without a warning and without anything to clear first.

The cask pins both the version and the dmg's sha256, and does not follow
releases on its own: a new tag in the [zero
repository](https://github.com/zero-editor/zero/releases) means bumping both
here too, or `brew install` goes on handing people the old dmg.
