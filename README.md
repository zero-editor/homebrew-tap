# homebrew-zero

The Homebrew cask for [zero](https://github.com/zero-editor/zero).

```sh
brew install --cask zero-editor/zero/zero
```

zero isn't signed — signing it properly needs an Apple Developer account — so
macOS quarantines the dmg when a browser downloads it and then refuses to open
the app, with a message that says "damaged" rather than "unsigned". Homebrew
clears the quarantine flag itself, which is the whole reason this tap exists.

The cask points at the release the [zero
repository](https://github.com/zero-editor/zero/releases) builds from its tag.
